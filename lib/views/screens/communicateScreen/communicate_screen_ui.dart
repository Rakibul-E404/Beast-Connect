// import 'package:beast_connect/views/screens/homeScreen/home_screen_ui.dart';
// import 'package:beast_connect/widget/navigationBars/customBottomNavigationBar.dart';
// import 'package:flutter/material.dart';
// import 'package:beast_connect/utils/app_colors.dart';
// import 'package:get/get.dart';
// import '../../../widget/buttons/Custom_Elevated_Button.dart';
// import '../../../widget/buttons/Custom_Outline_Button.dart';
// import '../connectionScreen/connection_screen_ui.dart';
//
// class CommunicateEventScreenUi extends StatefulWidget {
//   const CommunicateEventScreenUi({super.key});
//
//   @override
//   _CommunitiesEventScreenUiState createState() => _CommunitiesEventScreenUiState();
// }
//
// class _CommunitiesEventScreenUiState extends State<CommunicateEventScreenUi> {
//   // Variable to track selected button index, default to 0 (All Events)
//   int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,  // Set the background color to black
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         centerTitle: true,
//         title: const Text('Communities Event', style: TextStyle(color: Colors.white)),
//       ),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//             Text("Discover Events",style: TextStyle(color: AppColors.secondaryTextColor,fontSize: 20),),
//             Container(
//
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 gradient: LinearGradient(colors: [AppColors.primaryColor, AppColors.secondaryColor])
//               ),
//               child: CustomElevatedButton(
//                 onPressed: () {
//                   /// todo: handle the "Create Challenge" button click
//                 },
//                 buttonText: 'Create Event',
//                 textColor: AppColors.secondaryTextColor,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 isFullWidth: false, // Set false so it doesn't take the full width
//                 isRounded: true,
//                 height: 48,
//                 backgroundColor: Colors.transparent,
//                 elevation: 0,
//                 hasShadow: false,
//                 padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
//               ),
//             ),
//           ],),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomOutlinedButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedIndex = 0; // Set selectedIndex to 0 when 'All Events' is pressed
//                       });
//                     },
//                     buttonText: 'All Events',
//                     isRounded: true,
//                     borderSide: BorderSide(color: AppColors.primaryColor),
//                     foregroundColor: selectedIndex == 0 ? AppColors.primaryColor : Colors.white,
//                     backgroundColor: Colors.transparent,
//                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   ),
//                   const SizedBox(width: 8), // Space between buttons
//                   CustomOutlinedButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedIndex = 1;
//                       });
//                     },
//                     buttonText: 'Trivia nights',
//                     isRounded: true,
//                     borderSide: BorderSide(color: AppColors.primaryColor),
//                     foregroundColor: selectedIndex == 1 ? AppColors.primaryColor : Colors.white,
//                     backgroundColor: Colors.transparent,
//                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   ),
//                   const SizedBox(width: 8),
//                   CustomOutlinedButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedIndex = 2;
//                       });
//                     },
//                     buttonText: 'Cooking',
//                     isRounded: true,
//                     borderSide: BorderSide(color: AppColors.primaryColor),
//                     foregroundColor: selectedIndex == 2 ? AppColors.primaryColor : Colors.white,
//                     backgroundColor: Colors.transparent,
//                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   ),
//                   const SizedBox(width: 8),
//                   CustomOutlinedButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedIndex = 3;
//                       });
//                     },
//                     buttonText: 'Writing',
//                     isRounded: true,
//                     borderSide: BorderSide(color: AppColors.primaryColor),
//                     foregroundColor: selectedIndex == 3 ? AppColors.primaryColor : Colors.white,
//                     backgroundColor: Colors.transparent,
//                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   ),
//                   const SizedBox(width: 8),
//                   CustomOutlinedButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedIndex = 4;
//                       });
//                     },
//                     buttonText: 'Social Connection',
//                     isRounded: true,
//                     borderSide: BorderSide(color: AppColors.primaryColor),
//                     foregroundColor: selectedIndex == 4 ? AppColors.primaryColor : Colors.white,
//                     backgroundColor: Colors.transparent,
//                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               children: [
//                 _eventCard(
//                     'Yoga class',
//                     '10.06.2025',
//                     '06:00 PM',
//                     '21 Guests',
//                     'https://images.pexels.com/photos/4325452/pexels-photo-4325452.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' // Pass the image URL here
//                 ),
//                 _eventCard(
//                     'Trivia nights',
//                     '15.06.2025',
//                     '08:00 PM',
//                     '10 Guests',
//                     'https://images.pexels.com/photos/32511120/pexels-photo-32511120/free-photo-of-stunning-night-sky-filled-with-stars-and-nebulae.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' // Pass the image URL here
//                 ),
//                 _eventCard(
//                     'Social Works',
//                     '15.06.2025',
//                     '08:00 PM',
//                     '10 Guests',
//                     'https://images.pexels.com/photos/6590920/pexels-photo-6590920.jpeg?auto=compress&cs=tinysrgb&w=600' // Pass the image URL here
//                 ),
//                 _eventCard(
//                     'Writing Program',
//                     '15.06.2025',
//                     '08:00 PM',
//                     '10 Guests',
//                     'https://images.pexels.com/photos/4841641/pexels-photo-4841641.jpeg?auto=compress&cs=tinysrgb&w=600' // Pass the image URL here
//                 ),
//                 _eventCard(
//                     'Trivia nights',
//                     '15.06.2025',
//                     '08:00 PM',
//                     '10 Guests',
//                     'https://images.pexels.com/photos/933054/pexels-photo-933054.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' // Pass the image URL here
//                 ),
//                 _eventCard(
//                     'Trivia nights',
//                     '15.06.2025',
//                     '08:00 PM',
//                     '10 Guests',
//                     'https://images.pexels.com/photos/933054/pexels-photo-933054.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' // Pass the image URL here
//                 ),
//                 // Add other event cards as needed...
//               ],
//             ),
//           )
//
//
//         ],
//       ),
//       // bottomNavigationBar: CustomBottomNavBar(
//       //   items: [
//       //     BottomNavItem(label: 'Home', iconPath: 'assets/icon/home_icon.svg'),
//       //     BottomNavItem(label: 'Connection', iconPath: 'assets/icon/loveNew_icon.svg'),
//       //     BottomNavItem(label: 'Challenge', iconPath: 'assets/icon/frame_icon.svg'),
//       //     BottomNavItem(label: 'Communicate', iconPath: 'assets/icon/group_icon.svg'),
//       //     BottomNavItem(label: 'Profile', iconPath: 'assets/icon/profile_icon.svg'),
//       //   ],
//       //   currentIndex: _currentIndex,
//       //   onTap: (index) {
//       //     if (index == 0) {
//       //       Get.to(() => HomeScreenUi());
//       //     }
//       //     if (index == 1) {
//       //       Get.to(() => ConnectionScreenUi(screenWidth: MediaQuery.of(context).size.width));
//       //     }
//       //     if (index == 3) {
//       //       Get.to(() => CommunicateEventScreenUi());
//       //     }
//       //     setState(() {
//       //       _currentIndex = index;
//       //     });
//       //     _pageController.jumpToPage(index);
//       //   },
//       //   backgroundColor: Colors.black,
//       //   iconColor: Colors.white54,
//       //   selectedIconColor: Colors.orange,
//       //   iconLabelColor: Colors.white,
//       //   selectedIconLabelColor: Colors.orange,
//       // ),
//     );
//   }
//
//   Widget _eventCard(String title, String date, String time, String guests, String imageUrl) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       elevation: 5,
//       color: Colors.black, // Set the card color to black
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             // Show network image
//             Container(
//               width: 80,
//               height: 80,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Colors.grey[300], // Fallback color for image loading
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8), // Apply rounded corners to the image
//                 child: Image.network(
//                   imageUrl,
//                   fit: BoxFit.cover, // To ensure the image fills the container properly
//                   loadingBuilder: (context, child, loadingProgress) {
//                     if (loadingProgress == null) {
//                       return child;
//                     }
//                     return Center(
//                       child: CircularProgressIndicator(
//                         value: loadingProgress.expectedTotalBytes != null
//                             ? loadingProgress.cumulativeBytesLoaded /
//                             (loadingProgress.expectedTotalBytes ?? 1)
//                             : null,
//                       ),
//                     );
//                   },
//                   errorBuilder: (context, error, stackTrace) {
//                     return Center(child: Icon(Icons.error, color: Colors.white)); // Show error icon if the image fails to load
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     '$date • $time',
//                     style: const TextStyle(color: Colors.white),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     guests,
//                     style: const TextStyle(color: Colors.white),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




