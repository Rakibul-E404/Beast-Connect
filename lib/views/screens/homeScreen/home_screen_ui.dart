import 'package:beast_connect/views/screens/homeScreen/create_post_screen.dart';
import 'package:beast_connect/views/screens/homeScreen/home_screen_widget/tag_files/fitness_tag_screen.dart';
import 'package:beast_connect/views/screens/homeScreen/message/message_screen.dart';
import 'package:beast_connect/views/screens/homeScreen/notificaiton/notification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_screen_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/asset_path.dart';
import '../../../widget/font/customAppFontStyle.dart';
import 'home_screen_widget/tag_files/all_tag_screen.dart';

class HomeScreenUi extends StatefulWidget {
  const HomeScreenUi({super.key});

  @override
  _HomeScreenUiState createState() => _HomeScreenUiState();
}

class _HomeScreenUiState extends State<HomeScreenUi> {
  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 200,
        flexibleSpace: Stack(
          children: [
            /// Background Image
            Transform.translate(
              offset: const Offset(0, 0),
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/image/appbar_image.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            /// Top Content: Logo, Text, Icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(-12, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            AppAssetPath.logo,
                            fit: BoxFit.contain,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Connect ',
                            style: CustomAppFontStyle.bold(
                              18,
                              AppColors.secondaryColor,
                            ),
                            children: [
                              TextSpan(
                                text: 'Challenge',
                                style: CustomAppFontStyle.bold(
                                  18,
                                  AppColors.secondaryTextColor,
                                ),
                              ),
                              TextSpan(
                                text: 'Thrive',
                                style: CustomAppFontStyle.bold(
                                  18,
                                  AppColors.secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(30)),
                          child: IconButton(
                            icon: const Icon(CupertinoIcons.bell),
                            onPressed: () {
                              Get.to(NotificationScreen());
                            },
                            color: Colors.white,
                            iconSize: 28,
                          ),
                        ),
                        SizedBox(width: 10, ),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(30)),
                          child: IconButton(
                            icon: const Icon(CupertinoIcons.chat_bubble),
                            onPressed: () {
                              Get.to(()=>MessageScreen());
                            },
                            color: Colors.white,
                            iconSize: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///
            /// :::::::::::::::::: Search section ::::::::::::::::::::
            ///
            Align(
              alignment: Alignment.bottomCenter,
              child: Transform.translate(
                offset: const Offset(0, -20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                            controller.popularConnections.isNotEmpty
                                ? "https://thumbs.dreamstime.com/b/portrait-cheerful-smiling-young-man-folded-arms-joyful-handsome-men-crossed-hands-studio-shot-isolated-gray-195089624.jpg"
                                : 'https://via.placeholder.com/150',
                          ),
                          backgroundColor: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.6),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            gradient: LinearGradient(
                              colors: [
                                AppColors.primaryColor,
                                AppColors.secondaryColor,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: TextField(
                              onTap: (){
                                Get.to(CreatePostScreen());
                                FocusScope.of(context).requestFocus(FocusNode());
                                },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white54,
                                ),
                                hintText: "Share your thoughts",
                                hintStyle: TextStyle(color: Colors.white54),
                                border: InputBorder.none,
                                isDense: false,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                            ),
                          ),


                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.image,
                            size: 30,
                            color: Colors.orange,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Obx(() {
              // Show AllTagSection for 'All' tag
              if (controller.selectedTag.value == 'All') {
                return AllTagSection(
                  screenWidth: screenWidth,
                  controller: controller,
                );
              }
              // Show FitnessTagSection for 'Fitness' tag
              else if (controller.selectedTag.value == 'Fitness') {
                final filteredContent = controller.getFilteredContent();
                return FitnessTagSection(
                  screenWidth: screenWidth,
                  controller: controller,
                  content: filteredContent,
                );
              }
              // Add more conditions for other tags if needed
              else {
                // You can handle other tags here if needed, or return an empty container
                return Center(
                  child: Text(
                    'No content available for selected tag',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
            }),
          ),



          ///
          /// ::::::::::::::::::::::::::::::::::: Filter buttons row :::::::::::::::::::::::::::::::::::::
          ///
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 60,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              color: Colors.black,
              child: Obx(() {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: controller.filterTags.map((tagMap) {
                      final tagName = tagMap['name'] ?? '';
                      final isSelected = controller.selectedTag.value == tagName;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(
                            tagName,
                            style: TextStyle(
                              color: isSelected ? Colors.black : Colors.white,
                            ),
                          ),
                          selected: isSelected,
                          selectedColor: Colors.orange,
                          backgroundColor: Colors.grey[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          onSelected: (_) => controller.selectTag(tagName),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
