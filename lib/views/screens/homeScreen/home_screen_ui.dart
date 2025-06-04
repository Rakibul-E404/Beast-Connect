
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/asset_path.dart';
import '../../../widget/font/customAppFontStyle.dart';
import '../../controller/home_screen_controller.dart';

class HomeScreenUi extends StatelessWidget {
  HomeScreenUi({super.key});

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar:





      AppBar(
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
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
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

            // Popular Connections Section
            _buildSectionHeader('Popular Connections'),
            const SizedBox(height: 8),
            SizedBox(
              height: screenWidth * 0.5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.popularConnections.length,
                itemBuilder: (context, index) {
                  var user = controller.popularConnections[index];
                  return Container(
                    width: screenWidth * 0.4,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(user['image'] as String),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 12,
                          left: 12,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "${user['name'] as String}, ${user['age']}",
                                  style: const TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.circle,
                                  color: (user['active'] as bool)
                                      ? Colors.greenAccent
                                      : Colors.grey,
                                  size: 12,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  (user['active'] as bool) ? "Active" : "Offline",
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Join Your Next Event Section
            _buildSectionHeader('Join Your Next Event'),
            const SizedBox(height: 8),
            SizedBox(
              height: screenWidth * 0.25,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.45,
                    height: screenWidth * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(controller.nextEvents[0]['image'] as String),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.nextEvents.length - 1,
                      itemBuilder: (context, index) {
                        var imgIndex = index + 1;
                        return Container(
                          width: screenWidth * 0.1,
                          height: screenWidth * 0.1,
                          margin: EdgeInsets.only(
                              right: imgIndex == controller.nextEvents.length - 1 ? 0 : 1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1.5),
                            image: DecorationImage(
                              image:
                              NetworkImage(controller.nextEvents[imgIndex]['image'] as String),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.1,
                    height: screenWidth * 0.1,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.orange, width: 2),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.orange,
                        size: screenWidth * 0.05,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Join A Call Section
            _buildSectionHeader('Join A Call'),
            const SizedBox(height: 8),
            SizedBox(
              height: screenWidth * 0.5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.joinCalls.length,
                itemBuilder: (context, index) {
                  var call = controller.joinCalls[index];
                  return Container(
                    width: screenWidth * 0.4,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                          child: Stack(
                            children: [
                              Image.network(
                                call['image'] as String,
                                height: screenWidth * 0.25,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(
                                    color: Colors.orange,
                                    shape: BoxShape.circle,
                                  ),
                                  child:
                                  const Icon(Icons.videocam, size: 18, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                call['name'] as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                call['event'] as String,
                                style: const TextStyle(color: Colors.white70, fontSize: 12),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${call['date'] as String} • ${call['duration'] as String}',
                                style: const TextStyle(color: Colors.white54, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Ranked Users Section
            _buildSectionHeader('Ranked Users'),
            const SizedBox(height: 8),
            SizedBox(
              height: screenWidth * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.rankedUsers.length,
                itemBuilder: (context, index) {
                  var user = controller.rankedUsers[index];
                  return Container(
                    width: screenWidth * 0.6,
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(32),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.orange, width: 2),
                              ),
                              child: CircleAvatar(
                                radius: screenWidth * 0.08,
                                backgroundImage: (user['image'] != null &&
                                    (user['image'] as String).isNotEmpty)
                                    ? NetworkImage(user['image'] as String)
                                    : AssetImage('assets/images/default_user.png')
                                as ImageProvider,
                                backgroundColor: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user['name'] as String,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Brainy challenge: ${user['score']}',
                                    style: const TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          left: -2,
                          child: Icon(
                            Icons.emoji_events,
                            color: Colors.orange,
                            size: screenWidth * 0.07,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
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

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const Spacer(),
        const Text(
          'See all',
          style: TextStyle(color: Colors.white70, fontSize: 12),
        )
      ],
    );
  }
}


