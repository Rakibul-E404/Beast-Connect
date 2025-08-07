

///
///
///todo::: not properly ok ,,but working,,sightly,
///
///


// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:photo_manager/photo_manager.dart';
// import '../../../controller/profileSetUp/ProfileSetUpVideo_controller.dart';
//
// class ProfileSetUpVideoUi extends StatelessWidget {
//   ProfileSetUpVideoUi({super.key});
//
//   final ProfileSetUpVideoController controller = Get.put(ProfileSetUpVideoController());
//
//   // Controls whether user is currently selecting videos from gallery grid
//   final RxBool isSelecting = false.obs;
//
//   String _formatDuration(int seconds) {
//     final duration = Duration(seconds: seconds);
//     final minutes = duration.inMinutes.remainder(60);
//     final secs = duration.inSeconds.remainder(60);
//     return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
//   }
//
//   Future<void> _openGalleryForSelection() async {
//     await controller.requestPermissionAndLoadVideos();
//     isSelecting.value = true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Video List', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.black87,
//         leading: const BackButton(color: Colors.white),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(() {
//               if (isSelecting.value) {
//                 // Show full gallery grid for selecting videos
//                 if (!controller.hasPermission.value) {
//                   return Center(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Text(
//                         'Photo access is required to display videos.\nPlease enable it from settings.',
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ),
//                   );
//                 }
//                 if (controller.isLoading.value) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 if (controller.galleryVideos.isEmpty) {
//                   return const Center(
//                     child: Text('No videos found', style: TextStyle(color: Colors.white)),
//                   );
//                 }
//
//                 return GridView.builder(
//                   padding: const EdgeInsets.all(8),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     crossAxisSpacing: 4,
//                     mainAxisSpacing: 4,
//                   ),
//                   itemCount: controller.galleryVideos.length,
//                   itemBuilder: (context, index) {
//                     final video = controller.galleryVideos[index];
//                     final isSelected = controller.selectedVideos.any((v) => v.id == video.id);
//
//                     return GestureDetector(
//                       onTap: () {
//                         if (isSelected) {
//                           controller.selectedVideos.removeWhere((v) => v.id == video.id);
//                         } else {
//                           controller.selectedVideos.add(video);
//                         }
//                       },
//                       child: Stack(
//                         fit: StackFit.expand,
//                         children: [
//                           FutureBuilder<Uint8List?>(
//                             future: video.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
//                             builder: (context, snapshot) {
//                               if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
//                                 return ClipRRect(
//                                   borderRadius: BorderRadius.circular(8),
//                                   child: Image.memory(
//                                     snapshot.data!,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 );
//                               }
//                               return Container(
//                                 color: Colors.grey[800],
//                                 child: const Icon(Icons.videocam, color: Colors.white),
//                               );
//                             },
//                           ),
//                           if (isSelected)
//                             Positioned(
//                               top: 4,
//                               right: 4,
//                               child: Container(
//                                 padding: const EdgeInsets.all(4),
//                                 decoration: const BoxDecoration(
//                                   color: Colors.blue,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: const Icon(Icons.check, color: Colors.white, size: 18),
//                               ),
//                             ),
//                           Positioned(
//                             bottom: 4,
//                             right: 4,
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//                               decoration: BoxDecoration(
//                                 color: Colors.black.withOpacity(0.7),
//                                 borderRadius: BorderRadius.circular(4),
//                               ),
//                               child: Text(
//                                 _formatDuration(video.duration),
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 10,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               } else {
//                 // Not selecting, show selected videos or empty screen with button
//                 if (controller.selectedVideos.isEmpty) {
//                   // Empty screen with big IconButton to open gallery
//                   return Center(
//                     child: IconButton(
//                       iconSize: 80,
//                       color: Colors.white54,
//                       icon: const Icon(Icons.video_library_outlined),
//                       tooltip: 'Select Videos',
//                       onPressed: _openGalleryForSelection,
//                     ),
//                   );
//                 } else {
//                   // Show grid of selected videos
//                   return GridView.builder(
//                     padding: const EdgeInsets.all(8),
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 4,
//                       mainAxisSpacing: 4,
//                     ),
//                     itemCount: controller.selectedVideos.length,
//                     itemBuilder: (context, index) {
//                       final video = controller.selectedVideos[index];
//
//                       return Stack(
//                         fit: StackFit.expand,
//                         children: [
//                           FutureBuilder<Uint8List?>(
//                             future: video.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
//                             builder: (context, snapshot) {
//                               if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
//                                 return ClipRRect(
//                                   borderRadius: BorderRadius.circular(8),
//                                   child: Image.memory(
//                                     snapshot.data!,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 );
//                               }
//                               return Container(
//                                 color: Colors.grey[800],
//                                 child: const Icon(Icons.videocam, color: Colors.white),
//                               );
//                             },
//                           ),
//                           Positioned(
//                             bottom: 4,
//                             right: 4,
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//                               decoration: BoxDecoration(
//                                 color: Colors.black.withOpacity(0.7),
//                                 borderRadius: BorderRadius.circular(4),
//                               ),
//                               child: Text(
//                                 _formatDuration(video.duration),
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 10,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }
//               }
//             }),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Obx(() {
//               return Row(
//                 children: [
//                   if (controller.selectedVideos.isNotEmpty)
//                     Expanded(
//                       child: ElevatedButton.icon(
//                         onPressed: _openGalleryForSelection,
//                         icon: const Icon(Icons.add),
//                         label: const Text('Add More Videos'),
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: const Size.fromHeight(48),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                           backgroundColor: Colors.grey[800],
//                         ),
//                       ),
//                     ),
//                   if (controller.selectedVideos.isNotEmpty)
//                     const SizedBox(width: 12),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (controller.selectedVideos.isNotEmpty) {
//                           controller.goToNextScreen();
//                         } else {
//                           // No videos selected, open gallery for selection
//                           _openGalleryForSelection();
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size.fromHeight(48),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                       ),
//                       child: const Text('Proceed', style: TextStyle(fontSize: 18)),
//                     ),
//                   ),
//                 ],
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }



