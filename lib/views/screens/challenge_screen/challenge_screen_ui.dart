// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../utils/app_colors.dart';
// import '../../../widget/buttons/Custom_Elevated_Button.dart';
// import '../../controller/challenge_screen_controller.dart';
//
// class ChallengeScreenUi extends StatelessWidget {
//   final ChallengeScreenController controller = Get.put(ChallengeScreenController());
//
//    ChallengeScreenUi({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//         title: Text(
//           'Challenges',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: GetBuilder<ChallengeScreenController>(
//         builder: (controller) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header Section
//               _buildHeaderSection(),
//               SizedBox(height: 20),
//               // Category Selection Chips
//               _buildCategoryChips(controller),
//               SizedBox(height: 20),
//               // Challenges Grid
//               _buildChallengesGrid(controller),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildHeaderSection() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Take a Challenge',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [AppColors.primaryColor, AppColors.secondaryColor],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: CustomElevatedButton(
//               onPressed: () {
//                 /// todo
//               },
//               buttonText: 'Create Challenge',
//               textColor: AppColors.secondaryTextColor,
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               isFullWidth: false, // Set false so it doesn't take the full width
//               isRounded: true,
//               height: 48,
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               hasShadow: false,
//               padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20), // Added horizontal padding
//             ),
//           ),
//         ],
//       ),
//
//     );
//   }
//
//   Widget _buildCategoryChips(ChallengeScreenController controller) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.0),
//         child: Row(
//           children: List.generate(
//             controller.categories.length,
//                 (index) => Padding(
//               padding: EdgeInsets.only(right: 12.0),
//               child: GestureDetector(
//                 onTap: () => controller.updateSelectedIndex(index),
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   decoration: BoxDecoration(
//                     color: controller.selectedIndex == index
//                         ? Colors.orange
//                         : Colors.transparent,
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(
//                       color: controller.selectedIndex == index
//                           ? Colors.orange
//                           : Colors.grey[600]!,
//                       width: 1,
//                     ),
//                   ),
//                   child: Text(
//                     controller.categories[index],
//                     style: TextStyle(
//                       color: controller.selectedIndex == index
//                           ? Colors.white
//                           : Colors.grey[400],
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildChallengesGrid(ChallengeScreenController controller) {
//     return Expanded(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.0),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 12,
//             mainAxisSpacing: 12,
//             childAspectRatio: 0.75, // Adjust this to match the card proportions
//           ),
//           itemCount: controller.filteredChallenges.length,
//           itemBuilder: (context, index) {
//             final challenge = controller.filteredChallenges[index];
//             return _buildChallengeCard(challenge);
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildChallengeCard(ChallengeVideo challenge) {
//     return GestureDetector(
//       onTap: () {
//         Get.snackbar(
//           challenge.title,
//           'Challenge selected!',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.orange,
//           colorText: Colors.white,
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.grey[900],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Image with play button
//             Expanded(
//               flex: 3,
//               child: Container(
//                 width: double.infinity,
//                 child: Stack(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//                       child: Image.network(
//                         challenge.thumbnailUrl,
//                         width: double.infinity,
//                         height: double.infinity,
//                         fit: BoxFit.cover,
//                         errorBuilder: (_, __, ___) => Container(
//                           color: Colors.grey[800],
//                           child: Icon(
//                             Icons.error,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                       ),
//                     ),
//                     // Play button overlay
//                     Center(
//                       child: Container(
//                         width: 40,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           color: Colors.black.withOpacity(0.7),
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(
//                           Icons.play_arrow,
//                           color: Colors.white,
//                           size: 24,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // Challenge details
//             Expanded(
//               flex: 2,
//               child: Padding(
//                 padding: EdgeInsets.all(12),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       challenge.title,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       challenge.subtitle,
//                       style: TextStyle(
//                         color: Colors.grey[400],
//                         fontSize: 12,
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     Spacer(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           challenge.timeLeft,
//                           style: TextStyle(
//                             color: Colors.grey[500],
//                             fontSize: 10,
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.monetization_on,
//                               color: Colors.amber,
//                               size: 16,
//                             ),
//                             SizedBox(width: 2),
//                             Text(
//                               '${challenge.coins} coins',
//                               style: TextStyle(
//                                 color: Colors.amber,
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



/// todo:: updating


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../widget/buttons/Custom_Elevated_Button.dart';
import '../../controller/challenge_screen_controller.dart';
import '../challenge_explore/ChallengeExploreScreen.dart';

class ChallengeScreenUi extends StatelessWidget {
  final ChallengeScreenController controller = Get.put(ChallengeScreenController());

  ChallengeScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Challenges',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<ChallengeScreenController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              _buildHeaderSection(),
              SizedBox(height: 20),
              // Category Selection Chips
              _buildCategoryChips(controller),
              SizedBox(height: 20),
              // Challenges Grid
              _buildChallengesGrid(controller),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Take a Challenge',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryColor, AppColors.secondaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: CustomElevatedButton(
              onPressed: () {
                /// todo: handle the "Create Challenge" button click
              },
              buttonText: 'Create Challenge',
              textColor: AppColors.secondaryTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              isFullWidth: false, // Set false so it doesn't take the full width
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
    );
  }

  Widget _buildCategoryChips(ChallengeScreenController controller) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: List.generate(
            controller.categories.length,
                (index) => Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: GestureDetector(
                onTap: () => controller.updateSelectedIndex(index),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: controller.selectedIndex == index
                        ? Colors.orange
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: controller.selectedIndex == index
                          ? Colors.orange
                          : Colors.grey[600]!,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    controller.categories[index],
                    style: TextStyle(
                      color: controller.selectedIndex == index
                          ? Colors.white
                          : Colors.grey[400],
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChallengesGrid(ChallengeScreenController controller) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75, // Adjust this to match the card proportions
          ),
          itemCount: controller.filteredChallenges.length,
          itemBuilder: (context, index) {
            final challenge = controller.filteredChallenges[index];
            return _buildChallengeCard(challenge);
          },
        ),
      ),
    );
  }

  Widget _buildChallengeCard(ChallengeVideo challenge) {
    return GestureDetector(
      onTap: () {
        // Navigate to Challenge Explore Screen
        Get.to(
              () => ChallengeExploreScreen(challenge: challenge),
          transition: Transition.rightToLeft, // Optional: Transition effect
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[900],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with play button
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        challenge.thumbnailUrl,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.grey[800],
                          child: Icon(
                            Icons.error,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    // Play button overlay
                    Center(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Challenge details
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      challenge.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      challenge.subtitle,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          challenge.timeLeft,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 10,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.monetization_on,
                              color: Colors.amber,
                              size: 16,
                            ),
                            SizedBox(width: 2),
                            Text(
                              '${challenge.coins} coins',
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
