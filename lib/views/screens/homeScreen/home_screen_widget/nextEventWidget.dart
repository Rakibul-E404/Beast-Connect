// import 'package:flutter/material.dart';
//
// class JoinNextEventWidget extends StatelessWidget {
//   final List<Map<String, String>> joinNextEvents; // The next events data
//   final double screenWidth; // The screen width to calculate sizes
//
//   const JoinNextEventWidget({
//     Key? key,
//     required this.joinNextEvents,
//     required this.screenWidth,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         buildSectionHeader('Join Your Next Event'),
//         const SizedBox(height: 8),
//         SizedBox(
//           height: screenWidth * 0.3,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: nextEvents.length,
//             itemBuilder: (context, index) {
//               var event = nextEvents[index];
//               return Container(
//                 width: screenWidth * 0.7,
//                 margin: const EdgeInsets.only(right: 12),
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[900],
//                   borderRadius: BorderRadius.circular(32),
//                 ),
//                 clipBehavior: Clip.hardEdge,
//                 child: Stack(
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Image.network(
//                           event['image']!,
//                           width: screenWidth * 0.3,
//                           height: screenWidth * 0.2,
//                           fit: BoxFit.cover,
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: Text(
//                             event['title']!,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                         ),
//                       ],
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

class JoinNextEventWidget extends StatelessWidget {
  final List<Map<String, String>> joinNextEvents; // The next events data
  final double screenWidth; // The screen width to calculate sizes

  const JoinNextEventWidget({
    super.key,
    required this.joinNextEvents,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenWidth * 0.25,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // First event's image
          if (joinNextEvents.isNotEmpty)
            Container(
              width: screenWidth * 0.45,
              height: screenWidth * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(joinNextEvents[0]['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          SizedBox(
            height: screenWidth * 0.1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: joinNextEvents.length > 1 ? joinNextEvents.length - 1 : 0, // Handle case when no other events exist
              itemBuilder: (context, index) {
                var imgIndex = index + 1;
                return Container(
                  width: screenWidth * 0.1,
                  height: screenWidth * 0.1,
                  margin: EdgeInsets.only(
                      right: imgIndex == joinNextEvents.length - 1 ? 0 : 1),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 1.5),
                    image: DecorationImage(
                      image: NetworkImage(joinNextEvents[imgIndex]['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          // Add button
          Container(
            width: screenWidth * 0.1,
            height: screenWidth * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.orange, width: 2),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.orange,
                size: screenWidth * 0.05,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
