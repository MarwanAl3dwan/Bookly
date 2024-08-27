import 'package:flutter/material.dart';

import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/widgets/custom_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          text: '$price €',
          color: ColorsManager.secondary,
          textColor: ColorsManager.black,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        const CustomButton(
          text: 'Free preview',
          color: ColorsManager.pink,
          textColor: ColorsManager.secondary,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
      ],
    );
  }
}
