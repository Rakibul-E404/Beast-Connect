import 'package:beast_connect/views/screens/bio_data/about_section.dart';
import 'package:beast_connect/views/screens/bio_data/gallery_section.dart';
import 'package:beast_connect/views/screens/bio_data/information_container_section.dart';
import 'package:beast_connect/views/screens/bio_data/interests_section.dart';
import 'package:beast_connect/views/screens/bio_data/video_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../utils/app_colors.dart';
import 'music_section.dart';
import 'name_age_location_section.dart';

class BioDataScreen extends StatefulWidget {
  final Map<String, dynamic> user;


  const BioDataScreen({super.key, required this.user});

  @override
  _BioDataScreenState createState() => _BioDataScreenState();
}

class _BioDataScreenState extends State<BioDataScreen> {
  // late VideoPlayerController _videoController;
  // bool _isVideoLoading = true;
  // // final BioDataScreenController _controller = BioDataScreenController();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _initializeVideoPlayer();
  // }
  //
  // void _initializeVideoPlayer() {
  //   _videoController = VideoPlayerController.networkUrl(
  //     Uri.parse('https://www.w3schools.com/html/mov_bbb.mp4'),
  //   )..initialize().then((_) {
  //     setState(() {
  //       _isVideoLoading = false;
  //     });
  //     _videoController.play();
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   _videoController.dispose();
  // }

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
        child: Stack(
          children: [
            // Main scrollable content
            ListView(
              children: [
                // Profile Image Section
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      widget.user['image'],
                      width: Get.width,
                      height: 460,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Bio label and container wrapper
                Stack(
                  children: [
                    // Main container with border
                    Container(
                      margin: const EdgeInsets.only(top: 12), // Space for Bio label
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 20), // Space at top for Bio label
                            /// Name-Age and location section
                            NameAgeLocation_Section(user: widget.user),
                            const SizedBox(height: 12),
                            /// Information container section
                            InformationContainer(user: widget.user),
                            const SizedBox(height: 12),
                            /// About Section
                            AboutSection(user: widget.user),
                            const SizedBox(height: 20),
                            /// Interests Section
                            InterestsSection(user: widget.user),
                            const SizedBox(height: 20),
                            /// Videos Section
                            VideoSection(),
                            const SizedBox(height: 20),
                            /// Music Section
                            MusicSection(),
                            const SizedBox(height: 20),
                            /// Gallery Section
                            GallerySection(),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),

                    // Bio label positioned over the border
                    Positioned(
                      top: 0,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white, // Background to cover the border
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'Bio',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}