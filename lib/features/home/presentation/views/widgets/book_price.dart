import 'package:flutter/material.dart';

import '../../../../../core/utils/styles_manager.dart';

class BookPrice extends StatelessWidget {
  const BookPrice({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$price €',
      style: StylesManager.textStyle20.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
