import 'package:beast_connect/utils/app_colors.dart';
import 'package:flutter/material.dart';


class JoinNextEventWidget extends StatelessWidget {
  final double screenWidth; // The screen width to calculate sizes

  const JoinNextEventWidget({
    super.key,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {


    // Static events list
    final joinNextEvents = [
      {
        'image':
        'https://images.unsplash.com/photo-1540206395-68808572332f?auto=format&fit=crop&w=400&q=80',
      },
      {
        'image':
        'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=400&q=80',
      },
      {
        'image':
        'https://images.unsplash.com/photo-1540206395-68808572332f?auto=format&fit=crop&w=400&q=80',
      },
    ];

    return SizedBox(
      height: screenWidth * 0.25,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle, // Change from BoxShape.circle to BoxShape.rectangle
          borderRadius: BorderRadius.circular(16), // Add borderRadius for rounded corner
        color: AppColors.tertiaryColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // This will adjust the row size to the content
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
            // Dynamically sized ListView.builder for other event images
            if (joinNextEvents.length > 1) // Only build ListView if there are other events
              Flexible(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: joinNextEvents.length - 1,
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
      ),
    );
  }
}

