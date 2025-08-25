import 'package:beast_connect/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import '../../../../controller/home_screen_controller.dart';
import '../../../public_user_leaderboard/public_user_leaderboard.dart';

class FitnessTagSection extends StatefulWidget {
  final double screenWidth;
  final HomeScreenController controller;
  final List<Map<String, dynamic>> content;

  const FitnessTagSection({
    super.key,
    required this.screenWidth,
    required this.controller,
    required this.content,
  });

  @override
  State<FitnessTagSection> createState() => _FitnessTagSectionState();
}

class _FitnessTagSectionState extends State<FitnessTagSection> {
  final Map<String, VideoPlayerController> _videoControllers = {};
  String? currentPlayingVideo;
  final Map<String, bool> _showControls = {};
  final Map<String, Timer?> _hideControlsTimer = {};

  @override
  void dispose() {
    for (var controller in _videoControllers.values) {
      controller.dispose();
    }
    for (var timer in _hideControlsTimer.values) {
      timer?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///
        /// :::::::::::::::::::::::::::::::: Header Section :::::::::::::::::::::::::::::
        ///
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.tertiaryColor,
          ),
          padding: EdgeInsets.all(16),
          child: InkWell(

            /// todo,, set the page screen.
            onTap: () {
              Get.to(() => PublicUserLeaderboard());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Check ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Rankings',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.leaderboard, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ),

        ///
        /// ::::::::::::::::::::::::::::: Vote the Champions Title ::::::::::::::::::::::::::
        ///

        Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: AppColors.quaternaryColor,
    ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Vote the Champions',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              ///
              ///:::::::::::::::::::::::::::::::: Main Featured Video ::::::::::::::::::::::::::::::::::::
              ///
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: _buildFeaturedVideoCard(),
              ),

              SizedBox(height: 20),

              ///
              ///:::::::::::::::::::::::::::  Participants Section :::::::::::::::::::::::
              ///
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Participant',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              ///
              /// ::::::::::::::::::::::::::: Participants Grid :::::::::::::::::::::::::::::::::::::
              ///
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: _buildParticipantsGrid(),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedVideoCard() {
    final featuredVideo = {
      'name': 'Ariyaan',
      'time': '6 hour ago',
      'title': 'Push up',
      'count': '20 push up',
      'videoUrl':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      'thumbnailUrl':
          'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=400&q=80',
      'avatar':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=100&q=80',
      'joinCount': 40,
    };

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2D2D2D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // User Info Header
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    featuredVideo['avatar'] as String,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        featuredVideo['name'] as String,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        featuredVideo['time'] as String,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_vert, color: Colors.white, size: 20),
              ],
            ),
          ),

          /// ============================= Video Player =================================
          SizedBox(
            height: 200,
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                final videoUrl = featuredVideo['videoUrl'] as String;

                // If video controller doesn't exist or isn't initialized, create and initialize it
                if (_videoControllers[videoUrl] == null ||
                    !_videoControllers[videoUrl]!.value.isInitialized) {
                  // Create controller if it doesn't exist
                  if (_videoControllers[videoUrl] == null) {
                    final controller = VideoPlayerController.networkUrl(
                      Uri.parse(videoUrl),
                    );
                    _videoControllers[videoUrl] = controller;
                    _showControls[videoUrl] = false;
                  }

                  // Initialize and play immediately when ready
                  _videoControllers[videoUrl]!
                      .initialize()
                      .then((_) {
                        if (mounted) {
                          // Stop any currently playing video
                          if (currentPlayingVideo != null &&
                              currentPlayingVideo != videoUrl) {
                            _videoControllers[currentPlayingVideo!]?.pause();
                            _showControls[currentPlayingVideo!] = false;
                          }

                          // Play this video
                          _videoControllers[videoUrl]!.play();
                          currentPlayingVideo = videoUrl;

                          setState(() {
                            _showControls[videoUrl] = false;
                          });

                          // Auto-hide controls after 3 seconds
                          _hideControlsTimer[videoUrl]?.cancel();
                          _hideControlsTimer[videoUrl] = Timer(
                            Duration(seconds: 3),
                            () {
                              if (_videoControllers[videoUrl]
                                          ?.value
                                          .isPlaying ==
                                      true &&
                                  mounted) {
                                setState(() {
                                  _showControls[videoUrl] = false;
                                });
                              }
                            },
                          );
                        }
                      })
                      .catchError((error) {
                        print("Video initialization error: $error");
                      });
                } else {
                  // Video is already initialized, handle play/pause or show controls
                  if (_videoControllers[videoUrl]!.value.isPlaying) {
                    // If playing, pause the video
                    _videoControllers[videoUrl]!.pause();
                    setState(() {
                      _showControls[videoUrl] =
                          true; // Show controls when paused
                    });
                  } else {
                    // If paused, play the video
                    _videoControllers[videoUrl]!.play();
                    setState(() {
                      _showControls[videoUrl] =
                          false; // Hide controls when playing
                    });
                  }
                }
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Video or Thumbnail
                  ClipRRect(

                    borderRadius: BorderRadius.circular(12),
                    child:
                        _videoControllers[featuredVideo['videoUrl']
                                    as String] !=
                                null &&
                            _videoControllers[featuredVideo['videoUrl']
                                    as String]!
                                .value
                                .isInitialized
                        ? AspectRatio(
                            aspectRatio:
                                _videoControllers[featuredVideo['videoUrl']
                                        as String]!
                                    .value
                                    .aspectRatio,
                            child: VideoPlayer(
                              _videoControllers[featuredVideo['videoUrl']
                                  as String]!,
                            ),
                          )
                        : Image.network(
                            featuredVideo['thumbnailUrl'] as String,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                  ),

                  // Play/Pause Button Overlay - Show when not initialized, controls are visible, or video is paused
                  if ((_videoControllers[featuredVideo['videoUrl'] as String] ==
                              null ||
                          !_videoControllers[featuredVideo['videoUrl']
                                  as String]!
                              .value
                              .isInitialized) ||
                      _showControls[featuredVideo['videoUrl'] as String] ==
                          true ||
                      (_videoControllers[featuredVideo['videoUrl'] as String]
                              ?.value
                              .isPlaying ==
                          false))
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black.withOpacity(0.3),
                      ),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _videoControllers[featuredVideo['videoUrl']
                                            as String] !=
                                        null &&
                                    _videoControllers[featuredVideo['videoUrl']
                                            as String]!
                                        .value
                                        .isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),

                  // Invisible tap area for when video is playing (to show controls)
                  if (_videoControllers[featuredVideo['videoUrl'] as String] !=
                          null &&
                      _videoControllers[featuredVideo['videoUrl'] as String]!
                          .value
                          .isInitialized &&
                      _videoControllers[featuredVideo['videoUrl'] as String]!
                          .value
                          .isPlaying &&
                      _showControls[featuredVideo['videoUrl'] as String] !=
                          true)
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.transparent,
                    ),

                  // Progress Bar
                  if (_videoControllers[featuredVideo['videoUrl'] as String] !=
                          null &&
                      _videoControllers[featuredVideo['videoUrl'] as String]!
                          .value
                          .isInitialized &&
                      (_showControls[featuredVideo['videoUrl'] as String] ==
                              true ||
                          _videoControllers[featuredVideo['videoUrl'] as String]
                                  ?.value
                                  .isPlaying ==
                              false))
                    Positioned(
                      bottom: 8,
                      left: 16,
                      right: 16,
                      child: VideoProgressIndicator(
                        _videoControllers[featuredVideo['videoUrl'] as String]!,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          playedColor: Colors.orange,
                          bufferedColor: Colors.orange.withOpacity(0.3),
                          backgroundColor: Colors.white.withOpacity(0.3),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          ///
          /// :::::::::::::::::::::::::::::  Video Info ::::::::::::::::::::::::::::::
          ///
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      featuredVideo['title'] as String,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      featuredVideo['count'] as String,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.coins,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      SizedBox(width: 6),
                      Text(
                        '${featuredVideo['joinCount']} coins',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParticipantsGrid() {
    final participants = [
      {
        'name': 'Jack',
        'title': 'Push up',
        'points': '10 point',
        'videoUrl':
            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
        'thumbnailUrl':
            'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=300&q=80',
        'avatar':
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=100&q=80',
      },
      {
        'name': 'Jack',
        'title': 'Push up',
        'points': '10 point',
        'videoUrl':
            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
        'thumbnailUrl':
            'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=300&q=80',
        'avatar':
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=100&q=80',
      },
      {
        'name': 'Jack',
        'title': 'Push up',
        'points': '10 point',
        'videoUrl':
            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
        'thumbnailUrl':
            'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=300&q=80',
        'avatar':
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=100&q=80',
      },
      {
        'name': 'Jack',
        'title': 'Push up',
        'points': '10 point',
        'videoUrl':
            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
        'thumbnailUrl':
            'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=300&q=80',
        'avatar':
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=100&q=80',
      },
      {
        'name': 'Jack',
        'title': 'Push up',
        'points': '10 point',
        'videoUrl':
            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
        'thumbnailUrl':
            'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=300&q=80',
        'avatar':
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=100&q=80',
      },
      {
        'name': 'Jack',
        'title': 'Push up',
        'points': '10 point',
        'videoUrl':
            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
        'thumbnailUrl':
            'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=300&q=80',
        'avatar':
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=100&q=80',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: participants.length,
      itemBuilder: (context, index) {
        final participant = participants[index];
        return _buildParticipantCard(participant);
      },
    );
  }

  Widget _buildParticipantCard(Map<String, String> participant) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2D2D2D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Avatar and Name
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(
                    participant['avatar'] as String,
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    participant['name'] as String,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          ///:::::::::::::::::::::::::::::::::::: Video Thumbnail ::::::::::::::::::::::::::::::::::::::::::
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  participant['thumbnailUrl'] as String,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          ///
          /// :::::::::::::::::::::::::::::: Video Title and Points :::::::::::::::::::::::::::::::::
          ///
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  participant['title'] as String,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Center(
                      child: Icon(
                        Icons.thumb_up_outlined,
                        size: 12,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(width: 4),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
