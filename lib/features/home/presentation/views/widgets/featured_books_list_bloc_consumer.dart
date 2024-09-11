import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_books_list_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/featured_books_cubit/featured_books_cubit.dart';
import 'featured_books_list.dart';

class FeaturedBooksListBlocConsumer extends StatefulWidget {
  const FeaturedBooksListBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListBlocConsumer> createState() =>
      _FeaturedBooksListBlocConsumerState();
}

class _FeaturedBooksListBlocConsumerState
    extends State<FeaturedBooksListBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksList(books: books);
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return const FeaturedBooksListLoading();
        }
      },
    );
  }
}
