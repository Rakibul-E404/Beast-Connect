import 'package:beast_connect/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../views/controller/signUp_auth_screen_controller.dart';
import '../widget/buttons/custom_text_button.dart';
import '../widget/font/customAppFontStyle.dart';
import '../widget/inputField/customInputField.dart';

class SignUpAuthScreen extends StatelessWidget {
  SignUpAuthScreen({super.key});
  final SignUpAuthController controller = Get.put(SignUpAuthController());

  @override
  Widget build(BuildContext context) {
    const gradientStart = AppColors.primaryColor;
    const gradientEnd = AppColors.secondaryColor;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.tertiaryColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.authContainerBackGroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset(AppAssetPath.logo, height: 80)),
                  const SizedBox(height: 20),
                  Center(child: Text('Sign Up with email', style: CustomAppFontStyle.bold(18, Colors.white))),
                  const SizedBox(height: 4),
                  Center(child: Text('Please enter your details.', style: CustomAppFontStyle.regular(14, Colors.white70))),
                  const SizedBox(height: 24),

                  CustomInputField(hintText: 'Enter first name', controller: controller.firstNameController),
                  const SizedBox(height: 16),
                  CustomInputField(hintText: 'Enter last name', controller: controller.lastNameController),
                  const SizedBox(height: 16),
                  CustomInputField(
                      hintText: 'Enter email', icon: Icons.email, controller: controller.emailController),
                  const SizedBox(height: 16),

                  Obx(() => CustomInputField(
                    hintText: 'Enter password',
                    icon: Icons.lock,
                    obscureText: controller.isPasswordHidden.value,
                    controller: controller.passwordController,
                    suffixIcon: Icon(
                      controller.isPasswordHidden.value ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.primaryColor,
                    ),
                    onSuffixIconPressed: controller.togglePasswordVisibility,
                  )),

                  const SizedBox(height: 16),

                  Obx(() => CustomInputField(
                    hintText: 'Enter confirm password',
                    icon: Icons.lock,
                    obscureText: controller.isConfirmPasswordHidden.value,
                    controller: controller.confirmPasswordController,
                    suffixIcon: Icon(
                      controller.isConfirmPasswordHidden.value ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.primaryColor,
                    ),
                    onSuffixIconPressed: controller.toggleConfirmPasswordVisibility,
                  )),

                  const SizedBox(height: 16),
                  CustomInputField(hintText: 'Enter age', controller: controller.ageController),
                  const SizedBox(height: 16),
                  CustomInputField(hintText: 'Enter location', controller: controller.locationController),
                  const SizedBox(height: 16),
                  CustomInputField(hintText: 'Enter date of birth', controller: controller.dobController),
                  const SizedBox(height: 16),

                  Text('Gender', style: CustomAppFontStyle.medium(14, AppColors.secondaryTextColor)),
                  const SizedBox(height: 8),
                  Obx(() => Row(
                    children: [
                      _buildGenderRadio('Male', controller),
                      const SizedBox(width: 16),
                      _buildGenderRadio('Female', controller),
                      const SizedBox(width: 16),
                      _buildGenderRadio('Non-Binary', controller),
                    ],
                  )),

                  const SizedBox(height: 16),
                  Obx(() => Row(
                    children: [
                      Checkbox(
                        value: controller.agreeToTerms.value,
                        onChanged: (val) => controller.agreeToTerms.value = val ?? false,
                        activeColor: AppColors.primaryColor,
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: 'By creating an account, I accept the ',
                            style: CustomAppFontStyle.regular(12, Colors.white70),
                            children: [
                              TextSpan(text: 'Terms & Conditions', style: TextStyle(color: AppColors.primaryColor)),
                              const TextSpan(text: ' & '),
                              TextSpan(text: 'Privacy Policy', style: TextStyle(color: AppColors.primaryColor)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(height: 20),

                  Obx(() => ElevatedButton(
                    onPressed: controller.agreeToTerms.value ? controller.signUp : null,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero, // remove default padding here
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                      backgroundColor: controller.agreeToTerms.value ? null : Colors.grey,
                      shadowColor: Colors.transparent,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: controller.agreeToTerms.value
                            ? const LinearGradient(
                          colors: [gradientStart, gradientEnd],
                        )
                            : null,
                        color: controller.agreeToTerms.value ? null : Colors.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(minHeight: 48),
                      padding: const EdgeInsets.symmetric(vertical: 14), // add padding here for button height
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: controller.agreeToTerms.value ? AppColors.secondaryTextColor : Colors.white60,
                        ),
                      ),
                    ),
                  )),

                  const SizedBox(height: 16),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? ', style: CustomAppFontStyle.regular(14, Colors.white70)),
                        CustomTextButton(
                          buttonText: 'Sign in',
                          onPressed: () {},
                          textStyle: CustomAppFontStyle.medium(14, AppColors.primaryColor),
                        ),
                      ],
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

  Widget _buildGenderRadio(String value, SignUpAuthController controller) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: controller.gender.value,
          onChanged: (val) => controller.gender.value = val ?? '',
          activeColor: AppColors.primaryColor,
        ),
        Text(value, style: CustomAppFontStyle.regular(13, AppColors.secondaryTextColor)),
      ],
    );
  }
}
