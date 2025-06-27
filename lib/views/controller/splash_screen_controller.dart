import 'package:beast_connect/views/bottom_nav.dart';
import 'package:get/get.dart';
import '../screens/onboard/onboard_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    // Simulate a delay and navigate
    Future.delayed(Duration(seconds: 3), () {
      // Get.off(() => OnboardScreen());
      Get.off(() => BottomNavScreen());
    });
  }
}
