

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/profileSetUp/ProfileSetUpVideo_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../widget/font/customAppFontStyle.dart';

class ProfileSetUpVideoUi extends StatelessWidget {
  ProfileSetUpVideoUi({super.key});

  final ProfileSetUpVideoController controller = Get.put(ProfileSetUpVideoController());

  // List of asset image paths
  final List<String> imagePaths = [
    'assets/image/demo_videoSSimg.png',
    'assets/image/demo_videoSSimg.png',
    'assets/image/demo_videoSSimg.png',
    'assets/image/demo_videoSSimg.png',
    'assets/image/demo_videoSSimg.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Video List', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
        leading: const BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: imagePaths.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 images per row
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              // onPressed: () => Get.to(HomeScreenUi()),
              onPressed: () {
                controller.goToNextScreen();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48), // full width & fixed height
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
                      AppColors.primaryColor.withValues(alpha: 1.0),
                      AppColors.secondaryColor.withValues(alpha: 1.0),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Container(
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(
                    minHeight: 48,
                  ),
                  child: Text(
                    'Upload',
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
    );
  }

}









