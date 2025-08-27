import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beast_connect/auth/signIn_screen_ui.dart'; // update if different

class ForgetPasswordScreenController extends GetxController {
  final emailController = TextEditingController();

  /// Validate and send reset link
  void sendResetLink() {
    final email = emailController.text.trim();

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Invalid Email', 'Please enter a valid email address.');
      return;
    }

    // TODO.text: Connect to actual password reset logic
    Get.snackbar('Success', 'Reset link sent to your email.');
  }

  /// Navigate to sign-in
  void goToSignIn() {
    Get.to(() => SignInScreenUi());
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
