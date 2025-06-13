import 'package:flutter/material.dart';

class ChallengeScreenUi extends StatefulWidget {
  const ChallengeScreenUi({super.key});

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengeScreenUi> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Challenges',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Create Challenge',
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _challengeButton('Push up'),
                  _challengeButton('Pull Up'),
                  _challengeButton('Quiz'),
                  _challengeButton('Drawing'),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _challengeCard(
                    'Push up',
                    '4 hour 2 min left',
                    '20 Push-ups',
                    '20 coins',
                    'https://images.unsplash.com/photo-1603791447063-b706d4dba97e' // Example image URL
                ),
                _challengeCard(
                    'Push up',
                    '4 hour 2 min left',
                    '20 Push-ups',
                    '20 coins',
                    'https://images.unsplash.com/photo-1603791447063-b706d4dba97e' // Example image URL
                ),
                _challengeCard(
                    'Push up',
                    '4 hour 2 min left',
                    '20 Push-ups',
                    '20 coins',
                    'https://images.unsplash.com/photo-1603791447063-b706d4dba97e' // Example image URL
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _challengeButton(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.orange),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selectedIndex == 0 ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _challengeCard(String title, String timeLeft, String description, String coins, String imageUrl) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                        child: Icon(Icons.error, color: Colors.white));
                  },
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    timeLeft,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    coins,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
