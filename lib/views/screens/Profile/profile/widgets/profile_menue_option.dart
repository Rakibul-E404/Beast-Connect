import 'package:beast_connect/utils/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenueOption extends StatelessWidget {
  final String buttonTitle;
  final IconData prefixIcon;
  final VoidCallback onTap;
  const ProfileMenueOption({
    super.key,
    required this.buttonTitle,
    required this.prefixIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(32.r), // Ensure the tap area is rounded
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(prefixIcon, size: 24.sp, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  buttonTitle,
                  style: TextFontStyle.textStyle16WhiteInterw500,
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
