import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpAuthController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final ageController = TextEditingController();
  final locationController = TextEditingController();
  final dobController = TextEditingController();

  final RxString gender = ''.obs;
  final RxBool agreeToTerms = false.obs;

  final RxBool isPasswordHidden = true.obs;
  final RxBool isConfirmPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  void signUp() {
    if (!agreeToTerms.value) {
      Get.snackbar('Error', 'You must accept the terms and conditions');
      return;
    }
    // Add your signup logic here
    print('Signing up user...');
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    ageController.dispose();
    locationController.dispose();
    dobController.dispose();
    // super.onClose();
  }
}
