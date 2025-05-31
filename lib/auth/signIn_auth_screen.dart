import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/asset_path.dart';
import '../../../widget/font/customAppFontStyle.dart';
import '../../../widget/inputField/customInputField.dart';
import '../../../widget/buttons/Custom_Outline_Button.dart';
import '../views/controller/signIn_auth_screen_controller.dart';

class SignInAuthScreen extends StatelessWidget {
  final SigninAuthScreenController controller = Get.put(SigninAuthScreenController());

   SignInAuthScreen({super.key});

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

                  // Sign in title with custom font
                  RichText(
                    text: TextSpan(
                      text: 'Sign ',
                      style: CustomAppFontStyle.bold(20, gradientStart),
                      children: [
                        TextSpan(
                          text: 'in to your account',
                          style: CustomAppFontStyle.regular(20, AppColors.secondaryTextColor),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Subtitle with custom font
                  Text(
                    'Welcome! Sign in to your account to continue.',
                    style: CustomAppFontStyle.regular(14, AppColors.secondaryTextColor),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  // Email field using CustomInputField
                  CustomInputField(
                    hintText: 'Enter email',
                    icon: Icons.email,
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    iconColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    hoverColor: Colors.orange.withValues(alpha: 0.15),
                  ),

                  const SizedBox(height: 20),

                  // Password field with toggle visibility using CustomInputField inside Obx
                  Obx(() {
                    return CustomInputField(
                      hintText: 'Enter password',
                      icon: Icons.lock_outline,
                      controller: controller.passwordController,
                      obscureText: controller.isPasswordHidden.value,
                      iconColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                      hoverColor: Colors.orange.withValues(alpha: 0.15),
                      suffixIcon: Icon(
                        controller.isPasswordHidden.value ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.primaryColor,
                      ),
                      onSuffixIconPressed: controller.togglePasswordVisibility,
                    );
                  }),

                  const SizedBox(height: 28),

                  // Sign In Button with gradient
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.signIn,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [gradientStart, gradientEnd],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: const BoxConstraints(minHeight: 48),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // "Sign in with Or" with custom font
                  Text(
                    'Sign in with Or',
                    style: CustomAppFontStyle.regular(14, AppColors.secondaryTextColor),
                  ),

                  const SizedBox(height: 14),

                  // Google sign in button with CustomOutlinedButton
                  CustomOutlinedButton(
                    onPressed: controller.signInWithGoogle,
                    buttonText: 'Google',
                    isFullWidth: true,
                    isRounded: true,
                    height: 44,
                    icon: const Icon(Icons.g_mobiledata),
                    iconColor: AppColors.primaryColor,
                    foregroundColor: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),

                  const SizedBox(height: 24),

                  // Sign up link with custom font
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: CustomAppFontStyle.regular(14, AppColors.secondaryTextColor),
                      ),
                      GestureDetector(
                        onTap: controller.goToSignUp,
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: gradientStart,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
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