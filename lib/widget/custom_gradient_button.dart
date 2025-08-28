import 'package:beast_connect/utils/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevetedButton extends StatelessWidget {
  final String buttonTitle;
  final double? borderRadius;
  final void Function()? onTap;
  const CustomElevetedButton({
    super.key,
    required this.buttonTitle,
    this.borderRadius,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(minHeight: 48.h),
        padding: EdgeInsets.symmetric(vertical: 14.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF7900), Color(0xFF1FC4FF)],
          ),
          // color: controller.agreeToTerms.value ? null : Colors.grey,
          borderRadius: BorderRadius.circular((borderRadius ?? 30).r),
        ),

        // add padding here for button height
        child: Text(
          buttonTitle,
          style: TextFontStyle.textStyle14WhiteInterw600,
        ),
      ),
    );
  }
}
