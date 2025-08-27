import 'package:flutter/material.dart';

class ProfileController {
  final BuildContext context;
  // Store the image path
  final String imagePath;

  // Constructor to accept context and image path
  ProfileController(this.context, {required this.imagePath});

  // Navigation method
  void navigateToScreen(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  // Logout method
  void showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Implement logout logic here
                Navigator.pop(context);
              },
              child: Text("Log out"),
            ),
          ],
        );
      },
    );
  }
}
