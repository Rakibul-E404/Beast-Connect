// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoSection extends StatefulWidget {
//   const VideoSection({super.key});
//
//   @override
//   _VideoSectionState createState() => _VideoSectionState();
// }
//
// class _VideoSectionState extends State<VideoSection> {
//   late VideoPlayerController _videoController;
//   bool _isVideoLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeVideoPlayer();
//   }
//
//   void _initializeVideoPlayer() {
//     _videoController = VideoPlayerController.network(
//       'https://www.w3schools.com/html/mov_bbb.mp4',
//     )..initialize().then((_) {
//       setState(() {
//         _isVideoLoading = false;
//       });
//       _videoController.play();
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _videoController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Text(
//               'Videos',
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//         _isVideoLoading
//             ? const Center(child: CircularProgressIndicator())
//             : AspectRatio(
//           aspectRatio: _videoController.value.aspectRatio,
//           child: VideoPlayer(_videoController),
//         ),
//       ],
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoSection extends StatefulWidget {
  const VideoSection({super.key});

  @override
  _VideoSectionState createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  late VideoPlayerController _videoController1;
  late VideoPlayerController _videoController2;
  late VideoPlayerController _videoController3;
  late VideoPlayerController _videoController4;
  bool _isVideoLoading1 = true;
  bool _isVideoLoading2 = true;
  bool _isVideoLoading3 = true;
  bool _isVideoLoading4 = true;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayers();
  }

  void _initializeVideoPlayers() {
    _videoController1 = VideoPlayerController.network(
      'https://www.w3schools.com/html/mov_bbb.mp4',
    )..initialize().then((_) {
      setState(() {
        _isVideoLoading1 = false;
      });
      _videoController1.play();
    });

    _videoController2 = VideoPlayerController.network(
      'https://www.w3schools.com/html/mov_bbb.mp4',
    )..initialize().then((_) {
      setState(() {
        _isVideoLoading2 = false;
      });
      _videoController2.play();
    });

    _videoController3 = VideoPlayerController.network(
      'https://www.w3schools.com/html/mov_bbb.mp4',
    )..initialize().then((_) {
      setState(() {
        _isVideoLoading3 = false;
      });
      _videoController3.play();
    });

    _videoController4 = VideoPlayerController.network(
      'https://www.w3schools.com/html/mov_bbb.mp4',
    )..initialize().then((_) {
      setState(() {
        _isVideoLoading4 = false;
      });
      _videoController4.play();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController1.dispose();
    _videoController2.dispose();
    _videoController3.dispose();
    _videoController4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Videos',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Row 1: Two videos in a row
        Row(
          children: [
            _isVideoLoading1
                ? const Center(child: CircularProgressIndicator())
                : _videoWidget(_videoController1),
            _isVideoLoading2
                ? const Center(child: CircularProgressIndicator())
                : _videoWidget(_videoController2),
          ],
        ),
        // Row 2: Two videos in a row
        Row(
          children: [
            _isVideoLoading3
                ? const Center(child: CircularProgressIndicator())
                : _videoWidget(_videoController3),
            _isVideoLoading4
                ? const Center(child: CircularProgressIndicator())
                : _videoWidget(_videoController4),
          ],
        ),
      ],
    );
  }

  Widget _videoWidget(VideoPlayerController controller) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2.6, // Ensures two videos fit in a row
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
        ),
      ),
    );
  }
}
