import 'package:beast_connect/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/profileSetUp/UserInterestsScreen_controller.dart';
import '../../../../widget/buttons/custom_text_button.dart';
import '../../../../widget/font/customAppFontStyle.dart';

class UserInterestsScreenUi extends StatelessWidget {
  UserInterestsScreenUi({super.key});

  final UserInterestsController controller = Get.put(UserInterestsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tertiaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                    'Next',
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


