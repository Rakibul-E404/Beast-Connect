import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../controller/profileSetUp/ProfileSetUpVideo_controller.dart';

class ProfileSetUpVideoUi extends StatelessWidget {
  ProfileSetUpVideoUi({super.key});

  final ProfileSetUpVideoController controller = Get.put(ProfileSetUpVideoController());

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Video List', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
        leading: const BackButton(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (!controller.hasPermission.value) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Photo access is required to display videos.\nPlease enable it from settings.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                );
              }

              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.galleryVideos.isEmpty) {
                return const Center(
                  child: Text('No videos found', style: TextStyle(color: Colors.white)),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: controller.galleryVideos.length,
                itemBuilder: (context, index) {
                  final video = controller.galleryVideos[index];
                  final isSelected = controller.selectedVideos.any((v) => v.id == video.id);

                  return GestureDetector(
                    onTap: () => controller.toggleSelection(video),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        FutureBuilder<Uint8List?>(
                          future: video.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.memory(
                                  snapshot.data!,
                                  fit: BoxFit.cover,
                                ),
                              );
                            }
                            return Container(
                              color: Colors.grey[800],
                              child: const Icon(Icons.videocam, color: Colors.white),
                            );
                          },
                        ),
                        if (isSelected)
                          Positioned(
                            top: 4,
                            right: 4,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.check, color: Colors.white, size: 18),
                            ),
                          ),
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              _formatDuration(video.duration as Duration),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Obx(() => ElevatedButton(
              onPressed: controller.selectedVideos.isNotEmpty ? controller.goToNextScreen : null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text('Select Video', style: TextStyle(fontSize: 18)),
            )),
          )
        ],
      ),
    );
  }
}




