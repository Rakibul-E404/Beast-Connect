import 'package:beast_connect/widget/font/customAppFontStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../../../widget/buttons/Custom_Elevated_Button.dart';
import '../../../controller/profileSetUp/ProfileSetUpAudio_controller.dart';

class ProfileSetUpAudioUi extends StatelessWidget {
  ProfileSetUpAudioUi({super.key});

  final ProfileSetUpAudioController controller = Get.put(ProfileSetUpAudioController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(

          centerTitle: true,
          title: Text(
            'Song list',
            style: CustomAppFontStyle.regular(20, AppColors.secondaryTextColor),
          ),
          backgroundColor: Colors.black87,
          leading: const BackButton(color: Colors.white),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                final selectedIndex = controller.selectedIndex.value;
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 16),
                  itemCount: controller.songs.length,
                  itemBuilder: (context, index) => _buildSongItem(index, selectedIndex),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: CustomElevatedButton(
                  onPressed: controller.goToProfileSetUpVideoScreen,
                  buttonText: 'Select Audio',
                  textColor: AppColors.secondaryTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  isFullWidth: true,
                  isRounded: true,
                  height: 48,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  hasShadow: false,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSongItem(int index, int selectedIndex) {
    final song = controller.songs[index];
    final isSelected = selectedIndex == index;

    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          song.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        song.title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        song.artist,
        style: const TextStyle(color: Colors.white54),
      ),
      selected: isSelected,
      selectedTileColor: Colors.blue.withOpacity(0.3),
      onTap: () => controller.playSong(index),
    );
  }
}
