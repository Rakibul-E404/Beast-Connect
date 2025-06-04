import 'package:flutter/material.dart';

class JoinCallWidget extends StatelessWidget {
  final List<Map<String, dynamic>> joinCalls; // Data source passed to the widget

  const JoinCallWidget({
    Key? key,
    required this.joinCalls, // Accepts the data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen width for dynamic sizing
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenWidth * 0.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: joinCalls.length, // Use the passed list
        itemBuilder: (context, index) {
          var call = joinCalls[index];
          return Container(
            width: screenWidth * 0.4,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Stack(
                    children: [
                      Image.network(
                        call['image'] as String,
                        height: screenWidth * 0.25,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.videocam, size: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        call['name'] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        call['event'] as String,
                        style: const TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${call['date'] as String} • ${call['duration'] as String}',
                        style: const TextStyle(color: Colors.white54, fontSize: 10),
                      ),
                    ],
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


