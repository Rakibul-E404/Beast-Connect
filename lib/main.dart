import 'package:beast_connect/views/screens/Profile/my_subscription/presentation/my_subscription_screen.dart';
import 'package:beast_connect/views/screens/Profile/profile/presentation/profile_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Views/Screens/Splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

// void main() {
//   runApp(DevicePreview(builder:(context)=> MyApp()));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        title: 'Flutter splash with GetX & DevicePreview',
        home: SplashScreen(),
        // home: ProfileScreen(),
        // home: MySubscriptionScreen(),

        // home: BottomNavScreen(),
      ),
    );
  }
}
