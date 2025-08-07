// import 'package:beast_connect/utils/asset_path.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../utils/app_colors.dart';
// import '../../../widget/font/customAppFontStyle.dart';
// import '../../controller/onboard_screen_controller.dart';
//
// class OnboardScreen extends StatelessWidget {
//   OnboardScreen({super.key});
//
//   // Instantiate your controller
//   final OnboardController controller = Get.put(OnboardController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           SizedBox(
//             height: Get.height * 0.6,
//             width: double.infinity,
//             child: Stack(
//               clipBehavior: Clip.hardEdge,
//               children: [
//                 Positioned(
//                   top: -130,
//                   left: -30,
//                   right: -50,
//                   bottom: -0,
//                   child: Image.asset(
//                     AppAssetPath.onboardBackgroundImage,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0, 400, 0, 30),
//             child: Container(
//               height: 1100,
//               margin: const EdgeInsets.symmetric(horizontal: 24),
//               padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(24),
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     AppColors.primaryColor.withValues(alpha: 0.7),
//                     AppColors.secondaryColor.withValues(alpha: 0.7),
//                   ],
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.orange.withValues(alpha: 0.2),
//                     blurRadius: 20,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SizedBox(
//                     height: 100,
//                     child: Image.asset(
//                       AppAssetPath.logo,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//
//                   Text(
//                     "CONNECT, CHALLENGE, THRIVE Reward Your Connections with More Than Just Conversation!",
//                     textAlign: TextAlign.center,
//                     style: CustomAppFontStyle.bold(
//                       20,
//                       AppColors.secondaryTextColor,
//                     ),
//                   ),
//
//                   const SizedBox(height: 16),
//
//                   Text(
//                     "BeastConnect makes connecting fun — play games, earn rewards, and build real relationships. Join now and experience connection beyond the ordinary!",
//                     textAlign: TextAlign.center,
//                     style: CustomAppFontStyle.regular(
//                       14,
//                       Colors.white60,
//                     ),
//                   ),
//
//                   const SizedBox(height: 24),
//
//                   ElevatedButton(
//                     onPressed: controller.buttonPressedNavigate,
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.zero,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(32),
//                       ),
//                       backgroundColor: Colors.transparent,
//                       elevation: 0,
//                       shadowColor: Colors.transparent,
//                     ).copyWith(
//                       backgroundColor: WidgetStateProperty.all(Colors.transparent),
//                       elevation: WidgetStateProperty.all(0),
//                     ),
//                     child: Ink(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             AppColors.primaryColor.withValues(alpha: 0.7),
//                             AppColors.secondaryColor.withValues(alpha: 0.7),
//                           ],
//                         ),
//                         borderRadius: BorderRadius.circular(32),
//                       ),
//                       child: Container(
//                         alignment: Alignment.center,
//                         constraints: const BoxConstraints(minWidth: 120, minHeight: 48),
//                         child: Text(
//                           'Get Started',
//                           style: CustomAppFontStyle.bold(
//                             16,
//                             Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


///
///
///
/// todo:: making teh page responsive
///
///









import 'package:beast_connect/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../widget/font/customAppFontStyle.dart';
import '../../controller/onboard_screen_controller.dart';

class OnboardScreen extends StatelessWidget {
  OnboardScreen({super.key});

  final OnboardController controller = Get.put(OnboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: -30,
              right: -50,
              child: SizedBox(
                height: Get.height * 0.6,
                child: Image.asset(
                  AppAssetPath.onboardBackgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primaryColor.withOpacity(0.7),
                            AppColors.secondaryColor.withOpacity(0.7),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.2),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            child: Image.asset(
                              AppAssetPath.logo,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "CONNECT, CHALLENGE, THRIVE Reward Your Connections with More Than Just Conversation!",
                            textAlign: TextAlign.center,
                            style: CustomAppFontStyle.bold(
                              20,
                              AppColors.secondaryTextColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "BeastConnect makes connecting fun — play games, earn rewards, and build real relationships. Join now and experience connection beyond the ordinary!",
                            textAlign: TextAlign.center,
                            style: CustomAppFontStyle.regular(
                              14,
                              Colors.white60,
                            ),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: controller.buttonPressedNavigate,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shadowColor: Colors.transparent,
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.primaryColor.withOpacity(0.7),
                                    AppColors.secondaryColor.withOpacity(0.7),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                constraints: const BoxConstraints(
                                  minWidth: 120,
                                  minHeight: 48,
                                ),
                                child: Text(
                                  'Get Started',
                                  style: CustomAppFontStyle.bold(
                                    16,
                                    Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}







