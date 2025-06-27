import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallengeScreenUi extends StatefulWidget {
  const ChallengeScreenUi({super.key});

  @override
  State<ChallengeScreenUi> createState() => _ChallengeScreenUiState();
}

class _ChallengeScreenUiState extends State<ChallengeScreenUi> {
  int selectedIndex = 0;

  final List<String> categories = [
    'Push up',
    'Pull Up',
    'Quiz',
    'Drawing',
    'Cooking'
  ];

  final List<ChallengeVideo> challenges = [
    ChallengeVideo(
      title: 'Push up',
      timeLeft: '4 hours 2 min left',
      coins: 20,
      thumbnailUrl: 'https://www.orthovirginia.com/wp-content/uploads/2022/03/home-bodyweight-workout-featured_637402090673043414.jpg',
      category: 'Push up',
    ),
    ChallengeVideo(
      title: 'Push up',
      timeLeft: '3 hours 45 min left',
      coins: 25,
      thumbnailUrl: 'https://www.orthovirginia.com/wp-content/uploads/2022/03/home-bodyweight-workout-featured_637402090673043414.jpg',
      category: 'Push up',
    ),
    ChallengeVideo(
      title: 'Push up',
      timeLeft: '2 hours 30 min left',
      coins: 30,
      thumbnailUrl: 'https://www.orthovirginia.com/wp-content/uploads/2022/03/home-bodyweight-workout-featured_637402090673043414.jpg',
      category: 'Push up',
    ),
    ChallengeVideo(
      title: 'Push up',
      timeLeft: '1 hour 15 min left',
      coins: 35,
      thumbnailUrl: 'https://www.orthovirginia.com/wp-content/uploads/2022/03/home-bodyweight-workout-featured_637402090673043414.jpg',
      category: 'Push up',
    ),
    ChallengeVideo(
      title: 'Pull Up',
      timeLeft: '5 hours 20 min left',
      coins: 40,
      thumbnailUrl: 'https://www.orthovirginia.com/wp-content/uploads/2022/03/home-bodyweight-workout-featured_637402090673043414.jpg',
      category: 'Pull Up',
    ),
    ChallengeVideo(
      title: 'Pull Up',
      timeLeft: '6 hours 0 min left',
      coins: 45,
      thumbnailUrl: 'https://www.orthovirginia.com/wp-content/uploads/2022/03/home-bodyweight-workout-featured_637402090673043414.jpg',
      category: 'Pull Up',
    ),
  ];

  List<ChallengeVideo> get filteredChallenges {
    return challenges.where((challenge) =>
    challenge.category == categories[selectedIndex]
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        // leading: IconButton(
        //   onPressed: () => Get.back(),
        //   icon: const Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.white,
        //     size: 20,
        //   ),
        // ),
        title: const Text(
          'Challenges',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Take a Challenge',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF6B35), Color(0xFFFF8E53)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement join challenge
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Join Challenge',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Category Filter
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () => setState(() => selectedIndex = index),
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFFF6B35) : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected ? const Color(0xFFFF6B35) : Colors.grey[600]!,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey[400],
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // Challenges Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: filteredChallenges.length,
              itemBuilder: (context, index) {
                final challenge = filteredChallenges[index];
                return _buildChallengeCard(challenge);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChallengeCard(ChallengeVideo challenge) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Video Thumbnail
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.network(
                      challenge.thumbnailUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: Colors.grey[800],
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                              color: const Color(0xFFFF6B35),
                              strokeWidth: 2,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[800],
                          child: const Center(
                            child: Icon(
                              Icons.fitness_center,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Play Button Overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: const Center(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Challenge Details
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                  // Title and subtitle
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            challenge.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '20 Push', // You can make this dynamic based on challenge type
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),

                      // Time and coins row
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start, // Adjust alignment as needed
                        children: [
                          Text(
                            challenge.timeLeft.replaceAll(' left', ''),
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8), // Add spacing between time and coins
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                '🪙',
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${challenge.coins} coins',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

class ChallengeVideo {
  final String title;
  final String timeLeft;
  final int coins;
  final String thumbnailUrl;
  final String category;

  ChallengeVideo({
    required this.title,
    required this.timeLeft,
    required this.coins,
    required this.thumbnailUrl,
    required this.category,
  });
}