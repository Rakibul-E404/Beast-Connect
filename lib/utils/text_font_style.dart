import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFontStyle {
  //Initialising Constractor
  TextFontStyle._();

  static final textStyle18WhiteInterw500 = TextStyle(
    fontFamilyFallback: const ['Inter', 'Satoshi'],
    color: Colors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
}
