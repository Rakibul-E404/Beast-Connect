import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/controller/personal_profile_controller.dart';
import 'package:beast_connect/views/screens/Profile/settings/settings_screen/presentation/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PersonalProfileController(
      context,
      imagePath: 'assets/image/userImage.png', // Pass the image path here
    ); // Initialize the controller with the image path

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: AppColors.tertiaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Center(
                child: Column(
                  children: [
                    // Profile image with square frame and rounded corners
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        // Rounded corners
                        border: Border.all(
                          color: Colors.orange, // Border color
                          width: 0.5, // Border width
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        // Ensure the image also has rounded corners
                        child: Image.asset(
                          controller.imagePath,
                          // Use the image path from the controller
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    // User name
                    Text(
                      'Afsana Hamid', // Updated name
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    ///
                    /// --------- subscription level--------------
                    ///
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.quaternaryColor,
                        // Dark gray background
                        border: Border.all(color: AppColors.primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// Crown icon
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              FontAwesomeIcons.crown,
                              // Using campaign icon as crown alternative
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          SizedBox(width: 12),
                          ///-------------- BeastPlus text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'BeastPlus',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              ///------------- Months text
                              Row(
                                children: [
                                  Text(
                                    'Months',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          /// ----------container with coin icon
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  FontAwesomeIcons.coins, // Coin icon
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  '1000',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Menu buttons
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  _buildMenuButton(
                    label: "Personal Information",
                    icon: Icons.person,
                    onTap: () {
                      controller.navigateToScreen(PersonalInformationScreen());
                    },
                  ),
                  _buildMenuButton(
                    label: "Video Schedule",
                    icon: Icons.video_library,
                    onTap: () {
                      // Implement navigation for Video Schedule
                    },
                  ),
                  _buildMenuButton(
                    label: "My Connection List",
                    icon: MdiIcons.heart,
                    onTap: () {
                      // Implement navigation for My Connection List
                    },
                  ),
                  _buildMenuButton(
                    label: "My Challenges List",
                    icon: Icons.check_circle,
                    onTap: () {
                      // Implement navigation for My Challenges List
                    },
                  ),
                  _buildMenuButton(
                    label: "My Events List",
                    icon: Icons.event,
                    onTap: () {
                      // Implement navigation for My Events List
                    },
                  ),
                  _buildMenuButton(
                    label: "My Subscription",
                    icon: Icons.card_membership,
                    onTap: () {
                      // Implement navigation for My Subscription
                    },
                  ),
                  _buildMenuButton(
                    label: "Settings",
                    icon: Icons.settings,
                    onTap: () {
                      Get.to(() => SettingsScreen());
                    },
                  ),
                  _buildMenuButton(
                    label: "Logout",
                    icon: Icons.exit_to_app,
                    onTap: () {
                      controller.showLogoutDialog();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        ),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, size: 24, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    label,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

// Placeholder screens for navigation
class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Personal Information")),
      body: Center(child: Text("Personal Information Screen")),
    );
  }
}

// class SettingsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Settings")),
//       body: Center(child: Text("Settings Screen")),
//     );
//   }
// }
