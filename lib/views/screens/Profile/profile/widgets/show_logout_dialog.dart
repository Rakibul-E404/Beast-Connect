import 'package:beast_connect/auth/signIn_screen_ui.dart';
import 'package:beast_connect/utils/ui_helper.dart';
import 'package:beast_connect/widget/custom_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/text_font_style.dart';
import '../../../../../widget/custom_gradient_border_button.dart';
import '../../../../../widget/my_custom_eleveted_button.dart';

class LogoutDialog {
  static void show(BuildContext context) {
    Get.dialog(
      Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 0.9.sw,
            padding: EdgeInsets.all(24.sp),
            decoration: BoxDecoration(
              color: AppColors.boxContainerColor,
              borderRadius: BorderRadius.circular(28.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ///Section : Text -> Logout
                Text("Logout", style: TextFontStyle.textStyle24WhiteInterw600),
                UIHelper.verticalSpace(16.h),

                ///Section : Text -> Are you sure you want to logout?
                Text(
                  "Are you sure you want to logout?",
                  textAlign: TextAlign.center,
                  style: TextFontStyle.textStyle14WhiteInterw400,
                ),
                UIHelper.verticalSpace(53.h),

                // Buttons : Cancel && Logout
                Row(
                  children: [
                    ///Section : Button -> Cancel Button
                    Expanded(
                      child: CustomGradientBorderButton(
                        onTap: () {
                          Get.back();
                        },
                        buttonTitle: "No",
                      ),
                    ),
                    UIHelper.horizontalSpace(10.w),

                    ///Section : Button -> Logout Button
                    Expanded(
                      child: CustomGradientButton(
                        buttonTitle: "Logout",
                        onTap: () {
                          Get.back();
                          Get.to(SignInScreenUi());
                        },
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(16.h),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
