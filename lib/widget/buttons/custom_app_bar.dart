import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.photoBoxColor,
          size: 20.sp,
        ),
        onPressed: () => Get.back(),
      ),
      centerTitle: true,
      title: Text(title, style: TextFontStyle.textStyle18WhiteInterw500),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
