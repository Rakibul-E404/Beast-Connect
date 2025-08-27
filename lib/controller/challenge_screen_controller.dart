import 'package:get/get.dart';

class ChallengeScreenController extends GetxController {
  int selectedIndex = 0;

  final List<String> categories = [
    'All',
    'Push up',
    'Pull Up',
    'Quiz',
    'Drawing',
    'Cooking',
  ];

  final List<ChallengeVideo> challenges = [
    ChallengeVideo(
      title: 'Push up',
      subtitle: '20 Push',
      timeLeft: '4hour 2min Basic',
      coins: 20,
      thumbnailUrl: 'https://www.orthovirginia.com/wp-content/uploads/2022/03/home-bodyweight-workout-featured_637402090673043414.jpg',
      category: 'Push up',
    ),
    ChallengeVideo(
      title: 'Push up',
      subtitle: '20 Push',
      timeLeft: '4hour 2min Basic',
      coins: 20,
      thumbnailUrl: 'https://www.orthovirginia.com/wp-content/uploads/2022/03/home-bodyweight-workout-featured_637402090673043414.jpg',
      category: 'Push up',
    ),
    ChallengeVideo(
      title: 'Push up',
      subtitle: '20 Push',
      timeLeft: '4hour 2min Basic',
      coins: 20,
      thumbnailUrl: 'https://www.orthovirginia.com/wp-content/uploads/2022/03/home-bodyweight-workout-featured_637402090673043414.jpg',
      category: 'Push up',
    ),
    ChallengeVideo(
      title: 'Push up',
      subtitle: '20 Push',
      timeLeft: '4hour 2min Basic',
      coins: 20,
      thumbnailUrl: 'https://www.orthovirginia.com/wp-content/uploads/2022/03/home-bodyweight-workout-featured_637402090673043414.jpg',
      category: 'Push up',
    ),
    ChallengeVideo(
      title: 'Pull Up Challenge',
      subtitle: '10 Pull Ups',
      timeLeft: '5hour 20min Basic',
      coins: 40,
      thumbnailUrl: 'https://www.orthovirginia.com/wp-content/uploads/2022/03/home-bodyweight-workout-featured_637402090673043414.jpg',
      category: 'Pull Up',
    ),
    ChallengeVideo(
      title: 'Advanced Pull Up',
      subtitle: '15 Pull Ups',
      timeLeft: '6hour 0min',
      coins: 45,
      thumbnailUrl: 'https://www.orthovirginia.com/wp-content/uploads/2022/03/home-bodyweight-workout-featured_637402090673043414.jpg',
      category: 'Pull Up',
    ),
    ChallengeVideo(
      title: 'Quiz Challenge',
      subtitle: 'General Knowledge',
      timeLeft: '2hour 30min Basic',
      coins: 15,
      thumbnailUrl: 'https://www.orthovirginia.com/wp-content/uploads/2022/03/home-bodyweight-workout-featured_637402090673043414.jpg',
      category: 'Quiz',
    ),
    ChallengeVideo(
      title: 'Drawing Challenge',
      subtitle: 'Sketch Portrait',
      timeLeft: '3hour 15min Creative',
      coins: 25,
      thumbnailUrl: 'https://www.orthovirginia.com/wp-content/uploads/2022/03/home-bodyweight-workout-featured_637402090673043414.jpg',
      category: 'Drawing',
    ),
  ];

  List<ChallengeVideo> get filteredChallenges {
    if (categories[selectedIndex] == 'All') {
      return challenges;
    }
    return challenges.where((challenge) =>
    challenge.category == categories[selectedIndex]).toList();
  }

  void updateSelectedIndex(int index) {
    selectedIndex = index;
    update(); // Manually trigger UI update
  }
}

class ChallengeVideo {
  final String title;
  final String subtitle;
  final String timeLeft;
  final int coins;
  final String thumbnailUrl;
  final String category;

  ChallengeVideo({
    required this.title,
    required this.subtitle,
    required this.timeLeft,
    required this.coins,
    required this.thumbnailUrl,
    required this.category,
  });
}