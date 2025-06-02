import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:beast_connect/views/screens/profileSetUp/profileSetUpPhotoUpload/profileSetUpPhotoUpload_ui.dart';

class UserInterestsController extends GetxController {
  // Reactive Map for interest selections
  final RxMap<String, bool> selectedInterests = <String, bool>{
    'Gym': false,
    'Yoga': false,
    'Drawing': false,
    'Fashion': false,
    'Photography': false,
    'Craft': false,
    'Daily Trivia': false,
    'Puzzle Solving': false,
    'Team Workout': false,
    'Cooking': false,
  }.obs;

  final Map<String, IconData> interestIcons = {
    'Gym': Icons.fitness_center,
    'Yoga': Icons.self_improvement,
    'Drawing': Icons.brush,
    'Fashion': Icons.checkroom,
    'Photography': Icons.camera_alt,
    'Craft': Icons.format_paint,
    'Daily Trivia': Icons.lightbulb_outline,
    'Puzzle Solving': Icons.extension,
    'Team Workout': Icons.sports,
    'Cooking': Icons.restaurant,
  };

  void toggleInterest(String label) {
    if (selectedInterests.containsKey(label)) {
      selectedInterests[label] = !selectedInterests[label]!;
    }
  }

  void submitInterests(BuildContext context) {
    final selected = selectedInterests.entries
        .where((e) => e.value)
        .map((e) => e.key)
        .toList();

    if (selected.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one interest')),
      );
      return;
    }

    try {
      Get.to(() => ProfileSetUpPhotoUploadScreenUi());
    } catch (e) {
      debugPrint('Navigation error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Navigation failed. Please try again.')),
      );
    }
  }
}
