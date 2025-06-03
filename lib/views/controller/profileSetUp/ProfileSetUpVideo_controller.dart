///
///
/// todo:: ok but not perfect ,, need a log fix
///
///



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:photo_manager/photo_manager.dart';
//
// class ProfileSetUpVideoController extends GetxController {
//   final RxList<AssetEntity> galleryVideos = <AssetEntity>[].obs;
//   final RxList<AssetEntity> selectedVideos = <AssetEntity>[].obs;
//   final RxBool isLoading = true.obs;
//   final RxBool hasPermission = false.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     requestPermissionAndLoadVideos();
//   }
//
//   Future<void> requestPermissionAndLoadVideos() async {
//     isLoading.value = true;
//
//     final PermissionState permission = await PhotoManager.requestPermissionExtend();
//     if (permission.isAuth) {
//       hasPermission.value = true;
//       await loadVideos();
//     } else {
//       hasPermission.value = false;
//       isLoading.value = false;
//       Get.snackbar(
//         'Permission Required',
//         'Please enable photo access in app settings to view videos.',
//         snackPosition: SnackPosition.BOTTOM,
//         mainButton: TextButton(
//           onPressed: () {
//             PhotoManager.openSetting();
//           },
//           child: Text('Open Settings', style: TextStyle(color: Colors.white)),
//         ),
//       );
//     }
//   }
//
//   Future<void> loadVideos() async {
//     try {
//       final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
//         type: RequestType.video,
//         filterOption: FilterOptionGroup(
//           orders: [
//             const OrderOption(
//               type: OrderOptionType.createDate,
//               asc: false,
//             ),
//           ],
//         ),
//       );
//
//       if (albums.isEmpty) {
//         galleryVideos.clear();
//         return;
//       }
//
//       final List<AssetEntity> allVideos = [];
//       for (final album in albums) {
//         final videos = await album.getAssetListRange(start: 0, end: 100);
//         allVideos.addAll(videos.where((asset) => asset.type == AssetType.video));
//       }
//
//       galleryVideos.assignAll(allVideos);
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to load videos: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   void toggleSelection(AssetEntity video) {
//     final existingIndex = selectedVideos.indexWhere((v) => v.id == video.id);
//     if (existingIndex != -1) {
//       selectedVideos.removeAt(existingIndex);
//     } else {
//       if (selectedVideos.length < 1) {
//         selectedVideos.add(video);
//       } else {
//         Get.snackbar('Limit Reached', 'You can select only 1 video');
//       }
//     }
//   }
//
//   void goToNextScreen() {
//     if (selectedVideos.isNotEmpty) {
//       Get.toNamed('/next-screen', arguments: selectedVideos.first);
//     }
//   }
// }
//





import 'package:get/get.dart';

class ProfileSetUpVideoController extends GetxController {
  final RxBool hasPermission = true.obs; // Assume permission granted / not needed
  final RxBool isLoading = false.obs;

  /// Navigate to next screen (no video argument)
  void goToNextScreen() {
    Get.toNamed('/next-screen');
  }
}

