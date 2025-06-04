
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

class HomeScreenUi extends StatelessWidget {
  HomeScreenUi({super.key});
  final HomeScreenController controller = Get.put(HomeScreenController());

  List<dynamic> rankedUsers = [
    {'name': 'User 1', 'score': 100, 'image': 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80'},
    {'name': 'User 2', 'score': 200, 'image': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=400&q=80'},
    // Add more users here
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 220,
        flexibleSpace: Stack(
          children: [
            // Background Image - originally Positioned.fill
            Transform.translate(
              offset: const Offset(0, -25),
              child: SizedBox.expand(
                child: Image.asset(
                  'assets/image/Vector 3.png',
                  fit: BoxFit.scaleDown,
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
                            style: CustomAppFontStyle.bold(18, AppColors.secondaryColor),
                            children: [
                              TextSpan(
                                text: 'Challenge',
                                style: CustomAppFontStyle.bold(18, AppColors.secondaryTextColor),
                              ),
                              TextSpan(
                                text: 'Thrive',
                                style: CustomAppFontStyle.bold(18, AppColors.secondaryColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.notifications_none),
                          onPressed: () {},
                          color: Colors.white,
                          iconSize: 28,
                        ),
                        IconButton(
                          icon: const Icon(Icons.chat_bubble_outline),
                          onPressed: () {},
                          color: Colors.white,
                          iconSize: 28,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Chat Input Row - originally Positioned bottom: 20
            Align(
              alignment: Alignment.bottomCenter,
              child: Transform.translate(
                offset: const Offset(0, -20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                          controller.popularConnections.isNotEmpty
                              ? controller.popularConnections[0]['image'] as String
                              : 'https://via.placeholder.com/150',
                        ),
                        backgroundColor: Colors.grey[700],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.6),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              icon: Icon(Icons.search, color: Colors.white54),
                              hintText: "Share your thoughts",
                              hintStyle: TextStyle(color: Colors.white54),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
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
                          icon: const Icon(Icons.image, color: Colors.white54),
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
            // Filter Buttons with controller logic only
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
                          style: TextStyle(color: isSelected ? Colors.black : Colors.white),
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
            // User Post Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: screenWidth * 0.06,
                  backgroundImage:
                  NetworkImage(controller.popularConnections[0]['image'] as String),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      controller.userMessage,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.more_vert, color: Colors.white54),
              ],
            ),

            const SizedBox(height: 20),


            buildSectionHeader('Popular Connections'),
            PopularConnectionsWidget(
              popularConnections: controller.popularConnections,
              screenWidth: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 20),

            buildSectionHeader('Join Your Next Event'),
            JoinNextEventWidget(
              joinNextEvents: [
                {'image': 'https://images.unsplash.com/photo-1540206395-68808572332f?auto=format&fit=crop&w=400&q=80'},
                {'image': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=400&q=80'},
                {'image': 'https://images.unsplash.com/photo-1540206395-68808572332f?auto=format&fit=crop&w=400&q=80'},
                // Add more events here...
              ],
              screenWidth: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 20),

            buildSectionHeader('Join A Call'),
            JoinCallWidget(
              joinCalls: [
                {
                  'image': 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80',
                  'name': 'Call 1',
                  'event': 'Event 1',
                  'date': '2025-06-04',
                  'duration': '1h 30m',
                },
                {
                  'image': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=400&q=80',
                  'name': 'Call 2',
                  'event': 'Event 2',
                  'date': '2025-06-04',
                  'duration': '1h 30m',
                },
                // Add more calls here...
              ],
            ),
            const SizedBox(height: 20),




            RankedUsersWidget(
              rankedUsers: rankedUsers,
              screenWidth: screenWidth,
            ),

            const SizedBox(height: 40),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white54,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Connection"),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: "Challenge"),
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: "Communicate"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
