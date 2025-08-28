import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/text_font_style.dart';

class CustomElevetedButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonTitle;
  final double? verticalPadding;
  final double? horizontalPadding;
  final bool isBorderColorUsed;
  final double? borderRadius;
  final TextStyle? textStyle;

  const CustomElevetedButton({
    super.key,
    this.onTap,
    required this.buttonTitle,
    this.verticalPadding,
    this.horizontalPadding,
    this.isBorderColorUsed = false,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 6.h,
          horizontal: horizontalPadding ?? 14.w,
        ),
        decoration: BoxDecoration(
          border: isBorderColorUsed
              ? Border.all(color: AppColors.primaryColor)
              : null,
          borderRadius: BorderRadius.circular(borderRadius ?? 24.r),
        ),
        child: Text(
          buttonTitle,
          style: TextFontStyle.textStyle10WhiteInterw400,
        ),
      ),
    );
  }
}
