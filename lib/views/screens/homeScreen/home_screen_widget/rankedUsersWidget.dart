import 'package:flutter/material.dart';

class RankedUsersWidget extends StatelessWidget {
  final List<dynamic> rankedUsers; // The ranked users data
  final double screenWidth; // The screen width to calculate sizes

  const RankedUsersWidget({
    Key? key,
    required this.rankedUsers,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionHeader('Ranked Users'),
        const SizedBox(height: 8),
        SizedBox(
          height: screenWidth * 0.2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: rankedUsers.length,
            itemBuilder: (context, index) {
              var user = rankedUsers[index];
              return Container(
                width: screenWidth * 0.6,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(32),
                ),
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.orange, width: 2),
                          ),
                          child: CircleAvatar(
                            radius: screenWidth * 0.08,
                            backgroundImage: (user['image'] != null &&
                                (user['image'] as String).isNotEmpty)
                                ? NetworkImage(user['image'] as String)
                                : const AssetImage('assets/images/default_user.png')
                            as ImageProvider,
                            backgroundColor: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user['name'] as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Brainy challenge: ${user['score']}',
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      left: -2,
                      child: Icon(
                        Icons.emoji_events,
                        color: Colors.orange,
                        size: screenWidth * 0.07,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildSectionHeader(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const Spacer(),
        const Text(
          'See all',
          style: TextStyle(color: Colors.white70, fontSize: 12),
        )
      ],
    );
  }
}
