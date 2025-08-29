import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/text_font_style.dart';

class CustomGradientBorderButton extends StatelessWidget {
  final void Function()? onTap;
  final List<Color>? gradientColors;
  final AlignmentGeometry? gradientBegin;
  final AlignmentGeometry? gradientEnd;
  final String? buttonTitle;
  final TextStyle? textStyle;
  final double? outerContainerBorderRadius;
  final double? inerContainerBorderRadius;

  const CustomGradientBorderButton({
    super.key,
    this.onTap,
    this.gradientColors,
    this.gradientBegin,
    this.gradientEnd,
    this.buttonTitle,
    this.textStyle,
    this.outerContainerBorderRadius,
    this.inerContainerBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            outerContainerBorderRadius ?? 32.r,
          ),
          gradient: LinearGradient(
            colors:
                gradientColors ??
                [AppColors.primaryColor, AppColors.secondaryColor],
            begin: gradientBegin ?? Alignment.centerLeft,
            end: gradientEnd ?? Alignment.centerRight,
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(2.sp),
          padding: EdgeInsets.symmetric(vertical: 15.h),
          decoration: BoxDecoration(
            color: AppColors.boxContainerColor,
            borderRadius: BorderRadius.circular(
              inerContainerBorderRadius ?? 30.r,
            ),
          ),
          child: Text(
            buttonTitle ?? "",
            textAlign: TextAlign.center,
            style: textStyle ?? TextFontStyle.textStyle14WhiteInterw600,
          ),
        ),
      ),
    );
  }
}



// [AppColors.primaryColor, AppColors.secondaryColor]