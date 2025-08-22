//
// import 'package:flutter/material.dart';
//
// class JoinCallWidget extends StatelessWidget {
//   const JoinCallWidget({
//     super.key,
//     // required this.joinCalls, // Accepts the data
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     // Define the static joinCalls list here
//     final joinCalls = [
//       {
//         'image':
//         'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80',
//         'name': 'Lusi Pirani',
//         'eventTitle': 'Let’s Skip the Small Talk',
//         'location': 'London',
//         'date': '6 May, 2025',
//         'duration': '3m',
//         'time': '10:20am',
//       },
//       {
//         'image':
//         'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=400&q=80',
//         'name': 'Jainab Ahmed',
//         'eventTitle': 'Let’s Skip the Small Talk',
//         'location': 'London',
//         'date': '6 May, 2025',
//         'duration': '3m',
//         'time': '10:20am',
//       },
//       {
//         'image':
//         'https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg',
//         'name': 'Ratul Hasan',
//         'eventTitle': 'Let’s Skip the Small Talk',
//         'location': 'London',
//         'date': '6 May, 2025',
//         'duration': '3m',
//         'time': '10:20am',
//       },
//     ];
//
//     // Get screen width for dynamic sizing
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return SizedBox(
//       height: screenWidth * 0.5,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: joinCalls.length, // Use the static list here
//         itemBuilder: (context, index) {
//           var call = joinCalls[index];
//           return Container(
//             width: screenWidth * 0.4,
//             margin: const EdgeInsets.only(right: 12),
//             decoration: BoxDecoration(
//               color: Colors.grey[900],
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Column(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//                   child: Stack(
//                     children: [
//                       Image.network(
//                         call['image'] as String,
//                         height: screenWidth * 0.25,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                       Positioned(
//                         top: 8,
//                         right: 8,
//                         child: Container(
//                           padding: const EdgeInsets.all(6),
//                           decoration: const BoxDecoration(
//                             color: Colors.white38,
//                             shape: BoxShape.circle,
//                           ),
//                           // child: const Icon(Icons.videocam, size: 18, color: Colors.white),
//                           child: const Icon(Icons.videocam_outlined, size: 18, color: Colors.orange),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         call['name'] as String,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         call['eventTitle'] as String,
//                         style: const TextStyle(color: Colors.white70, fontSize: 12),
//                       ),
//                       const SizedBox(height: 4),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             call['location'] as String,
//                             style: const TextStyle(color: Colors.white54, fontSize: 10),
//                           ),
//                           Text(
//                             call['date'] as String,
//                             style: const TextStyle(color: Colors.white54, fontSize: 10),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             call['time'] as String,
//                             style: const TextStyle(color: Colors.white54, fontSize: 10),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: Colors.white60
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.fromLTRB(2,0,2,0),
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.pause_circle_rounded,color: Colors.red,),
//                                   SizedBox(width: 8,),
//                                   Text(
//                                     call['duration'] as String,
//                                     style: const TextStyle(color: Colors.white54, fontSize: 10),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


///
/// todo:::::::::::::::::::::::::: [making it responsive] :::::::::::::::::::::::::::
///


import 'package:flutter/material.dart';

class JoinCallWidget extends StatelessWidget {
  const JoinCallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width to check for overflow
    double screenWidth = MediaQuery.of(context).size.width;

    // Define the static joinCalls list here
    final joinCalls = [
      {
        'image':
        'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80',
        'name': 'Lusi Pirani',
        'eventTitle': "Let's Skip the Small Talk",
      'location': 'London',
        'date': '6 May, 2025',
        'duration': '3m',
        'time': '10:20am',
      },
      {
        'image':
        'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=400&q=80',
        'name': 'Jainab Ahmed',
        'eventTitle': "Let's Skip the Small Talk",
      'location': 'London',
        'date': '6 May, 2025',
        'duration': '3m',
        'time': '10:20am',
      },
      {
        'image':
        'https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg',
        'name': 'Ratul Hasan',
        'eventTitle': "Let's Skip the Small Talk",
      'location': 'London',
        'date': '6 May, 2025',
        'duration': '3m',
        'time': '10:20am',
      },
    ];

    return SizedBox(
      height: screenWidth * 0.51,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: joinCalls.length,
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
                          child: const Icon(Icons.videocam_outlined, size: 18, color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          call['name'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          call['eventTitle'] as String,
                          style: const TextStyle(color: Colors.white70, fontSize: 10),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),

                        // Always use Column for better space management on small screens
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    call['location'] as String,
                                    style: const TextStyle(color: Colors.white54, fontSize: 10),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    call['date'] as String,
                                    style: const TextStyle(color: Colors.white54, fontSize: 10),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),

                              // Bottom row with time and duration
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      call['time'] as String,
                                      style: const TextStyle(color: Colors.white54, fontSize: 10),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white60,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.pause_circle_rounded,
                                          color: Colors.red,
                                          size: 12,
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          call['duration'] as String,
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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

