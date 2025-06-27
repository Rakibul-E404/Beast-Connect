import 'package:beast_connect/views/screens/homeScreen/home_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../widget/buttons/Custom_Elevated_Button.dart';
import '../../../widget/buttons/Custom_Outline_Button.dart';
import '../../../widget/navigationBars/customBottomNavigationBar.dart';
import '../../controller/connection_screen_controller.dart';
import '../communicateScreen/communicate_screen_ui.dart';

class ConnectionScreenUi extends StatefulWidget {
  final double screenWidth;

  const ConnectionScreenUi({
    super.key,
    required this.screenWidth,
  });

  @override
  _ConnectionScreenUiState createState() => _ConnectionScreenUiState();
}

class _ConnectionScreenUiState extends State<ConnectionScreenUi> {
  final PageController _pageController = PageController();
  int _currentIndex = 1;

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text('Filters', style: Theme.of(context).textTheme.titleLarge)),
              SizedBox(height: 20), // Add some space before the button

              CustomOutlinedButton(
                onPressed: () {
                  ///todo
                },
                buttonText: 'Hobbies',
                textColor: AppColors.primaryTextColor,
                isFullWidth: true,
                isRounded: true,
                height: 44,
                suffixIcon: Icon(Icons.arrow_forward_ios),
                iconColor: AppColors.primaryColor,
                foregroundColor: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              SizedBox(height: 20),
              CustomOutlinedButton(
                onPressed: () {
                  ///todo
                },
                buttonText: 'Networking',
                textColor: AppColors.primaryTextColor,
                isFullWidth: true,
                isRounded: true,
                height: 44,
                suffixIcon: Icon(Icons.arrow_forward_ios),
                iconColor: AppColors.primaryColor,
                foregroundColor: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              SizedBox(height: 20),
              CustomOutlinedButton(
                onPressed: () {
                  // Your logic here
                },
                buttonText: 'Friends',
                textColor: AppColors.primaryTextColor,
                isFullWidth: true,
                isRounded: true,
                height: 44,
                suffixIcon: Icon(Icons.arrow_forward_ios),
                iconColor: AppColors.primaryColor,
                foregroundColor: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: CustomElevatedButton(
                  onPressed: () {
                    /// todo
                  },
                  buttonText: 'Apply',
                  textColor: AppColors.secondaryTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  isFullWidth: true,
                  isRounded: true,
                  height: 48,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  hasShadow: false,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Match List'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.to(HomeScreenUi()); // Go back to previous screen
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showModalBottomSheet(context); // Show sorting options
            },
            icon: Icon(Icons.sort),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Set the number of columns
          crossAxisSpacing: 12, // Space between columns
          mainAxisSpacing: 12, // Space between rows
        ),
        itemCount: Connections.length, // Using the static data
        itemBuilder: (context, index) {
          var user = Connections[index]; // Accessing the static data
          return Container(
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
                          "${user['name']} - ${user['age']}",
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
      // bottomNavigationBar: CustomBottomNavBar(
      //   items: [
      //     BottomNavItem(label: 'Home', iconPath: 'assets/icon/home_icon.svg'),
      //     BottomNavItem(label: 'Connection', iconPath: 'assets/icon/loveNew_icon.svg'),
      //     BottomNavItem(label: 'Challenge', iconPath: 'assets/icon/frame_icon.svg'),
      //     BottomNavItem(label: 'Communicate', iconPath: 'assets/icon/group_icon.svg'),
      //     BottomNavItem(label: 'Profile', iconPath: 'assets/icon/profile_icon.svg'),
      //   ],
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     if (index == 0)
      //     {Get.to(()=> HomeScreenUi());}
      //     if (index == 1)
      //     {Get.to(()=> ConnectionScreenUi(screenWidth: MediaQuery.of(context).size.width,));}
      //     if (index == 2)
      //     {Get.to(()=> ());}
      //     if (index == 3)
      //     {Get.to(()=> CommunicateEventScreenUi());}
      //     setState(() {
      //       _currentIndex = index; // Update the current index
      //     });
      //     _pageController.jumpToPage(index); // Navigate to the selected screen
      //   },
      //   backgroundColor: Colors.black,
      //   iconColor: Colors.white54,
      //   selectedIconColor: Colors.orange,
      //   iconLabelColor: Colors.white,
      //   selectedIconLabelColor: Colors.orange,
      // ),
    );
  }
}

