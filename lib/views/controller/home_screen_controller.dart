import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final currentTabIndex = 0.obs;

  void changeTabIndex(int index) {
    currentTabIndex.value = index;
  }

  var userName = "Afsana Hamid Mim";

  var userMessage =
      "I'm so happy using the BeastConnect app! I've discovered amazing games, exciting events, and so many advanced features that make every moment fun and meaningful. Loving the experience!";

  // List of filter tags
  final filterTags = <Map<String, String>>[
    {'name': 'All'},
    {'name': 'Fitness'},
    {'name': 'Cooking'},
    {'name': 'Drawing'},
    {'name': 'Quiz'},
  ];

  // Selected tag (observable)
  final selectedTag = 'All'.obs;

  final popularConnections = [
    {
      "name": "Afsana",
      "age": 23,
      "location": "San Francisco",
      "image":
      "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80",
      "active": true,
    },
    {
      "name": "Ariyan",
      "age": 23,
      "location": "San Francisco",
      "image":
      "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80",
      "active": false,
    },
  ];

  final nextEvents = [
    {
      "title": "Yoga Session",
      "image":
      "https://images.unsplash.com/photo-1540206395-68808572332f?auto=format&fit=crop&w=400&q=80",
    },
    {
      "title": "Cooking Workshop",
      "image":
      "https://images.unsplash.com/photo-1516685018646-5494f8b3eab7?auto=format&fit=crop&w=400&q=80",
    },
  ];

  // Updated joinCalls list with new data
  var joinCalls = [
    {
      "name": "Call 1",
      "image":
      "https://example.com/image1.png",
      "event": "Event 1",
      "date": "2025-06-04",
      "duration": "30 mins",
    },
    {
      "name": "Call 2",
      "image":
      "https://example.com/image2.png",
      "event": "Event 2",
      "date": "2025-06-05",
      "duration": "45 mins",
    },
    // Add more calls here if needed
  ];

  List<dynamic> rankedUsers = [
    {'name': 'User 1', 'score': 100, 'image': 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80'},
    {'name': 'User 2', 'score': 200, 'image': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=400&q=80'},
    // Add more users here
  ];

  final rankedUserss = [
    {
      "name": "Afsana Hamid",
      "score": 95,
      "badge": "Beastly Challenger",
      "image":
      "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80",
    },
    {
      "name": "Ariya",
      "score": 94,
      "badge": "Beastly Challenger",
      "image":
      "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=400&q=80",
    },
  ];

  // Method to select tag
  void selectTag(String tag) {
    selectedTag.value = tag;
  }
}



