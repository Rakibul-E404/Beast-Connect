import 'package:beast_connect/auth/resetPassword_screen/resetPassword_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/asset_path.dart';
import '../../../../widget/font/customAppFontStyle.dart';
import '../../../../widget/inputField/customInputField.dart';
import '../../views/controller/forgetPassword_screen_controller.dart';
import '../../widget/buttons/Custom_Elevated_Button.dart';

class ForgetPasswordScreenUi
    extends StatelessWidget {
  final ForgetPasswordScreenController controller = Get.put(ForgetPasswordScreenController());

  ForgetPasswordScreenUi({super.key});

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
                      text: 'Forgot ',
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
                    'Enter your email and we\'ll send you a link to reset your password.',
                    style: CustomAppFontStyle.regular(14, AppColors.secondaryTextColor),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  // Email input
                  CustomInputField(
                    hintText: 'Enter email',
                    icon: Icons.email,
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    iconColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    hoverColor: Colors.orange.withOpacity(0.15),
                  ),

                  const SizedBox(height: 28),

                  // Send Reset Link Button
                  SizedBox(
                    width: double.infinity,
                    child:
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [gradientStart, gradientEnd],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: CustomElevatedButton(
                        onPressed: (){
                          /// todo
                        },
                        buttonText: 'Send OTP',
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
                    )
                  ),

                  const SizedBox(height: 24),

                  // Back to sign in
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Remembered your password? ",
                        style: CustomAppFontStyle.regular(14, AppColors.secondaryTextColor),
                      ),
                      GestureDetector(
                        onTap: controller.goToSignIn,
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: gradientStart,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),

                    ],
                  ),

                  /// todo: remove it after demo
                  Row(
                    children: [
                      GestureDetector(
                        onTap: ()=> Get.to(ResetPasswordScreenUi()),
                        child: const Text(
                          'Reset Screen  Test',
                          style: TextStyle(
                            color: gradientStart,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
