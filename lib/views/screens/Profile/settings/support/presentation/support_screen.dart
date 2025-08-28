import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/ui_helper.dart';
import 'package:beast_connect/widget/buttons/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../utils/asset_path.dart';
import '../../../../../../widget/inputField/customInputField.dart';
import '../controller/support_screen_controller.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({super.key});

  final controller = Get.put(SupportScreenController());

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
                ///Custom Appbar
                CustomAppBar(title: "Support"),
                UIHelper.verticalSpace(24.h),

                ///Support Card
                Container(
                  width: 1.sw,
                  padding: EdgeInsets.all(14.sp),
                  decoration: BoxDecoration(
                    color: AppColors.boxContainerColor,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  alignment: Alignment.center,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UIHelper.verticalSpace(28.h),

                      ///Image : Headset
                      Image.asset(
                        AppAssetPath.headSetImage,
                        height: 48.h,
                        width: 48.w,
                        fit: BoxFit.cover,
                      ),
                      UIHelper.verticalSpace(32.h),

                      // Password field
                      CustomInputField(
                        hintText: 'Support@info.com',
                        icon: Icons.mail,
                        controller: controller.supportEmailController,

                        iconColor: AppColors.primaryColor,
                        borderColor: AppColors.primaryColor,
                        hoverColor: Colors.orange.withOpacity(0.15),
                        suffixIcon: Icon(
                          Icons.copy,
                          color: AppColors.primaryColor,
                        ),
                        // onSuffixIconPressed: controller.togglePasswordVisibility,
                      ),
                      UIHelper.verticalSpace(28.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
