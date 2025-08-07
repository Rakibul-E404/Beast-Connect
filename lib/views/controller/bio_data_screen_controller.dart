// import 'package:flutter/material.dart';
// import '../../../utils/app_colors.dart';
//
// class BioDataScreenController {
//   // Profile Detail Row Builder
//   Widget buildProfileDetailRow(String label, String? value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Container(
//         padding: const EdgeInsets.all(8.0), // Padding inside the container
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start, // Align left by default
//           children: [
//             Expanded(
//               child: Text(
//                 '$label: ',
//                 style: const TextStyle(color: Colors.white70, fontSize: 14),
//               ),
//             ),
//             Expanded(
//               child: Text(
//                 value ?? 'Not available',
//                 style: const TextStyle(color: Colors.white, fontSize: 14),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Interest Chip Builder
//   Widget buildInterestChip(IconData icon, String interest) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 8.0),
//       child: Chip(
//         avatar: Icon(
//           icon,
//           color: Colors.white,
//           size: 18,
//         ),
//         label: Text(
//           interest,
//           style: const TextStyle(color: Colors.white),
//         ),
//         backgroundColor: AppColors.primaryColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0), // Set your desired border radius here
//         ),
//       ),
//     );
//   }
//
//   // Videos Section Builder
//   Widget buildVideosSection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: SizedBox(
//         height: 120,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: 3, // Replace with the actual number of videos
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.only(right: 8.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.network(
//                   'https://via.placeholder.com/150', // Replace with actual video thumbnail
//                   width: 120,
//                   height: 120,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

/// Todo: trying to play videos

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../utils/app_colors.dart';

class BioDataScreenController {
  // Profile Detail Row Builder
  Widget buildProfileDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.all(8.0), // Padding inside the container
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Align left by default
          children: [
            Expanded(
              child: Text(
                '$label: ',
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
            Expanded(
              child: Text(
                value ?? 'Not available',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Interest Chip Builder
  Widget buildInterestChip(IconData icon, String interest) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        avatar: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
        label: Text(
          interest,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Set your desired border radius here
        ),
      ),
    );
  }

  // Videos Section Builder with video player
  Widget buildVideosSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3, // Replace with the actual number of videos
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: VideoPlayerWidget(url: 'https://www.w3schools.com/html/mov_bbb.mp4'), // Replace with actual video URL
              ),
            );
          },
        ),
      ),
    );
  }
}


class VideoPlayerWidget extends StatefulWidget {
  final String url;
  const VideoPlayerWidget({super.key, required this.url});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {
          _isLoading = false;  // Set loading state to false after initialization
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    // Show loading indicator while the video is being initialized
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    // If video is ready, display it
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}