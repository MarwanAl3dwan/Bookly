import 'dart:developer';

import 'package:bookly/features/home/domain/usecases/fetch_featured_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await featuredBooksUseCase.execute(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FeaturedBooksFailure(failure.message));
        } else {
          emit(FeaturedBooksPaginationFailure(failure.message));
        }
      },
      (books) {
        List<BookEntity> validBooks =
            books.where((book) => book.image?.isNotEmpty ?? false).toList();
        emit(FeaturedBooksSuccess(validBooks));
      },
    );
  }
}