///
///
///  todo:: just to show ,,
///
///




// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:photo_manager/photo_manager.dart';
// import '../../../controller/profileSetUp/ProfileSetUpVideo_controller.dart';
//
// class ProfileSetUpVideoUi extends StatelessWidget {
//   ProfileSetUpVideoUi({super.key});
//
//   final ProfileSetUpVideoController controller = Get.put(ProfileSetUpVideoController());
//
//   String _formatDuration(int seconds) {
//     final duration = Duration(seconds: seconds);
//     final minutes = duration.inMinutes.remainder(60);
//     final secs = duration.inSeconds.remainder(60);
//     return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Video List', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.black87,
//         leading: const BackButton(color: Colors.white),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(() {
//               if (!controller.hasPermission.value) {
//                 return Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Text(
//                       'Photo access is required to display videos.\nPlease enable it from settings.',
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   ),
//                 );
//               }
//
//               if (controller.isLoading.value) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//
//               if (controller.galleryVideos.isEmpty) {
//                 return const Center(
//                   child: Text('No videos found', style: TextStyle(color: Colors.white)),
//                 );
//               }
//
//               return GridView.builder(
//                 padding: const EdgeInsets.all(8),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   crossAxisSpacing: 4,
//                   mainAxisSpacing: 4,
//                 ),
//                 itemCount: controller.galleryVideos.length,
//                 itemBuilder: (context, index) {
//                   final video = controller.galleryVideos[index];
//                   final isSelected = controller.selectedVideos.any((v) => v.id == video.id);
//
//                   return GestureDetector(
//                     onTap: () => controller.toggleSelection(video),
//                     child: Stack(
//                       fit: StackFit.expand,
//                       children: [
//                         FutureBuilder<Uint8List?>(
//                           future: video.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
//                               return ClipRRect(
//                                 borderRadius: BorderRadius.circular(8),
//                                 child: Image.memory(
//                                   snapshot.data!,
//                                   fit: BoxFit.cover,
//                                 ),
//                               );
//                             }
//                             return Container(
//                               color: Colors.grey[800],
//                               child: const Icon(Icons.videocam, color: Colors.white),
//                             );
//                           },
//                         ),
//                         if (isSelected)
//                           Positioned(
//                             top: 4,
//                             right: 4,
//                             child: Container(
//                               padding: const EdgeInsets.all(4),
//                               decoration: const BoxDecoration(
//                                 color: Colors.blue,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(Icons.check, color: Colors.white, size: 18),
//                             ),
//                           ),
//                         Positioned(
//                           bottom: 4,
//                           right: 4,
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//                             decoration: BoxDecoration(
//                               color: Colors.black.withOpacity(0.7),
//                               borderRadius: BorderRadius.circular(4),
//                             ),
//                             child: Text(
//                               _formatDuration(video.duration),
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 10,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Obx(() => ElevatedButton(
//               onPressed: controller.selectedVideos.isNotEmpty ? controller.goToNextScreen : null,
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size.fromHeight(48),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//               ),
//               child: const Text('Select Video', style: TextStyle(fontSize: 18)),
//             )),
//           )
//         ],
//       ),
//     );
//   }
// }



import 'package:beast_connect/views/screens/homeScreen/home_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../../../widget/font/customAppFontStyle.dart';
import '../../../controller/profileSetUp/ProfileSetUpVideo_controller.dart';

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









