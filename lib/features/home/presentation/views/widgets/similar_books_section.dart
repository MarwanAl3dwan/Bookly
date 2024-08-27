import 'package:flutter/material.dart';

import '../../../../../core/utils/size_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import 'similar_books_list.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: StylesManager.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SizeManager.s10),
        const SimilarBooksList(),
      ],
    );
  }
}
