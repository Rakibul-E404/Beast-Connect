import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/app_list.dart';
import 'package:beast_connect/utils/ui_helper.dart';
import 'package:beast_connect/widget/buttons/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/text_font_style.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ///AppBar
                CustomAppBar(title: "Terms & conditions"),
                UIHelper.verticalSpace(20.h),

                ///Terms & Conditions Body
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Terms & conditions\n",
                        style: TextFontStyle.textStyle18WhiteInterw500,
                      ),
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 6.h),
                          height: 1,
                        ),
                      ),
                      TextSpan(
                        text: "last Update Feb 2025",
                        style: TextFontStyle.textStyle14WhiteInterw400,
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(24.h),

                ///Text : Terms & Conditions Body
                Text(
                  AppList.testText,
                  textAlign: TextAlign.start,
                  style: TextFontStyle.textStyle14WhiteInterw400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
