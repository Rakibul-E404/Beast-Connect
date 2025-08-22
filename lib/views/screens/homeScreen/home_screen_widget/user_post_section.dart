import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:beast_connect/utils/app_colors.dart'; // Assuming your AppColors are defined here

class UserPostSection extends StatelessWidget {
  // Default values for user post data
  final String userName = "Habib Wahid";
  final String userImage = 'https://thumbs.dreamstime.com/b/portrait-cheerful-smiling-young-man-folded-arms-joyful-handsome-men-crossed-hands-studio-shot-isolated-gray-195089624.jpg';
  final String userMessage = "I'm so happy using the BeastConnect app! 🎉 I’ve discovered amazing games, exciting events, and so many advanced features that make every moment fun and meaningful. Loving the experience!";
  final String timeAgo = '1Hour';

  const UserPostSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.quaternaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User profile image
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(userImage),
                        backgroundColor: Colors.grey[700],
                      ),
                    ),
                    SizedBox(width: 10),
                    // User name and time
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          timeAgo,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    // Cancel button
                    Material(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        splashColor: Colors.grey.withOpacity(0.4),
                        highlightColor: Colors.grey.withOpacity(0.4),
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Icon(
                            Icons.cancel_outlined,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // User message
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        userMessage,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Divider line
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.withOpacity(0.5),
                  padding: EdgeInsets.symmetric(vertical: 1),
                ),
                const SizedBox(height: 8),
                // Like and comment icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.thumb_up_outlined,
                      color: AppColors.primaryColor,
                      size: 25,
                    ),
                    Icon(
                      CupertinoIcons.chat_bubble,
                      color: AppColors.primaryColor,
                      size: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
