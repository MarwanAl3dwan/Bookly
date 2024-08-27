import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/size_manager.dart';
import 'book_list_item.dart';

class NewestBooksList extends StatelessWidget {
  const NewestBooksList({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeManager.s30),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: SizeManager.s20),
            child: BookListItem(book: books[index]),
          );
        },
      ),
    );
  }
}

class BookModel {
  String image;
  String bookTitle;
  String authorName;
  double bookPrice;
  double bookRating;
  int numOfRaters;

  BookModel({
    required this.image,
    required this.bookTitle,
    required this.authorName,
    required this.bookPrice,
    required this.bookRating,
    required this.numOfRaters,
  });
}
