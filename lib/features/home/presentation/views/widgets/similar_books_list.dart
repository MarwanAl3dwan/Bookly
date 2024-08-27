import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/size_manager.dart';
import 'custom_book_image.dart';

class SimilarBooksList extends StatelessWidget {
  const SimilarBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,
      child: ListView.builder(
        itemCount: AssetsManager.imagesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              right: SizeManager.s12,
              top: SizeManager.s12,
              bottom: SizeManager.s12,
            ),
            child: CustomBookImage(
              image: AssetsManager.imagesList[index],
              borderRadius: 7,
              aspectRation: 2 / 3.2,
            ),
          );
        },
      ),
    );
  }
}
