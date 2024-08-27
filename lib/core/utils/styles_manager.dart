import 'package:bookly/core/utils/constants_manager.dart';
import 'package:bookly/core/utils/size_manager.dart';
import 'package:flutter/material.dart';

abstract class StylesManager {
  static const textStyle14 = TextStyle(
    fontSize: SizeManager.s14,
    fontWeight: FontWeight.normal, // regular
  );

  static const textStyle16 = TextStyle(
    fontSize: SizeManager.s16,
    fontWeight: FontWeight.bold, // bold
  );

  static const textStyle18 = TextStyle(
    fontSize: SizeManager.s18,
    fontWeight: FontWeight.w600, // Semi-bold
  );

  static const textStyle20 = TextStyle(
    fontSize: SizeManager.s20,
    fontWeight: FontWeight.bold, // bold
  );

  static const textStyle30 = TextStyle(
    fontSize: SizeManager.s30,
    fontWeight: FontWeight.bold, // regular
    fontFamily: ConstantsManager.gtSectraFineFont,
  );
}
