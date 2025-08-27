import 'package:flutter/material.dart';

class MatchConnectionScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  const MatchConnectionScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Profile'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the profile image
            ClipOval(
              child: Image.network(
                user['image'], // Main profile image
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            // Display the card image (This is the image from the liked card)
            ClipOval(
              child: Image.network(
                user['image'], // Card image (same as profile image for now)
                height: 100, // You can adjust this size to match your design
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            // User's name and other details
            Text(
              '${user['name']} - ${user['age']}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '${user['gender']} - ${user['location']}',
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            SizedBox(height: 8),
            Text(
              'About: ${user['about']}',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement your action here (e.g., Connect button logic)
              },
              child: Text('Connect'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
