import 'dart:async';
import 'package:beast_connect/views/screens/userInterest_screen/userInterest_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyScreenController extends GetxController {
  final List<TextEditingController> otpControllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

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

  String get timerText {
    final minutes = (secondsRemaining.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsRemaining.value % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void onOtpChanged(int index, String value) {
    if (value.length > 1) {
      otpControllers[index].text = value.substring(value.length - 1);
      otpControllers[index].selection = TextSelection.fromPosition(
        TextPosition(offset: otpControllers[index].text.length),
      );
    }

    if (value.isNotEmpty) {
      if (index < otpControllers.length - 1) {
        focusNodes[index + 1].requestFocus();
      } else {
        focusNodes[index].unfocus();
      }
    }
  }

  String getOtpCode() {
    return otpControllers.map((e) => e.text).join();
  }

  void verifyOtp() {
    final otp = getOtpCode();
    print('Entered OTP: $otp');
    // Add your verification logic here
  }

  void navigateToNextScreen() {
    Get.off(() => UserInterestsScreen());
  }

  @override
  void onClose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    _timer?.cancel();
    super.onClose();
  }
}

