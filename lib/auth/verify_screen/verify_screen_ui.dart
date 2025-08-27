// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:beast_connect/utils/app_colors.dart';
// import '../../../../widget/font/customAppFontStyle.dart';
// import '../../controller/verify_screen_controller.dart';
// import '../../utils/asset_path.dart';
// import '../../widget/buttons/Custom_Elevated_Button.dart';
// import '../../widget/inputField/customInputField.dart';
//
// class VerifyScreenUi extends StatelessWidget {
//   final VerifyScreenController controller = Get.put(VerifyScreenController());
//
//   VerifyScreenUi({super.key});
//
//   @override
//   Widget build(BuildContext context) {
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
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(height: 20),
//
//                 // Logo
//                 Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Image.asset(
//                       AppAssetPath.logo,
//                       scale: 1.8,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//
//                 // Title
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'Verify ',
//                         style: CustomAppFontStyle.bold(20, AppColors.primaryColor),
//                       ),
//                       TextSpan(
//                         text: 'Email',
//                         style: CustomAppFontStyle.bold(20, AppColors.secondaryTextColor),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 10),
//
//                 Text(
//                   'Enter the 6-digit code sent to your email.',
//                   style: CustomAppFontStyle.regular(14, AppColors.secondaryTextColor),
//                   textAlign: TextAlign.center,
//                 ),
//
//                 const SizedBox(height: 32),
//
//                 // OTP Fields
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: List.generate(6, (index) {
//                     return SizedBox(
//                       width: 48,
//                       height: 56,
//                       child: CustomInputField(
//                         textColor: AppColors.primaryTextColor,
//                         backgroundColor: AppColors.verifyBoxColor,
//                         hintText: '',
//                         controller: controller.otpControllers[index],
//                         keyboardType: TextInputType.number,
//                         borderRadius: 10,
//                         borderColor: AppColors.primaryColor,
//                         iconColor: AppColors.primaryColor,
//                         onChanged: (value) => controller.onOtpChanged(index, value),
//                       ),
//                     );
//                   }),
//                 ),
//
//                 const SizedBox(height: 32),
//
//                 // Countdown with icon (always visible)
//                 Obx(() => Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Icon(Icons.timer_outlined, size: 20, color: Colors.grey),
//                     const SizedBox(width: 6),
//                     Text(
//                       controller.secondsRemaining.value.toString(),
//                       style: CustomAppFontStyle.regular(16, AppColors.secondaryTextColor),
//                     ),
//                   ],
//                 )),
//
//                 const SizedBox(height: 32),
//
//                 // Verify button
//                 SizedBox(
//                   width: double.infinity,
//                   child: CustomElevatedButton(
//                     onPressed: () {
//                       controller.verifyOtp();
//                       controller.navigateToNextScreen();
//                     },
//                     buttonText: 'Verify Email',
//                     textColor: AppColors.secondaryTextColor,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     isFullWidth: true,
//                     isRounded: true,
//                     height: 48,
//                     backgroundColor: AppColors.primaryColor,
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                   ),
//                 ),
//
//                 const SizedBox(height: 12),
//
//                 // Resend link (at bottom)
//                 Obx(() => Center(
//                   child: RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: "Didn't receive the code? ",
//                           style: CustomAppFontStyle.regular(18, AppColors.secondaryTextColor),
//                         ),
//                         TextSpan(
//                           text: 'Resend it',
//                           style: CustomAppFontStyle.regular(
//                             18,
//                             controller.secondsRemaining.value == 0
//                                 ? AppColors.primaryColor
//                                 : AppColors.primaryColor.withOpacity(0.4),
//                           ),
//                           recognizer: controller.secondsRemaining.value == 0
//                               ? (TapGestureRecognizer()
//                             ..onTap = () {
//                               controller.startTimer();
//                             })
//                               : null,
//                         ),
//                       ],
//                     ),
//                   ),
//                 )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





///
/// todo:::::::::::: >>>> updating the input system
///



import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:beast_connect/utils/app_colors.dart';
import '../../../../widget/font/customAppFontStyle.dart';
import '../../controller/verify_screen_controller.dart';
import '../../utils/asset_path.dart';
import '../../widget/buttons/Custom_Elevated_Button.dart';

class VerifyScreenUi extends StatelessWidget {
  final VerifyScreenController controller = Get.put(VerifyScreenController());

  VerifyScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),

                // Logo
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      AppAssetPath.logo,
                      scale: 1.8,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Title
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Verify ',
                        style: CustomAppFontStyle.bold(20, AppColors.primaryColor),
                      ),
                      TextSpan(
                        text: 'Email',
                        style: CustomAppFontStyle.bold(20, AppColors.secondaryTextColor),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  'Enter the 6-digit code sent to your email.',
                  style: CustomAppFontStyle.regular(14, AppColors.secondaryTextColor),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                // OTP Fields (using PinCodeTextField)
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 56,
                    fieldWidth: 48,
                    activeFillColor: AppColors.verifyBoxColor,
                    inactiveFillColor: AppColors.verifyBoxColor,
                    selectedFillColor: AppColors.verifyBoxColor,
                    activeColor: AppColors.primaryColor,
                    inactiveColor: AppColors.primaryColor.withOpacity(0.4),
                    selectedColor: AppColors.primaryColor,
                    borderWidth: 1,
                    // enableActiveFill: true,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: AppColors.secondaryTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                  keyboardType: TextInputType.number,
                  controller: controller.otpController, // Single controller
                  onChanged: (value) => controller.onOtpChanged(value),
                  onCompleted: (otp) => controller.onOtpCompleted(otp),
                  beforeTextPaste: (text) {
                    // Allow pasting only if it's 6 digits
                    return text != null && text.length == 6 && RegExp(r'^\d{6}$').hasMatch(text);
                  },
                ),

                const SizedBox(height: 32),

                // Countdown with icon (always visible)
                Obx(() => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.timer_outlined, size: 20, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                      '${controller.secondsRemaining.value}s',
                      style: CustomAppFontStyle.regular(16, AppColors.secondaryTextColor),
                    ),
                  ],
                )),

                const SizedBox(height: 32),

                // Verify button
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    onPressed: () {
                      controller.verifyOtp();
                      controller.navigateToNextScreen();
                    },
                    buttonText: 'Verify Email',
                    textColor: AppColors.secondaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    isFullWidth: true,
                    isRounded: true,
                    height: 48,
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),

                const SizedBox(height: 12),

                // Resend link (at bottom)
                Obx(() => Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Didn't receive the code? ",
                          style: CustomAppFontStyle.regular(18, AppColors.secondaryTextColor),
                        ),
                        TextSpan(
                          text: 'Resend it',
                          style: CustomAppFontStyle.regular(
                            18,
                            controller.secondsRemaining.value == 0
                                ? AppColors.primaryColor
                                : AppColors.primaryColor.withOpacity(0.4),
                          ),
                          recognizer: controller.secondsRemaining.value == 0
                              ? (TapGestureRecognizer()
                            ..onTap = () {
                              controller.resendOtp();
                            })
                              : null,
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
