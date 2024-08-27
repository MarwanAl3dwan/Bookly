import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/size_manager.dart';

class CustomBookImageLoading extends StatelessWidget {
  const CustomBookImageLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SizeManager.s6),
        child: SizedBox(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[100]!,
            highlightColor: Colors.grey[400]!,
            child: Container(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
