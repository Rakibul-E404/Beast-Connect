import 'package:beast_connect/utils/app_colors.dart';
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
      child: Container(
        color: AppColors.tertiaryColor,
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
      ),
    );
  }
}
