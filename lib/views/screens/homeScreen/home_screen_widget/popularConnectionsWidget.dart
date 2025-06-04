// import 'package:flutter/material.dart';
//
// class PopularConnectionsWidget extends StatelessWidget {
//   final List<Map<String, dynamic>> popularConnections; // The popular connections data
//   final double screenWidth; // The screen width to calculate sizes
//
//   const PopularConnectionsWidget({
//     Key? key,
//     required this.popularConnections,
//     required this.screenWidth,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         buildSectionHeader('Popular Connections'),
//         const SizedBox(height: 8),
//         SizedBox(
//           height: screenWidth * 0.2,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: popularConnections.length,
//             itemBuilder: (context, index) {
//               var connection = popularConnections[index];
//               return Container(
//                 width: screenWidth * 0.6,
//                 margin: const EdgeInsets.only(right: 12),
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[900],
//                   borderRadius: BorderRadius.circular(32),
//                 ),
//                 clipBehavior: Clip.hardEdge,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(3),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Colors.orange, width: 2),
//                       ),
//                       child: CircleAvatar(
//                         radius: screenWidth * 0.08,
//                         backgroundImage: NetworkImage(connection['image']),
//                         backgroundColor: Colors.grey[700],
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             connection['name'],
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             'Age: ${connection['age']}',
//                             style: const TextStyle(
//                               color: Colors.orange,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildSectionHeader(String title) {
//     return Row(
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             color: Colors.orange,
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//         const Spacer(),
//         const Text(
//           'See all',
//           style: TextStyle(color: Colors.white70, fontSize: 12),
//         ),
//       ],
//     );
//   }
// }





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
