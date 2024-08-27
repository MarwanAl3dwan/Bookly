import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_list_item_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/size_manager.dart';

class BookListItem extends StatelessWidget {
  const BookListItem(
      {super.key, this.itemHeight = SizeManager.s130, required this.book});

  final double itemHeight;
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailsView, extra: book);
      },
      child: Row(
        children: [
          SizedBox(
            height: itemHeight,
            child: CustomBookImage(
              image: book.image!,
              aspectRation: 2 / 3.2,
            ),
          ),
          const SizedBox(width: SizeManager.s30),
          BookListItemInfo(book: book),
        ],
      ),
    );
  }
}
