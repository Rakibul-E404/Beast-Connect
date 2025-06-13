
import 'package:flutter/material.dart';

class PopularConnectionsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> popularConnections; // The popular connections data
  final double screenWidth; // The screen width to calculate sizes

  const PopularConnectionsWidget({
    Key? key,
    required this.popularConnections,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenWidth * 0.5,
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
                Positioned(
                  bottom: 12,
                  left: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "${user['name'] as String}, ${user['age']}",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                          (user['active'] as bool) ? "Active" : "Offline",
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 12),
                        ),
                      ],
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
