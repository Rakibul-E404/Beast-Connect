import 'dart:ui';
import 'package:flutter/material.dart';

class PopularConnectionsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> popularConnections; // The popular connections data
  final double screenWidth; // The screen width to calculate sizes

  const PopularConnectionsWidget({
    super.key,
    required this.popularConnections,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenWidth * 0.6,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularConnections.length, // Using the passed data
        itemBuilder: (context, index) {
          var user = popularConnections[index]; // Accessing the data passed
          return Container(
            width: screenWidth * 0.4,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(user['image'] as String),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                // Setting the Stack to take the full width of the image
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                  child: SizedBox(
            width: double.infinity,
              height: 90,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12), // ensure blur respects borders
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8), // blur strength
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "${user['name'] as String}, ${user['age']}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.circle,
                              color: (user['active'] as bool)
                                  ? Colors.greenAccent
                                  : Colors.grey,
                              size: 12,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              "${user['gender'] ?? 'Unknown'}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Text(
                              "${user['location'] ?? 'Unknown'}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),



                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
