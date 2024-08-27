import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/size_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import 'book_ratings.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.2,
            vertical: SizeManager.s14,
          ),
          child: CustomBookImage(image: bookEntity.image!),
        ),
        Center(
          child: Text(
            bookEntity.title,
            style: StylesManager.textStyle30,
          ),
        ),
        const SizedBox(height: SizeManager.s6),
        Center(
          child: Text(
            bookEntity.authorName!,
            style: StylesManager.textStyle18.copyWith(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: ColorsManager.lightGrey,
            ),
          ),
        ),
        const SizedBox(height: SizeManager.s16),
        BookRating(
          rating: bookEntity.rating?.toDouble() ?? 4.7,
          numOfRaters: 2340,
          rowMainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
    );
  }
}
