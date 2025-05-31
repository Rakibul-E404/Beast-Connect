// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:beast_connect/utils/app_colors.dart';
// import 'package:beast_connect/utils/asset_path.dart';
// import '../../../../widget/font/customAppFontStyle.dart';
// import '../../../../widget/inputField/customInputField.dart';
// import '../../widget/buttons/Custom_Elevated_Button.dart';
// import '../../views/controller/resetPassword_screen_controller.dart';
//
// class ResetPasswordAuthScreen extends StatelessWidget {
//   final ResetPasswordAuthScreenController controller = Get.put(ResetPasswordAuthScreenController());
//
//   ResetPasswordAuthScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     const gradientStart = AppColors.primaryColor;
//     const gradientEnd = AppColors.secondaryColor;
//
//     return Scaffold(
//       backgroundColor: AppColors.tertiaryColor,
//       body: SafeArea(
//         child: Center(
//           child: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 24),
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
//             decoration: BoxDecoration(
//               color: AppColors.authContainerBackGroundColor,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Logo
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 28),
//                     child: Image.asset(
//                       AppAssetPath.logo,
//                       scale: 1.8,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//
//                   // Title
//                   RichText(
//                     text: TextSpan(
//                       text: 'Reset ',
//                       style: CustomAppFontStyle.bold(20, gradientStart),
//                       children: [
//                         TextSpan(
//                           text: 'Password',
//                           style: CustomAppFontStyle.regular(20, AppColors.secondaryTextColor),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 12),
//
//                   // Subtitle
//                   Text(
//                     'Enter a new password',
//                     style: CustomAppFontStyle.regular(14, AppColors.secondaryTextColor),
//                     textAlign: TextAlign.center,
//                   ),
//
//                   const SizedBox(height: 32),
//
//                   // Password field
//                   Obx(() {
//                     return CustomInputField(
//                       hintText: 'Enter password',
//                       icon: Icons.lock_outline,
//                       controller: controller.passwordController,
//                       obscureText: controller.isPasswordHidden.value,
//                       iconColor: AppColors.primaryColor,
//                       borderColor: AppColors.primaryColor,
//                       hoverColor: Colors.orange.withOpacity(0.15),
//                       suffixIcon: Icon(
//                         controller.isPasswordHidden.value ? Icons.visibility_off : Icons.visibility,
//                         color: AppColors.primaryColor,
//                       ),
//                       onSuffixIconPressed: controller.togglePasswordVisibility,
//                     );
//                   }),
//
//                   const SizedBox(height: 20),
//
//                   // Confirm Password field
//                   Obx(() {
//                     return CustomInputField(
//                       hintText: 'Enter confirm password',
//                       icon: Icons.lock,
//                       controller: controller.confirmPasswordController,
//                       obscureText: controller.isConfirmPasswordHidden.value,
//                       iconColor: AppColors.primaryColor,
//                       borderColor: AppColors.primaryColor,
//                       hoverColor: Colors.orange.withOpacity(0.15),
//                       suffixIcon: Icon(
//                         controller.isConfirmPasswordHidden.value ? Icons.visibility_off : Icons.visibility,
//                         color: AppColors.primaryColor,
//                       ),
//                       onSuffixIconPressed: controller.toggleConfirmPasswordVisibility,
//                     );
//                   }),
//
//                   const SizedBox(height: 32),
//
//                   // Submit Button
//                   SizedBox(
//                     width: double.infinity,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [gradientStart, gradientEnd],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       child: CustomElevatedButton(
//                         onPressed: () {
//                           controller.resetPassword(context);
//                         },
//                         buttonText: 'Reset Password',
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         isFullWidth: true,
//                         isRounded: true,
//                         height: 48,
//                         backgroundColor: Colors.transparent,
//                         elevation: 0,
//                         hasShadow: false,
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/asset_path.dart';
import '../../../../widget/font/customAppFontStyle.dart';
import '../../../../widget/inputField/customInputField.dart';
import '../../widget/buttons/Custom_Elevated_Button.dart';
import '../../views/controller/resetPassword_screen_controller.dart';

class ResetPasswordScreenUi extends StatelessWidget {
  final ResetPasswordScreenController controller = Get.put(ResetPasswordScreenController());

  ResetPasswordScreenUi({super.key});

  void _showSuccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (BuildContext context) {  // Added proper builder parameter
        return Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top handle
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 40),


              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: AppColors.primaryColor.withValues(alpha: 0.6),
                  border: Border.all(
                    color: AppColors.primaryColor.withValues(alpha: 0.2),
                    width: 16,
                  ),
                ),
                // padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.secondaryColor,
                  ),
                  padding: const EdgeInsets.all(24),
                  child: const Icon(
                    Icons.check_circle,
                    color: AppColors.primaryIconColor,
                    size: 30,
                  ),
                ),
              ),


              const SizedBox(height: 24),

              // Back to Sign In
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.primaryColor, AppColors.secondaryColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: CustomElevatedButton(
                      onPressed: controller.goToSignIn,
                      buttonText: 'Back To Sign in',
                      textColor: AppColors.secondaryTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      isFullWidth: true,
                      isRounded: true,
                      height: 48,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      hasShadow: false,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const gradientStart = AppColors.primaryColor;
    const gradientEnd = AppColors.secondaryColor;

    return Scaffold(
      backgroundColor: AppColors.tertiaryColor,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            decoration: BoxDecoration(
              color: AppColors.authContainerBackGroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28),
                    child: Image.asset(
                      AppAssetPath.logo,
                      scale: 1.8,
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Title
                  RichText(
                    text: TextSpan(
                      text: 'Reset ',
                      style: CustomAppFontStyle.bold(20, gradientStart),
                      children: [
                        TextSpan(
                          text: 'Password',
                          style: CustomAppFontStyle.regular(20, AppColors.secondaryTextColor),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Subtitle
                  Text(
                    'Enter a new password',
                    style: CustomAppFontStyle.regular(14, AppColors.secondaryTextColor),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  // Password field
                  Obx(() {
                    return CustomInputField(
                      hintText: 'Enter password',
                      icon: Icons.lock_outline,
                      controller: controller.passwordController,
                      obscureText: controller.isPasswordHidden.value,
                      iconColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                      hoverColor: Colors.orange.withOpacity(0.15),
                      suffixIcon: Icon(
                        controller.isPasswordHidden.value ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.primaryColor,
                      ),
                      onSuffixIconPressed: controller.togglePasswordVisibility,
                    );
                  }),

                  const SizedBox(height: 20),

                  // Confirm Password field
                  Obx(() {
                    return CustomInputField(
                      hintText: 'Enter confirm password',
                      icon: Icons.lock,
                      controller: controller.confirmPasswordController,
                      obscureText: controller.isConfirmPasswordHidden.value,
                      iconColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                      hoverColor: Colors.orange.withOpacity(0.15),
                      suffixIcon: Icon(
                        controller.isConfirmPasswordHidden.value ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.primaryColor,
                      ),
                      onSuffixIconPressed: controller.toggleConfirmPasswordVisibility,
                    );
                  }),

                  const SizedBox(height: 32),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [gradientStart, gradientEnd],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: CustomElevatedButton(
                        onPressed: () {
                          if (controller.validatePassword()) {
                            _showSuccessBottomSheet(context);
                          }
                        },
                        buttonText: 'Reset Password',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        isFullWidth: true,
                        isRounded: true,
                        height: 48,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        hasShadow: false,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}