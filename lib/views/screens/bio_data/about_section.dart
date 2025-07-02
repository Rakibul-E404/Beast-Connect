import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class AboutSection extends StatelessWidget {

  final Map<String, dynamic> user;
  const AboutSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "About",
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Text(
                user['about'] ?? 'No bio available',
                style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
