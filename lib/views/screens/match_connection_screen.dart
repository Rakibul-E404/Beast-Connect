import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';

class MatchConnectionScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  const MatchConnectionScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      ///--------------- Apply the gradient to the entire screen background
      ///
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2a2a2a),
              Color(0xFF1a1a1a),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),

                ///--------------------- Profile images in rectangular format with tilts
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      /// Main content centered
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Cards section
                            SizedBox(
                              height: 220,
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Left card - more tilted and positioned further left
                                  Positioned(
                                    left: MediaQuery.of(context).size.width * 0.1,
                                    top: 20,
                                    child: Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, 0.001)
                                        ..rotateY(0.5)
                                        ..rotateZ(-0.25),
                                      child: Container(
                                        width: 150,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: Colors.orange, width: 4),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.5),
                                              blurRadius: 25,
                                              offset: Offset(-10, 15),
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(16),
                                          child: Image.network(
                                            user['image'],
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Container(
                                                color: Colors.grey[700],
                                                child: Icon(Icons.person, color: Colors.white, size: 50),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Right card - overlapping and tilted right
                                  Positioned(
                                    right: MediaQuery.of(context).size.width * 0.1,
                                    top: 20,
                                    child: Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, 0.001)
                                        ..rotateY(-0.5)
                                        ..rotateZ(0.2),
                                      child: Container(
                                        width: 150,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: Colors.blue, width: 4),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.5),
                                              blurRadius: 25,
                                              offset: Offset(10, 15),
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(16),
                                          child: Image.network(
                                            user['image'],
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Container(
                                                color: Colors.grey[700],
                                                child: Icon(Icons.person, color: Colors.white, size: 50),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 40),

                            // Title
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(text: 'What a ', style: TextStyle(color: Colors.white)),
                                  TextSpan(text: 'Match!', style: TextStyle(color: Colors.orange)),
                                ],
                              ),
                            ),

                            SizedBox(height: 20),

                            // Description
                            Text(
                              'You & Ariyan were match. Say hi and start\nsomething special together.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.7),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                ///-------------------------------- Action buttons
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.primaryColor, AppColors.secondaryColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // todo: handle start chatting
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20,0,20,0),
                            child: const Text(
                              'Start Chatting',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                            colors: [AppColors.primaryColor, AppColors.secondaryColor],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Color(0xFF1A1A1A),
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            ),
                            child: Text(
                              'Keep swiping',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





