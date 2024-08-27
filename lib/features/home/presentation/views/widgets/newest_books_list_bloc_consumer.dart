import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/newest_books_cubit/newest_books_cubit.dart';
import 'newest_books_list.dart';

class NewestBooksListBlocConsumer extends StatefulWidget {
  const NewestBooksListBlocConsumer({
    super.key,
  });

  @override
  State<NewestBooksListBlocConsumer> createState() =>
      _NewestBooksListBlocConsumerState();
}

class _NewestBooksListBlocConsumerState
    extends State<NewestBooksListBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
        listener: (context, state) {
      if (state is NewestBooksSuccess) {
        books.addAll(state.books);
      }
    }, builder: (context, state) {
      if (state is NewestBooksSuccess ||
          state is NewestBooksPaginationLoading ||
          state is NewestBooksPaginationFailure) {
        return NewestBooksList(books: books);
      } else if (state is NewestBooksFailure) {
        return Text(state.errorMessage);
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
