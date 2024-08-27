import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/size_manager.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key,
    required this.image,
    this.aspectRation = 2 / 3,
    this.borderRadius = SizeManager.s12,
  });
  final String image;
  final double aspectRation;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRation,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SizeManager.s6),
        child: CachedNetworkImage(imageUrl: image, fit: BoxFit.fill),
      ),
    );
  }
}
