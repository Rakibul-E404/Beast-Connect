// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../../utils/app_colors.dart';
// import '../../../../widget/buttons/custom_text_button.dart';
// import '../../../../widget/font/customAppFontStyle.dart';
//
// class ProfileSetUpPhotoUpload extends StatefulWidget {
//   const ProfileSetUpPhotoUpload({super.key});
//
//   @override
//   State<ProfileSetUpPhotoUpload> createState() => _ProfileSetUpPhotoUploadState();
// }
//
// class _ProfileSetUpPhotoUploadState extends State<ProfileSetUpPhotoUpload> {
//   final int maxImages = 6;
//   final ImagePicker _picker = ImagePicker();
//
//   // List to store picked images as File objects
//   List<File?> images = List.generate(6, (index) => null);
//
//   Future<void> _pickImage(int index) async {
//     final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         images[index] = File(pickedFile.path);
//       });
//     }
//   }
//
//   void _removeImage(int index) {
//     setState(() {
//       images[index] = null;
//     });
//   }
//
//   bool get _hasAtLeastOneImage => images.any((img) => img != null);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.tertiaryColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.tertiaryColor,
//         elevation: 0,
//         leading: BackButton(color: AppColors.secondaryTextColor),
//         actions: [
//           CustomTextButton(
//             buttonText: 'Skip',
//             textStyle: TextStyle(color: AppColors.secondaryTextColor),
//             onPressed: () {
//               // TODO: Add skip logic here
//             },
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Title
//             RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: 'Show your best ',
//                     style: CustomAppFontStyle.bold(20, AppColors.secondaryTextColor),
//                   ),
//                   TextSpan(
//                     text: 'Self',
//                     style: CustomAppFontStyle.bold(20, AppColors.primaryColor),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'upload your six best photos to make a fantastic fast impression let personality shine',
//               style: CustomAppFontStyle.regular(14, AppColors.secondaryTextColor),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 24),
//
//             // Grid of 6 cards
//             Expanded(
//               child: GridView.builder(
//                 itemCount: maxImages,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   crossAxisSpacing: 16,
//                   mainAxisSpacing: 16,
//                   childAspectRatio: 3 / 4,
//                 ),
//                 itemBuilder: (context, index) {
//                   final imgFile = images[index];
//                   return GestureDetector(
//                     onTap: () {
//                       if (imgFile == null) {
//                         _pickImage(index);
//                       }
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: AppColors.photoBoxColor.withOpacity(0.2),
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(
//                           color: imgFile == null ? Colors.transparent : AppColors.primaryColor,
//                           width: 2,
//                         ),
//                       ),
//                       child: Stack(
//                         children: [
//                           if (imgFile != null)
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(12),
//                               child: Image.file(
//                                 imgFile,
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                                 height: double.infinity,
//                               ),
//                             )
//                           else
//                             Center(
//                               child: Icon(
//                                 Icons.add_a_photo,
//                                 size: 40,
//                                 color: AppColors.secondaryTextColor.withOpacity(0.5),
//                               ),
//                             ),
//
//                           // Remove button shown if image selected
//                           if (imgFile != null)
//                             Positioned(
//                               top: 4,
//                               right: 4,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   _removeImage(index);
//                                 },
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: Colors.redAccent,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   padding: const EdgeInsets.all(4),
//                                   child: const Icon(
//                                     Icons.close,
//                                     size: 16,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//
//             GestureDetector(
//               onTap: () {
//                 if (!_hasAtLeastOneImage) {
//                   // Show error message if no image selected
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Please select at least one image')),
//                   );
//                   return;
//                 }
//
//                 // TODO: Submit logic here
//                 // For example, upload images to server or navigate to next page
//               },
//               child: Container(
//                 width: double.infinity,
//                 height: 50,
//                 margin: const EdgeInsets.only(top: 16),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   gradient: const LinearGradient(
//                     colors: [Colors.orange, Colors.blue],
//                   ),
//                 ),
//                 alignment: Alignment.center,
//                 child: Text(
//                   'Submit',
//                   style: CustomAppFontStyle.bold(16, Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


///todo:: setting the controller file



import 'package:beast_connect/views/screens/profileSetUp/profileSetUpAudio/profileSetUpAudio_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../utils/app_colors.dart';
import '../../../../widget/buttons/custom_text_button.dart';
import '../../../../widget/font/customAppFontStyle.dart';

import '../../../controller/profileSetUp/ProfileSetUpPhotoUpload_controller.dart';

class ProfileSetUpPhotoUploadScreenUi extends StatefulWidget {
  const ProfileSetUpPhotoUploadScreenUi({super.key});

  @override
  State<ProfileSetUpPhotoUploadScreenUi> createState() => _ProfileSetUpPhotoUploadScreenState();
}

class _ProfileSetUpPhotoUploadScreenState extends State<ProfileSetUpPhotoUploadScreenUi> {
  final controller = ProfileSetUpPhotoUploadController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {}); // Rebuild when controller notifies
    });
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tertiaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.tertiaryColor,
        elevation: 0,
        leading: BackButton(color: AppColors.secondaryTextColor),
        actions: [
          CustomTextButton(
            buttonText: 'Skip',
            textStyle: TextStyle(color: AppColors.secondaryTextColor),
            onPressed: () {
              // TODO: Add skip logic here
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Show your best ',
                    style: CustomAppFontStyle.bold(20, AppColors.secondaryTextColor),
                  ),
                  TextSpan(
                    text: 'Self',
                    style: CustomAppFontStyle.bold(20, AppColors.primaryColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'upload your six best photos to make a fantastic fast impression let personality shine',
              style: CustomAppFontStyle.regular(14, AppColors.secondaryTextColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Grid of 6 cards
            Expanded(
              child: GridView.builder(
                itemCount: controller.maxImages,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  final imgFile = controller.images[index];
                  return GestureDetector(
                    onTap: () {
                      if (imgFile == null) {
                        controller.pickImage(index);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.photoBoxColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: imgFile == null ? Colors.transparent : AppColors.primaryColor,
                          width: 2,
                        ),
                      ),
                      child: Stack(
                        children: [
                          if (imgFile != null)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                imgFile,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            )
                          else
                            Center(
                              child: Icon(
                                Icons.add_a_photo,
                                size: 40,
                                color: AppColors.secondaryTextColor.withOpacity(0.5),
                              ),
                            ),

                          // Remove button shown if image selected
                          if (imgFile != null)
                            Positioned(
                              top: 4,
                              right: 4,
                              child: GestureDetector(
                                onTap: () {
                                  controller.removeImage(index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  child: const Icon(
                                    Icons.close,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            GestureDetector(
              onTap: () {
                if (!controller.hasAtLeastOneImage) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select at least one image')),
                  );
                  return;
                }

                Get.to(() => ProfileSetUpAudioUi());
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
    );
  }
}
