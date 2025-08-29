import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/ui_helper.dart';
import 'package:beast_connect/views/screens/Profile/settings/change_password/controller/change_password_screen_controller.dart';
import 'package:beast_connect/widget/buttons/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../widget/custom_gradient_button.dart';
import '../../../../../../widget/inputField/customInputField.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final controller = Get.put(ChangePasswordScreenController());

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
                CustomAppBar(title: "Change Password"),
                UIHelper.verticalSpace(20.h),

                ///Old Password
                Obx(() {
                  return CustomInputField(
                    controller: controller.oldPasswordController,
                    onSuffixIconPressed: controller.setOldPasswordVisibility,
                    obscureText: controller.isOldPasswordVisible.value,
                    suffixIcon: Icon(
                      controller.isOldPasswordVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    hintText: "Old Password",

                    borderColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    borderRadius: 12.r,
                  );
                }),
                UIHelper.verticalSpace(16.h),

                ///New Password
                Obx(() {
                  return CustomInputField(
                    controller: controller.newPasswordController,
                    onSuffixIconPressed: controller.setNewPasswordVisibility,
                    obscureText: controller.isNewPasswordVisible.value,
                    suffixIcon: Icon(
                      controller.isNewPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    hintText: "New Password",
                    borderColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    borderRadius: 12.r,
                  );
                }),
                UIHelper.verticalSpace(16.h),

                ///Confirm Password
                Obx(() {
                  return CustomInputField(
                    controller: controller.confirmPasswordController,
                    onSuffixIconPressed:
                        controller.setConfirmPasswordVisibility,
                    obscureText: controller.isConfirmPasswowrdVisible.value,
                    suffixIcon: Icon(
                      controller.isConfirmPasswowrdVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    hintText: "Confirm Password",
                    borderColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    borderRadius: 12.r,
                  );
                }),
                UIHelper.verticalSpace(30.h),

                ///Button : Reset Password
                CustomGradientButton(
                  onTap: () {},
                  buttonTitle: "Reset Password",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
