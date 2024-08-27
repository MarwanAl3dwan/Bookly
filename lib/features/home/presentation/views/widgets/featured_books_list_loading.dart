import 'package:flutter/material.dart';

import '../../../../../core/utils/size_manager.dart';
import 'custom_book_image_loading.dart';

class FeaturedBooksListLoading extends StatelessWidget {
  const FeaturedBooksListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.26,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: index == 0
                ? const EdgeInsets.only(right: SizeManager.s12)
                : const EdgeInsets.only(
                    right: SizeManager.s12,
                    top: SizeManager.s12,
                    bottom: SizeManager.s12,
                  ),
            child: const CustomBookImageLoading(),
          );
        },
      ),
    );
  }
}
