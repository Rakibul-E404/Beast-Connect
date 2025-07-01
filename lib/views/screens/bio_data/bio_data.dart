import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../controller/bio_data_screen_controller.dart';

class BioDataScreen extends StatelessWidget {
  final Map<String, dynamic> user;
  final BioDataScreenController _controller = BioDataScreenController();

  BioDataScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryIconColor),
        ),
        backgroundColor: Colors.black,
        title: Text(
          'Profile Details',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            // Profile Image Section (outside the border)
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                user['image'],
                width: 160,
                height: 460,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Profile Details Section with border around all the rows
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12.0), // Rounded corners
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 46),
                    // name and age
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '${user['name']}, ${user['age']}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                        // location
                        Row(
                          children: [
                            Text(
                              user['location'] ?? 'Location not available',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    // Info rows wrapped in a border
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        // Border for all the rows
                        color: AppColors.boxContainerColor,
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ), // Rounded corners
                      ),
                      child: Column(
                        children: [
                          _controller.buildProfileDetailRow(
                            'Date of Birth',
                            user['dob'],
                          ),
                          _controller.buildProfileDetailRow(
                            'Height',
                            user['height'],
                          ),
                          _controller.buildProfileDetailRow(
                            'Religion',
                            user['religion'],
                          ),
                          _controller.buildProfileDetailRow(
                            'Qualification',
                            user['qualification'],
                          ),
                          _controller.buildProfileDetailRow(
                            'Gender',
                            user['gender'],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8,),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About",
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            // Wrap the Text widget with Expanded or Flexible
                            Expanded(  // Ensures text takes available space without overflow
                              child: Text(
                                "Hello there! I'm Vickie, seeking a lifelong adventure partner. A blend of tradition and modernity, I find joy in the simple moments and cherish family values. With a heart that believes in love's magic, I'm looking for someone to share happiness.",
                                style: TextStyle(
                                  color: AppColors.secondaryTextColor,
                                  fontSize: 18,
                                ),
                                softWrap: true,  // This ensures text wraps to the next line
                              ),
                            ),
                          ],
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // About Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                user['about'] ?? 'No bio available',
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
            const SizedBox(height: 20),

            // Interests Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Interests',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _controller.buildInterestChip(Icons.book, 'Reading'),
                _controller.buildInterestChip(Icons.music_note, 'Music'),
                _controller.buildInterestChip(Icons.sports_baseball, 'Sports'),
              ],
            ),
            const SizedBox(height: 20),

            // Videos Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Videos',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            _controller.buildVideosSection(),
          ],
        ),
      ),
    );
  }
}
