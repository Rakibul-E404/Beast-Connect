import 'package:beast_connect/views/screens/homeScreen/home_screen_widget/user_post_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/asset_path.dart';
import '../../../widget/font/customAppFontStyle.dart';
import '../../controller/home_screen_controller.dart';
import 'home_screen_widget/joinCallWidget.dart';
import 'home_screen_widget/nextEventWidget.dart';
import 'home_screen_widget/popularConnectionsWidget.dart';
import 'home_screen_widget/rankedUsersWidget.dart';
import 'home_screen_widget/sectionHeader.dart';

/// =========================>
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
            // Background Image
            Transform.translate(
              offset: const Offset(0, 0),
              child: SizedBox(
                width: double.infinity, // Set width to infinity
                child: Image.asset(
                  'assets/image/appbar_image.png',
                  fit: BoxFit.cover, // Adjust to cover the entire width
                ),
              ),
            ),
            // Top Content: Logo, Text, Icons
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
                              color: Colors.black.withValues(alpha: 0.12),  // Equivalent to alpha = 30 (out of 255)
                              borderRadius: BorderRadius.circular(30)),
                          child: IconButton(
                            icon: const Icon(CupertinoIcons.bell),
                            onPressed: () {},
                            color: Colors.white,
                            iconSize: 28,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.12),  // Equivalent to alpha = 30 (out of 255)
                              borderRadius: BorderRadius.circular(30)),
                          child: IconButton(
                            // icon: const Icon(Icons.chat_bubble_outline),
                            icon: const Icon(CupertinoIcons.chat_bubble),
                            onPressed: () {},
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
            /// todo:::::::::::::::::::::::::::::::::: [search section row] ::::::::::::::::::::::::::::::::::::::::::
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
                                // ? controller.popularConnections[0]['image']
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
                          padding: const EdgeInsets.all(2), // Border thickness
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[900], // Background color
                              borderRadius: BorderRadius.circular(
                                22,
                              ), // Inner radius
                            ),
                            child: const TextField(
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
                          onPressed: () {
                            // Your image upload code here
                          },
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
      body: SingleChildScrollView(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ///
            /// todo:::::::::::::::: [Filter Buttons with controller logic] ::::::::::::::::::::::::::
            ///
            Obx(() {
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

            const SizedBox(height: 20),
            ///
            /// todo:::::::::::::::::::::::::::::::::::::::: [User Post Section] ::::::::::::::::::::::::::::::::::::::::::
            ///
            UserPostSection(),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                color: AppColors.quaternaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      buildSectionHeader('Popular Connections'),
                      SizedBox(height: 10,),
                      PopularConnectionsWidget(
                        popularConnections: controller.popularConnections,
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            buildSectionHeader('Join Your Next Event'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // First widget
                  SizedBox(
                    width: screenWidth * 0.8,  // Give more space
                    child: JoinNextEventWidget(screenWidth: screenWidth * 0.8), // Pass adjusted width
                  ),
                  const SizedBox(width: 16), // Consistent spacing
                  // Second widget
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: JoinNextEventWidget(screenWidth: screenWidth * 0.8),
                  ),
                  const SizedBox(width: 16), // End spacing
                ],
              ),
            ),


            const SizedBox(height: 20),

            buildSectionHeader('Join A Call'),
            JoinCallWidget(),
            const SizedBox(height: 20),

            RankedUsersWidget(
              rankedUsers: controller.rankedUsers,
              screenWidth: screenWidth,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}





/// todo settign the horizontal filter with the appbar
///