///todo: ;updating ,,



import 'package:flutter/material.dart';
import 'package:beast_connect/utils/app_colors.dart';
import 'package:get/get.dart';
import '../../../widget/buttons/Custom_Elevated_Button.dart';
import '../../../widget/buttons/Custom_Outline_Button.dart';
import '../connectionScreen/connection_screen_ui.dart';
import 'explore_communities_event_screen.dart';

class CommunicateEventScreenUi extends StatefulWidget {
  const CommunicateEventScreenUi({super.key});

  @override
  _CommunitiesEventScreenUiState createState() => _CommunitiesEventScreenUiState();
}

class _CommunitiesEventScreenUiState extends State<CommunicateEventScreenUi> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Communities Event', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Discover Events", style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 20)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [AppColors.primaryColor, AppColors.secondaryColor]),
                ),
                child: CustomElevatedButton(
                  onPressed: () {
                    /// todo: handle the "Create Challenge" button click
                  },
                  buttonText: 'Create Event',
                  textColor: AppColors.secondaryTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  isFullWidth: false,
                  isRounded: true,
                  height: 48,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  hasShadow: false,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomOutlinedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    buttonText: 'All Events',
                    isRounded: true,
                    borderSide: BorderSide(color: AppColors.primaryColor),
                    foregroundColor: selectedIndex == 0 ? AppColors.primaryColor : Colors.white,
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  const SizedBox(width: 8),
                  CustomOutlinedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    buttonText: 'Trivia nights',
                    isRounded: true,
                    borderSide: BorderSide(color: AppColors.primaryColor),
                    foregroundColor: selectedIndex == 1 ? AppColors.primaryColor : Colors.white,
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  const SizedBox(width: 8),
                  CustomOutlinedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    buttonText: 'Cooking',
                    isRounded: true,
                    borderSide: BorderSide(color: AppColors.primaryColor),
                    foregroundColor: selectedIndex == 2 ? AppColors.primaryColor : Colors.white,
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  const SizedBox(width: 8),
                  CustomOutlinedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    buttonText: 'Writing',
                    isRounded: true,
                    borderSide: BorderSide(color: AppColors.primaryColor),
                    foregroundColor: selectedIndex == 3 ? AppColors.primaryColor : Colors.white,
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  const SizedBox(width: 8),
                  CustomOutlinedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 4;
                      });
                    },
                    buttonText: 'Social Connection',
                    isRounded: true,
                    borderSide: BorderSide(color: AppColors.primaryColor),
                    foregroundColor: selectedIndex == 4 ? AppColors.primaryColor : Colors.white,
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _eventCard(
                  'Yoga class',
                  '10.06.2025',
                  '06:00 PM',
                  '21 Guests',
                  'https://images.pexels.com/photos/4325452/pexels-photo-4325452.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                ),
                _eventCard(
                  'Trivia nights',
                  '15.06.2025',
                  '08:00 PM',
                  '10 Guests',
                  'https://images.pexels.com/photos/32511120/pexels-photo-32511120/free-photo-of-stunning-night-sky-filled-with-stars-and-nebulae.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  onTap: () {
                    Get.to(() => ExploreCommunitiesEventScreen(
                      title: 'Trivia nights',
                      subtitle: 'Think you can outsmart the crowd? Join us for a fun night of trivia, laughs, and surprise facts!',
                      dateTime: '15.06.2025, 08:00 PM',
                      location: 'New York, USA',
                      guests: '10 People are already coming in this event!',
                      imageUrl: 'https://images.pexels.com/photos/32511120/pexels-photo-32511120/free-photo-of-stunning-night-sky-filled-with-stars-and-nebulae.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ));
                  },
                ),
                _eventCard(
                  'Social Works',
                  '15.06.2025',
                  '08:00 PM',
                  '10 Guests',
                  'https://images.pexels.com/photos/6590920/pexels-photo-6590920.jpeg?auto=compress&cs=tinysrgb&w=600',
                ),
                _eventCard(
                  'Writing Program',
                  '15.06.2025',
                  '08:00 PM',
                  '10 Guests',
                  'https://images.pexels.com/photos/4841641/pexels-photo-4841641.jpeg?auto=compress&cs=tinysrgb&w=600',
                ),
                _eventCard(
                  'Trivia nights',
                  '15.06.2025',
                  '08:00 PM',
                  '10 Guests',
                  'https://images.pexels.com/photos/933054/pexels-photo-933054.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  onTap: () {
                    Get.to(() => ExploreCommunitiesEventScreen(
                      title: 'Trivia nights',
                      subtitle: 'Think you can outsmart the crowd? Join us for a fun night of trivia, laughs, and surprise facts!',
                      dateTime: '15.06.2025, 08:00 PM',
                      location: 'New York, USA',
                      guests: '10 People are already coming in this event!',
                      imageUrl: 'https://images.pexels.com/photos/933054/pexels-photo-933054.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ));
                  },
                ),
                _eventCard(
                  'Trivia nights',
                  '15.06.2025',
                  '08:00 PM',
                  '10 Guests',
                  'https://images.pexels.com/photos/933054/pexels-photo-933054.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  onTap: () {
                    Get.to(() => ExploreCommunitiesEventScreen(
                      title: 'Trivia nights',
                      subtitle: 'Think you can outsmart the crowd? Join us for a fun night of trivia, laughs, and surprise facts!',
                      dateTime: '15.06.2025, 08:00 PM',
                      location: 'New York, USA',
                      guests: '10 People are already coming in this event!',
                      imageUrl: 'https://images.pexels.com/photos/933054/pexels-photo-933054.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ));
                  },
                ),
              ],
            ),
          ),
        ],
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
      //     if (index == 0) {
      //       Get.to(() => HomeScreenUi());
      //     }
      //     if (index == 1) {
      //       Get.to(() => ConnectionScreenUi(screenWidth: MediaQuery.of(context).size.width));
      //     }
      //     if (index == 3) {
      //       Get.to(() => CommunicateEventScreenUi());
      //     }
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //     _pageController.jumpToPage(index);
      //   },
      //   backgroundColor: Colors.black,
      //   iconColor: Colors.white54,
      //   selectedIconColor: Colors.orange,
      //   iconLabelColor: Colors.white,
      //   selectedIconLabelColor: Colors.orange,
      // ),
    );
  }

  Widget _eventCard(String title, String date, String time, String guests, String imageUrl, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Icon(Icons.error, color: Colors.white));
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$date • $time',
                      style: const TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      guests,
                      style: const TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}