import 'package:flutter/material.dart';

import '../../controller/bio_data_screen_controller.dart';


class InterestsSection extends StatelessWidget {

  final Map<String, dynamic>user;
  InterestsSection({super.key, required this.user});
  final BioDataScreenController _controller = BioDataScreenController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Interests',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
    const SizedBox(height: 10),
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    _controller.buildInterestChip(Icons.book, 'Reading'),
    _controller.buildInterestChip(Icons.music_note, 'Music'),
    _controller.buildInterestChip(Icons.sports_baseball, 'Sports'),
    ],
    )
      ],
    );
  }
}
