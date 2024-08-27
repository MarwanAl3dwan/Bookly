import 'package:bookly/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/size_manager.dart';
import '../../../../../core/utils/styles_manager.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    required this.rating,
    required this.numOfRaters,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
  });

  final double rating;
  final int numOfRaters;
  final MainAxisAlignment rowMainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: rowMainAxisAlignment,
      children: [
        const Icon(
          Icons.star,
          color: ColorsManager.starColor,
        ),
        const SizedBox(width: SizeManager.s6),
        Text('$rating', style: StylesManager.textStyle16),
        const SizedBox(width: SizeManager.s5),
        Text(
          '($numOfRaters)',
          style: StylesManager.textStyle14.copyWith(
            color: ColorsManager.darkGrey,
          ),
        ),
      ],
    );
  }
}
