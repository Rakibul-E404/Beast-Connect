import 'package:beast_connect/Views/screens/onboard/onboard_screen.dart';
import 'package:beast_connect/auth/resetPassword_screen/resetPassword_screen_ui.dart';
import 'package:beast_connect/auth/verify_screen/verify_screen_ui.dart';
import 'package:beast_connect/views/screens/profileSetUp/profileSetUpAudio/profileSetUpAudio_ui.dart';
import 'package:beast_connect/views/screens/profileSetUp/userInterest_screen/userInterest_screen_ui.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Views/Screens/Splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

/*void main() {
  runApp(DevicePreview(builder:(context)=> MyApp()));
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      title: 'Flutter splash with GetX & DevicePreview',
      // home: SplashScreen(),
      home: ProfileSetUpAudioUi(),
    );
  }
}
