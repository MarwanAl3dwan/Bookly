import 'package:bookly/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.borderRadius,
    required this.color,
    required this.textColor,
    required this.text,
  });

  final BorderRadiusGeometry borderRadius;
  final Color color;
  final Color textColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 152,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          backgroundColor: color,
          foregroundColor: textColor,
        ),
        onPressed: () {},
        child: Text(
          text,
          style: StylesManager.textStyle16,
        ),
      ),
    );
  }
}
