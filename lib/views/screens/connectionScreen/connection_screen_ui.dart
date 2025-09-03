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
  final List<Map<String, dynamic>> _visibleConnections = [];
  final Map<int, bool> _removingCards = {};

  @override
  void initState() {
    super.initState();
    // Initialize with all connections visible
    _visibleConnections.addAll(Connections);
  }

  void _removeCardTemporarily(int index) {
    if (index >= _visibleConnections.length) return;

    setState(() {
      _removingCards[index] = true;
    });

    // Wait for animation to complete before removing the card
    Future.delayed(Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          var removedUser = _visibleConnections.removeAt(index);
          _removingCards.remove(index);

          // Restore the card after 3 seconds by reinserting it at the original position
          Future.delayed(Duration(seconds: 3), () {
            if (mounted) {
              setState(() {
                // Find the original position in the full Connections list
                int originalIndex = Connections.indexOf(removedUser);
                // Insert at the correct position in the visible list
                int insertIndex = 0;
                for (; insertIndex < _visibleConnections.length; insertIndex++) {
                  int currentOriginalIndex = Connections.indexOf(_visibleConnections[insertIndex]);
                  if (currentOriginalIndex > originalIndex) {
                    break;
                  }
                }
                _visibleConnections.insert(insertIndex, removedUser);
              });
            }
          });
        });
      }
    });
  }

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
          IconButton(
            onPressed: () {
              _controller.showFilterBottomSheet(context);
            },
            padding: EdgeInsets.all(0),
            icon: Icon(
              
              Icons.search,
              color: AppColors.primaryIconColor,
              size: 23,
            ),
          ),
          SizedBox(width: 0,),
          IconButton(
            onPressed: () {
              _controller.showFilterBottomSheet(context);
            },
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.filter_alt,
              color: AppColors.primaryIconColor,
              size: 23,
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
          itemCount: _visibleConnections.length,
          itemBuilder: (context, index) {
            var user = _visibleConnections[index];
            bool isRemoving = _removingCards[index] == true;

            return AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: isRemoving ? 0 : 1,
              child: AnimatedScale(
                duration: Duration(milliseconds: 300),
                scale: isRemoving ? 0.8 : 1,
                child: GestureDetector(
                  onTap: isRemoving ? null : () {
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
                                onTap: isRemoving ? null : () {
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
                              InkWell(
                                onTap: isRemoving ? null : () {
                                  _removeCardTemporarily(index);
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
                                      Icons.thumb_down_alt_outlined, // Dislike icon
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
                              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
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
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}