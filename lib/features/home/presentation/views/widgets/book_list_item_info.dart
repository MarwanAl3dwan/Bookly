import 'package:flutter/material.dart';

import '../../../../../core/utils/constants_manager.dart';
import '../../../../../core/utils/size_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../domain/entities/book_entity.dart';
import 'book_price.dart';
import 'book_ratings.dart';

class BookListItemInfo extends StatelessWidget {
  const BookListItemInfo({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            book.title,
            style: StylesManager.textStyle20.copyWith(
              fontFamily: ConstantsManager.gtSectraFineFont,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(height: SizeManager.s3),
          Text(
            book.authorName ?? 'Author Name',
            style:
                StylesManager.textStyle14.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: SizeManager.s3),
          Row(
            children: [
              BookPrice(price: book.price?.toDouble() ?? 10.0),
              const Spacer(),
              BookRating(
                rating: book.rating?.toDouble() ?? 4.7,
                numOfRaters: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}
