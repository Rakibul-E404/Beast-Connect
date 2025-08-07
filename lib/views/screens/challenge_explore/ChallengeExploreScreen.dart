// import 'package:flutter/material.dart';
// import '../../controller/challenge_screen_controller.dart';
//
// class ChallengeExploreScreen extends StatelessWidget {
//   final ChallengeVideo challenge;
//
//   const ChallengeExploreScreen({super.key, required this.challenge});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text(
//           challenge.title,
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display challenge image
//             Image.network(
//               challenge.thumbnailUrl,
//               width: double.infinity,
//               height: 200,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(height: 20),
//             // Challenge details
//             Text(
//               challenge.title,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               challenge.subtitle,
//               style: TextStyle(
//                 color: Colors.grey[400],
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: 20),
//             // Button to accept challenge
//             ElevatedButton(
//               onPressed: () {
//                 // Implement action for accepting the challenge
//               },
//               child: Text("Accept Challenge"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.orange,
//                 padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
//                 textStyle: TextStyle(fontSize: 16),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/widget/buttons/Custom_Elevated_Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/challenge_screen_controller.dart';

class ChallengeExploreScreen extends StatelessWidget {
  final ChallengeVideo challenge;

  const ChallengeExploreScreen({super.key, required this.challenge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          'Challenges',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,
          color: AppColors.primaryIconColor,)),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display challenge video placeholder
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(challenge.thumbnailUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Challenge title and coin
            Row(
              children: [
                Text(
                  challenge.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.monetization_on, color: Colors.yellow, size: 20),
                const Text(
                  '20 coin',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              challenge.subtitle,
              style:  TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 10),
            Text(
              "Just smashed out 25 push-ups to push my limits and clear my mind — now it’s your turn! If you're seeing this, I challenge you to do the same. Tag me when you're done. Let’s go! 💪",
              style:  TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 20),
            // Accept button with gradient background
            Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.secondaryColor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child:
                CustomElevatedButton(
                  width: double.infinity,
                  onPressed: () {
                    /// todo: handle the "Create Challenge" button click
                  },
                  buttonText: 'Accept',
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
            ),
            const SizedBox(height: 10),
            const Text(
              '*Finish the 25 push-up challenge, upload your video, and let people vote—earn coins for every vote and get a chance to win big!*',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}