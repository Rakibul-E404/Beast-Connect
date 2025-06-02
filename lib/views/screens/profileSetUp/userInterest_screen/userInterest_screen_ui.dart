// import 'package:beast_connect/utils/app_colors.dart';
// import 'package:beast_connect/views/screens/profileSetUp/profileSetUpPhotoUpload/profileSetUpPhotoUpload_ui.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import '../../../../widget/buttons/custom_text_button.dart';
// import '../../../../widget/font/customAppFontStyle.dart';
//
// class UserInterestsScreen extends StatefulWidget {
//   const UserInterestsScreen({super.key});
//
//   @override
//   State<UserInterestsScreen> createState() => _UserInterestsScreenState();
// }
//
// class _UserInterestsScreenState extends State<UserInterestsScreen> {
//   final Map<String, bool> selectedInterests = {
//     'Gym': false,
//     'Yoga': false,
//     'Drawing': false,
//     'Fashion': false,
//     'Photography': false,
//     'Craft': false,
//     'Daily Trivia': false,
//     'Puzzle Solving': false,
//     'Team Workout': false,
//     'Cooking': false,
//   };
//
//   final Map<String, IconData> interestIcons = {
//     'Gym': Icons.fitness_center,
//     'Yoga': Icons.self_improvement,
//     'Drawing': Icons.brush,
//     'Fashion': Icons.checkroom,
//     'Photography': Icons.camera_alt,
//     'Craft': Icons.format_paint,
//     'Daily Trivia': Icons.lightbulb_outline,
//     'Puzzle Solving': Icons.extension,
//     'Team Workout': Icons.sports,
//     'Cooking': Icons.restaurant,
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.tertiaryColor,
//       appBar: AppBar(
//
//         backgroundColor: AppColors.tertiaryColor,
//         elevation: 0,
//         actions: [
//           CustomTextButton(
//             buttonText: 'Skip',
//             textStyle: TextStyle(color: AppColors.secondaryTextColor),
//             onPressed: () {
//               // TODO: Navigate or skip logic
//             },
//           )
//         ],
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Title
//               RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: 'Your ',
//                       style: CustomAppFontStyle.bold(20, AppColors.primaryColor),
//                     ),
//                     TextSpan(
//                       text: 'interests?',
//                       style: CustomAppFontStyle.bold(20, AppColors.secondaryTextColor),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'Select a few of your interests and let everyone know what you\'re passionate about.',
//                 style: CustomAppFontStyle.regular(14, AppColors.secondaryTextColor),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 24),
//
//               // Chips
//               Wrap(
//                 spacing: 12,
//                 runSpacing: 12,
//                 children: selectedInterests.entries.map((entry) {
//                   final label = entry.key;
//                   final isSelected = entry.value;
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedInterests[label] = !isSelected;
//                       });
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//                       decoration: BoxDecoration(
//                         color: isSelected ? Colors.orange : Colors.transparent,
//                         border: Border.all(color: Colors.orange),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(
//                             interestIcons[label],
//                             color: isSelected ? Colors.white : Colors.orange,
//                             size: 18,
//                           ),
//                           const SizedBox(width: 6),
//                           Text(
//                             label,
//                             style: CustomAppFontStyle.regular(
//                               14,
//                               isSelected ? Colors.white : Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//
//               const Spacer(),
//
//               // Gradient Submit Button
//               GestureDetector(
//                 onTap: () {
//                   final selected = selectedInterests.entries
//                       .where((e) => e.value)
//                       .map((e) => e.key)
//                       .toList();
//
//                   if (selected.isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Please select at least one interest')),
//                     );
//                   } else {
//                     try {
//                       Get.to(ProfileSetUpPhotoUploadScreenUi());
//                     } catch (e) {
//                       debugPrint('Navigation error: $e');
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Navigation failed. Please try again.')),
//                       );
//                     }
//                   }
//
//
//
//                 },
//                 child: Container(
//                   width: double.infinity,
//                   height: 50,
//                   margin: const EdgeInsets.only(top: 16),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     gradient: const LinearGradient(
//                       colors: [Colors.orange, Colors.blue],
//                     ),
//                   ),
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Submit',
//                     style: CustomAppFontStyle.bold(16, Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//



///todo::: setting up the ui and the controller file


import 'package:beast_connect/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widget/buttons/custom_text_button.dart';
import '../../../../widget/font/customAppFontStyle.dart';
import '../../../controller/profileSetUp/UserInterestsScreen_controller.dart';

class UserInterestsScreenUi extends StatelessWidget {
  UserInterestsScreenUi({Key? key}) : super(key: key);

  final UserInterestsController controller = Get.put(UserInterestsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tertiaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.tertiaryColor,
        elevation: 0,
        actions: [
          CustomTextButton(
            buttonText: 'Skip',
            textStyle: TextStyle(color: AppColors.secondaryTextColor),
            onPressed: () {
              // TODO: Add skip logic if needed
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Your ',
                      style: CustomAppFontStyle.bold(20, AppColors.primaryColor),
                    ),
                    TextSpan(
                      text: 'interests?',
                      style: CustomAppFontStyle.bold(20, AppColors.secondaryTextColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Select a few of your interests and let everyone know what you\'re passionate about.',
                style: CustomAppFontStyle.regular(14, AppColors.secondaryTextColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Chips
              Obx(() {
                return Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: controller.selectedInterests.entries.map((entry) {
                    final label = entry.key;
                    final isSelected = entry.value;
                    return GestureDetector(
                      onTap: () {
                        controller.toggleInterest(label);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.orange : Colors.transparent,
                          border: Border.all(color: Colors.orange),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              controller.interestIcons[label],
                              color: isSelected ? Colors.white : Colors.orange,
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              label,
                              style: CustomAppFontStyle.regular(
                                14,
                                isSelected ? Colors.white : Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),

              const Spacer(),

              // Gradient Submit Button
              GestureDetector(
                onTap: () {
                  controller.submitInterests(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.blue],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Submit',
                    style: CustomAppFontStyle.bold(16, Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


