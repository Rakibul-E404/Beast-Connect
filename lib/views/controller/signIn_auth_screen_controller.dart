import 'package:beast_connect/auth/signUp_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninAuthScreenController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordHidden = true.obs;

  /// Toggles the password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.toggle();
  }

  /// Handles user sign-in logic with validation
  void signIn() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Invalid Email', 'Please enter a valid email address.');
      return;
    }

    if (password.isEmpty) {
      Get.snackbar('Empty Password', 'Password cannot be empty.');
      return;
    }

    // TODO: Connect this to your sign-in API/auth logic
    Get.snackbar('Success', 'Signed in successfully!');
  }

  /// Handles Google sign-in (to be implemented)
  void signInWithGoogle() {
    // TODO: Connect to Google Sign-In
    Get.snackbar('Google Sign-In', 'Google Sign-In clicked');
  }

  /// Navigates to the Sign-Up screen
  void goToSignUp() {
    Get.to(() => SignUpAuthScreen());
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
