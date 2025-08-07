// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:beast_connect/auth/signin_screen/signin_auth_screen.dart';
//
// import '../../utils/app_colors.dart';
// import '../../widget/buttons/Custom_Elevated_Button.dart';
//
// class ResetPasswordAuthScreenController extends GetxController {
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//
//   var isPasswordHidden = true.obs;
//   var isConfirmPasswordHidden = true.obs;
//
//   void togglePasswordVisibility() {
//     isPasswordHidden.value = !isPasswordHidden.value;
//   }
//
//   void toggleConfirmPasswordVisibility() {
//     isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
//   }
//
//   void resetPassword(BuildContext context) {
//     final password = passwordController.text.trim();
//     final confirmPassword = confirmPasswordController.text.trim();
//
//     if (password.isEmpty || confirmPassword.isEmpty) {
//       Get.snackbar('Error', 'Please fill in all fields.');
//       return;
//     }
//
//     if (password.length < 6) {
//       Get.snackbar('Weak Password', 'Password must be at least 6 characters.');
//       return;
//     }
//
//     if (password != confirmPassword) {
//       Get.snackbar('Mismatch', 'Passwords do not match.');
//       return;
//     }
//
//     // Show success bottom sheet
//     showSuccessBottomSheet(context);
//   }
//
//   void goToSignIn() {
//     Get.offAll(() => SignInAuthScreen());
//   }
//
//   void showSuccessBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.only(top: 30, bottom: 40),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // Top handle
//               Container(
//                 width: 40,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
//               const SizedBox(height: 40),
//
//               // Check icon
//               Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: const LinearGradient(
//                     colors: [Colors.orange, Colors.deepOrange],
//                   ),
//                 ),
//                 padding: const EdgeInsets.all(24),
//                 child: const Icon(
//                   Icons.check,
//                   color: Colors.white,
//                   size: 48,
//                 ),
//               ),
//
//               const SizedBox(height: 24),
//
//               // Back to Sign In
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child:
//                   Container(
//                     decoration: BoxDecoration(
//                       gradient:  LinearGradient(
//                         colors: [AppColors.primaryColor, AppColors.secondaryColor],
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child:
//                     CustomElevatedButton(
//                       onPressed: (){
//                         /// todo
//                       },
//                       buttonText: 'Back To Sign in',
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       isFullWidth: true,
//                       isRounded: true,
//                       height: 48,
//                       backgroundColor: Colors.transparent,
//                       elevation: 0,
//                       hasShadow: false,
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                     ),
//                   )
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   void onClose() {
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.onClose();
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beast_connect/auth/signIn_screen_ui.dart';

class ResetPasswordScreenController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  bool validatePassword() {
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    /// Todo:: testing ,,remove the comment at implement
    // if (password.isEmpty || confirmPassword.isEmpty) {
    //   Get.snackbar('Error', 'Please fill in all fields.');
    //   return false;
    // }
    //
    // if (password.length < 6) {
    //   Get.snackbar('Weak Password', 'Password must be at least 6 characters.');
    //   return false;
    // }
    //
    // if (password != confirmPassword) {
    //   Get.snackbar('Mismatch', 'Passwords do not match.');
    //   return false;
    // }

    return true;
  }

  void goToSignIn() {
    Get.offAll(() => SignInScreenUi());
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}