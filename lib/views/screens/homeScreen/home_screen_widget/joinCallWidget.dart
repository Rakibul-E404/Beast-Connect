
import 'package:flutter/material.dart';

class JoinCallWidget extends StatelessWidget {
  const JoinCallWidget({
    super.key,
    // required this.joinCalls, // Accepts the data
  });

  @override
  Widget build(BuildContext context) {
    // Define the static joinCalls list here
    final joinCalls = [
      {
        'image':
        'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80',
        'name': 'Luci',
        'eventTitle': 'Let’s Skip the Small Talk',
        'location': 'London',
        'date': '6 May, 2025',
        'duration': '3m',
        'time': '10:20am',
      },
      {
        'image':
        'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=400&q=80',
        'name': 'Jainab',
        'eventTitle': 'Let’s Skip the Small Talk',
        'location': 'London',
        'date': '6 May, 2025',
        'duration': '3m',
        'time': '10:20am',
      },
      {
        'image':
        'https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg',
        'name': 'Ratul  ',
        'eventTitle': 'Let’s Skip the Small Talk',
        'location': 'London',
        'date': '6 May, 2025',
        'duration': '3m',
        'time': '10:20am',
      },
    ];

    // Get screen width for dynamic sizing
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenWidth * 0.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: joinCalls.length, // Use the static list here
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
                            color: Colors.white38,
                            shape: BoxShape.circle,
                          ),
                          // child: const Icon(Icons.videocam, size: 18, color: Colors.white),
                          child: const Icon(Icons.videocam_outlined, size: 18, color: Colors.orange),
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
                        call['eventTitle'] as String,
                        style: const TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${call['location'] as String}',
                            style: const TextStyle(color: Colors.white54, fontSize: 10),
                          ),
                          Text(
                            '${call['date'] as String}',
                            style: const TextStyle(color: Colors.white54, fontSize: 10),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${call['time'] as String}',
                            style: const TextStyle(color: Colors.white54, fontSize: 10),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white60
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(2,0,2,0),
                              child: Row(
                                children: [
                                  Icon(Icons.pause_circle_rounded,color: Colors.red,),
                                  SizedBox(width: 8,),
                                  Text(
                                    '${call['duration'] as String}',
                                    style: const TextStyle(color: Colors.white54, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
