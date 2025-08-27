// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../utils/app_colors.dart';
// import '../../controller/connection_screen_controller.dart';
// import '../bio_data/bio_data.dart';
//
// class ConnectionScreenUi extends StatefulWidget {
//   final double screenWidth;
//
//   const ConnectionScreenUi({
//     super.key,
//     required this.screenWidth,
//   });
//
//   @override
//   _ConnectionScreenUiState createState() => _ConnectionScreenUiState();
// }
//
// class _ConnectionScreenUiState extends State<ConnectionScreenUi> {
//   final ConnectionScreenController _controller = ConnectionScreenController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.black,
//         title: Text(
//           'Match List',
//           style: TextStyle(color: Colors.white, fontSize: 25),
//         ),
//         centerTitle: true,
//         actions: [
//           CircleAvatar(
//             backgroundColor: AppColors.filterIconCircleColor,
//             radius: 20,
//             child: IconButton(
//               onPressed: () {
//                 _controller.showFilterBottomSheet(context);
//               },
//               icon: Icon(
//                 Icons.filter_alt,
//                 color: AppColors.primaryIconColor,
//                 size: 23,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // number of columns
//             crossAxisSpacing: 12, // column spacing
//             mainAxisSpacing: 12, // row spacing
//           ),
//           itemCount: Connections.length, // static data list
//           itemBuilder: (context, index) {
//             var user = Connections[index];
//             return GestureDetector(
//               onTap: () {
//                 Get.to(() => BioDataScreen(user: user));
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   image: DecorationImage(
//                     image: NetworkImage(user['image']),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     // Positioned circle outside and above the glass blur container
//                     Positioned(
//                       bottom: 90, // adjust as needed to be outside blur container
//                       left: 50,    // horizontal position
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,  // Center the items horizontally
//                         mainAxisSize: MainAxisSize.min, // Prevent Row from taking the full width
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               /// set teh tap method
//                             },
//                             child: Container(
//                               width: 24,
//                               height: 24,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(30),
//                                 border: Border.all(color: Colors.white, width: 2), // optional border
//                               ),
//                               child: Center( // Centers the icon inside the container
//                                 child: Icon(
//                                   Icons.thumb_up_outlined, // Replace with your desired icon
//                                   color: AppColors.primaryColor, // Icon color
//                                   size: 16, // Icon size
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 8), // Add some space between the icons
//                           Container(
//                             width: 24,
//                             height: 24,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(30),
//                               border: Border.all(color: Colors.white, width: 2), // optional border
//                             ),
//                             child: Center( // Centers the icon inside the container
//                               child: Icon(
//                                 Icons.thumb_down_alt_outlined, // Replace with your desired icon
//                                 color: AppColors.primaryColor, // Icon color
//                                 size: 16, // Icon size
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 8), // Add some space between the icons
//                           Container(
//                             width: 24,
//                             height: 24,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(30),
//                               border: Border.all(color: Colors.white, width: 2), // optional border
//                             ),
//                             child: Center( // Centers the icon inside the container
//                               child: Icon(
//                                 Icons.info_rounded, // Replace with your desired icon
//                                 color: AppColors.primaryColor, // Icon color
//                                 size: 16, // Icon size
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     // Positioned backdrop filter glass container
//                     Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(12),
//                         child: BackdropFilter(
//                           filter:
//                           ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//                           child: Container(
//                             width: double.infinity,
//                             color: Colors.white.withOpacity(0.1),
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 8, vertical: 6),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text(
//                                       "${user['name']} - ${user['age']}",
//                                       style: const TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     const Spacer(),
//                                     Icon(
//                                       Icons.circle,
//                                       color: (user['active'] as bool)
//                                           ? Colors.greenAccent
//                                           : Colors.grey,
//                                       size: 12,
//                                     ),
//                                     const SizedBox(width: 6),
//                                     Text(
//                                       (user['active'] as bool)
//                                           ? "Active"
//                                           : "Offline",
//                                       style: const TextStyle(
//                                           color: Colors.white70, fontSize: 12),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Row(
//                                   children: [
//                                     Text("${user['gender']}",
//                                         style: const TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.normal)),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.location_on,
//                                       color: AppColors.primaryIconColor,
//                                       size: 20,
//                                     ),
//                                     const SizedBox(width: 8),
//                                     Text("${user['location']}",
//                                         style: const TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.normal)),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//








///
///
///
///
///
///
///
///
///
///
///
///





import 'dart:ui';

import 'package:beast_connect/views/screens/match_connection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/connection_screen_controller.dart';
import '../../../utils/app_colors.dart';
import '../bio_data/bio_data.dart';

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
  final ConnectionScreenController _controller = ConnectionScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text(
          'Match List',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.filterIconCircleColor,
            radius: 20,
            child: IconButton(
              onPressed: () {
                _controller.showFilterBottomSheet(context);
              },
              icon: Icon(
                Icons.filter_alt,
                color: AppColors.primaryIconColor,
                size: 23,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of columns
            crossAxisSpacing: 12, // column spacing
            mainAxisSpacing: 12, // row spacing
          ),
          itemCount: Connections.length, // static data list
          itemBuilder: (context, index) {
            var user = Connections[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => BioDataScreen(user: user));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(user['image']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    // Positioned circle outside and above the glass blur container
                    Positioned(
                      bottom: 90, // adjust as needed to be outside blur container
                      left: 50,    // horizontal position
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,  // Center the items horizontally
                        mainAxisSize: MainAxisSize.min, // Prevent Row from taking the full width
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigate to the LikedProfileScreen with the user data
                              Get.to(() => MatchConnectionScreen(user: user));
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.white, width: 2), // optional border
                              ),
                              child: Center( // Centers the icon inside the container
                                child: Icon(
                                  Icons.thumb_up_outlined, // Like icon
                                  color: AppColors.primaryColor, // Icon color
                                  size: 16, // Icon size
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8), // Add some space between the icons
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white, width: 2), // optional border
                            ),
                            child: Center( // Centers the icon inside the container
                              child: Icon(
                                Icons.thumb_down_alt_outlined, // Dislike icon
                                color: AppColors.primaryColor, // Icon color
                                size: 16, // Icon size
                              ),
                            ),
                          ),
                          SizedBox(width: 8), // Add some space between the icons
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white, width: 2), // optional border
                            ),
                            child: Center( // Centers the icon inside the container
                              child: Icon(
                                Icons.info_rounded, // Info icon
                                color: AppColors.primaryColor, // Icon color
                                size: 16, // Icon size
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Positioned backdrop filter glass container
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: BackdropFilter(
                          filter:
                          ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            width: double.infinity,
                            color: Colors.white.withOpacity(0.1),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${user['name']} - ${user['age']}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
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
                                      (user['active'] as bool)
                                          ? "Active"
                                          : "Offline",
                                      style: const TextStyle(
                                          color: Colors.white70, fontSize: 12),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text("${user['gender']}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColors.primaryIconColor,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text("${user['location']}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
