import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/app_list.dart';
import 'package:beast_connect/utils/text_font_style.dart';
import 'package:beast_connect/utils/ui_helper.dart';
import 'package:beast_connect/widget/buttons/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Appbar
                CustomAppBar(title: "Privacy policy"),
                UIHelper.verticalSpace(20.h),

                ///Privacy Policy Last Updated Date
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Privacy Policy\n",
                        style: TextFontStyle.textStyle14WhiteInterw600,
                      ),
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 6.h),
                          height: 1,
                        ),
                      ),
                      TextSpan(
                        text: "Last Update Feb 2025",
                        style: TextFontStyle.textStyle14WhiteInterw600.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(24.h),

                Text(
                  AppList.testText,
                  style: TextFontStyle.textStyle14WhiteInterw600,
                ),
                UIHelper.verticalSpace(20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
