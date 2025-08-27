import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/screens/profileSetUp/userInterest_screen/userInterest_screen_ui.dart';

// class VerifyScreenController extends GetxController {
//   final List<TextEditingController> otpControllers = List.generate(6, (_) => TextEditingController());
//   final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
//
//   // Timer related reactive variable
//   final RxInt secondsRemaining = 30.obs;
//   Timer? _timer;
//
//   @override
//   void onInit() {
//     super.onInit();
//     startTimer();
//   }
//
//   void startTimer() {
//     secondsRemaining.value = 30;
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (secondsRemaining.value == 0) {
//         timer.cancel();
//       } else {
//         secondsRemaining.value--;
//       }
//     });
//   }
//
//   String get timerText {
//     final minutes = (secondsRemaining.value ~/ 60).toString().padLeft(2, '0');
//     final seconds = (secondsRemaining.value % 60).toString().padLeft(2, '0');
//     return '$minutes:$seconds';
//   }
//
//   // void onOtpChanged(int index, String value) {
//   //   if (value.length > 1) {
//   //     otpControllers[index].text = value.substring(value.length - 1);
//   //     otpControllers[index].selection = TextSelection.fromPosition(
//   //       TextPosition(offset: otpControllers[index].text.length),
//   //     );
//   //   }
//   //
//   //   if (value.isNotEmpty) {
//   //     if (index < otpControllers.length - 1) {
//   //       focusNodes[index + 1].requestFocus();
//   //     } else {
//   //       focusNodes[index].unfocus();
//   //     }
//   //   }
//   // }
//
//
//
//   ///
//   ///
//   ///
//   ///todo:: updating the function>>>
//
//
//   void onOtpChanged(int index, String value) {
//     if (value.length > 1) {
//       otpControllers[index].text = value.substring(value.length - 1);
//       otpControllers[index].selection = TextSelection.fromPosition(
//         TextPosition(offset: otpControllers[index].text.length),
//       );
//     }
//
//     if (value.isNotEmpty) {
//       if (index < otpControllers.length - 1) {
//         focusNodes[index + 1].requestFocus();
//       } else {
//         focusNodes[index].unfocus();
//       }
//     }
//   }
//
//
//   ///
//   ///
//   ///
//   String getOtpCode() {
//     return otpControllers.map((e) => e.text).join();
//   }
//
//   void verifyOtp() {
//     final otp = getOtpCode();
//     print('Entered OTP: $otp');
//     // Add your verification logic here
//   }
//
//   void navigateToNextScreen() {
//     Get.off(() => UserInterestsScreenUi());
//   }
//
//   @override
//   void onClose() {
//     for (var controller in otpControllers) {
//       controller.dispose();
//     }
//     for (var node in focusNodes) {
//       node.dispose();
//     }
//     _timer?.cancel();
//     super.onClose();
//   }
// }




///
///
///
///
///
///



class VerifyScreenController extends GetxController {
  // Single controller for PinCodeTextField
  final TextEditingController otpController = TextEditingController();

  // Timer related reactive variable
  final RxInt secondsRemaining = 30.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    secondsRemaining.value = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value == 0) {
        timer.cancel();
      } else {
        secondsRemaining.value--;
      }
    });
  }

  void onOtpChanged(String value) {
    // This method is called whenever any digit changes
    print('OTP changed: $value');
  }

  void onOtpCompleted(String otp) {
    // This method is called when all 6 digits are entered
    print('OTP completed: $otp');
    // You can auto-verify here if needed
    // verifyOtp();
  }

  String getOtpCode() {
    return otpController.text;
  }

  void verifyOtp() {
    final otp = getOtpCode();
    print('Entered OTP: $otp');

    if (otp.length == 6) {
      // Add your verification logic here
      // Example: call API to verify OTP
      print('Verifying OTP: $otp');
    } else {
      // Show error - incomplete OTP
      print('Please enter complete 6-digit OTP');
    }
  }

  void navigateToNextScreen() {
    // Only navigate if OTP is complete and valid
    final otp = getOtpCode();
    if (otp.length == 6) {
      Get.off(() => UserInterestsScreenUi());
    } else {
      // Show snackbar or error message
      Get.snackbar(
        'Error',
        'Please enter complete 6-digit OTP',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }

  void resendOtp() {
    // Clear current OTP
    otpController.clear();

    // Restart timer
    startTimer();

    // Add your resend OTP logic here
    print('Resending OTP...');

    // Show success message
    Get.snackbar(
      'Success',
      'OTP has been resent to your email',
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    otpController.dispose();
    _timer?.cancel();
    super.onClose();
  }
}

