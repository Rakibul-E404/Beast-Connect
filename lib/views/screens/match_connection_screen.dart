import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/app_colors.dart';

class MatchConnectionScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  const MatchConnectionScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1a1c20), Color(0xFF2c1a44)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title text
              const Text(
                'What a Match!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Subtitle text
              Text(
                'You & ${user['name']} wear match. Say in and start',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'something special together.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Profile images in rectangular format with tilts
              SizedBox(
                height: 200,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // First image tilted to Y, -X axis (left image)
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.2,
                      bottom: 0,
                      child: Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()
                          ..setEntry(1, 2, 0.00) // Perspective
                          ..rotateY(-0.6) // Tilt on Y axis
                          ..rotateX(-0.3), // Tilt on -X axis
                        child: Container(
                          width: 120,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.pink,
                              width: 3.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'https://example.com/your-image.jpg', // Replace with actual image URL
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey,
                                  child: const Icon(Icons.person, color: Colors.white, size: 50),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Second image tilted to Y, X axis (right image)
                    Positioned(
                      right: MediaQuery.of(context).size.width * 0.2,
                      bottom: 0,
                      child: Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()
                          ..setEntry(1, 2, 0.00) // Perspective
                          ..rotateY(-0.3) // Tilt on Y axis
                          ..rotateX(0.3), // Tilt on X axis
                        child: Container(
                          width: 120,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.pink,
                              width: 3.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              user['image'],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey,
                                  child: const Icon(Icons.person, color: Colors.white, size: 50),
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
              const SizedBox(height: 40),

              // Action buttons
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround, // Center the buttons in the row
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
                        margin: EdgeInsets.all(2), // This creates the border effect
                        decoration: BoxDecoration(
                          color: Color(0xFF1A1A1A), // Dark background color
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
                    )




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
