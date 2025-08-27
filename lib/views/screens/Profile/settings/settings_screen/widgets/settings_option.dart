import 'package:beast_connect/utils/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMenuButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const CustomMenuButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.white),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ///Option : Icon
                Icon(icon, size: 24.sp, color: Colors.white),
                SizedBox(width: 12.w),

                ///Option : Label
                Text(label, style: TextFontStyle.textStyle18WhiteInterw500),
              ],
            ),

            ///Trailing Icon
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
