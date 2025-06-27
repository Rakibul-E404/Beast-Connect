import 'package:beast_connect/views/screens/challange_screen/challange_screen_ui.dart';
import 'package:beast_connect/views/screens/communicateScreen/communicate_screen_ui.dart';
import 'package:beast_connect/views/screens/connectionScreen/connection_screen_ui.dart';
import 'package:beast_connect/views/screens/homeScreen/home_screen_ui.dart';
import 'package:beast_connect/views/screens/profileSetUp/profileSetUpAudio/profileSetUpAudio_ui.dart';
import 'package:flutter/material.dart';

import '../widget/navigationBars/customBottomNavigationBar.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Define the screens
  final List<Widget> _screens = [
    HomeScreenUi(),
    ConnectionScreenUi(screenWidth: double.infinity),
    ChallengeScreenUi(),
    CommunicateEventScreenUi(),
    ProfileSetUpAudioUi(), // Assuming ProfileScreenUi is defined
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
        items: [
          BottomNavItem(label: 'Home', iconPath: 'assets/icon/home_icon.svg'),
          BottomNavItem(label: 'Connection', iconPath: 'assets/icon/loveNew_icon.svg'),
          BottomNavItem(label: 'Challenge', iconPath: 'assets/icon/frame_icon.svg'),
          BottomNavItem(label: 'Communicate', iconPath: 'assets/icon/group_icon.svg'),
          BottomNavItem(label: 'Profile', iconPath: 'assets/icon/profile_icon.svg'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index); // Navigate to the selected screen
        },
        backgroundColor: Colors.black,
        iconColor: Colors.white54,
        selectedIconColor: Colors.orange,
        iconLabelColor: Colors.white,
        selectedIconLabelColor: Colors.orange,
      ),
    );
  }
}
