// import 'package:get/get.dart';
//
// class HomeScreenController extends GetxController {
//   var userName = "Afsana Hamid Mim";
//
//   var userMessage =
//       "I'm so happy using the BeastConnect app! I've discovered amazing games, exciting events, and so many advanced features that make every moment fun and meaningful. Loving the experience!";
//
//   // Updated: List of maps instead of List<String>
//   var filterTags = <Map<String, String>>[
//     {'name': 'All'},
//     {'name': 'Fitness'},
//     {'name': 'Cooking'},
//     {'name': 'Drawing'},
//     {'name': 'Quiz'},
//   ];
//
//   // Selected tag name
//   var selectedTag = 'All'.obs;
//
//   var popularConnections = [
//     {
//       "name": "Afsana",
//       "age": 23,
//       "location": "San Francisco",
//       "image":
//       "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80",
//       "active": true,
//     },
//     {
//       "name": "Ariyan",
//       "age": 23,
//       "location": "San Francisco",
//       "image":
//       "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80",
//       "active": false,
//     },
//   ];
//
//   var nextEvents = [
//     {
//       "title": "Yoga Session",
//       "image":
//       "https://images.unsplash.com/photo-1540206395-68808572332f?auto=format&fit=crop&w=400&q=80",
//     },
//     {
//       "title": "Cooking Workshop",
//       "image":
//       "https://images.unsplash.com/photo-1516685018646-5494f8b3eab7?auto=format&fit=crop&w=400&q=80",
//     },
//   ];
//
//   var joinCalls = [
//     {
//       "name": "Ariyan Ahammed",
//       "event": "Let's Sick The Small Talk",
//       "image":
//       "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=400&q=80",
//       "date": "6 May, 2025",
//       "duration": "10:20m",
//     },
//     {
//       "name": "Afsana Hamid Mim",
//       "event": "Let's Say the Next Talk",
//       "image":
//       "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80",
//       "date": "6 May, 2025",
//       "duration": "10:20m",
//     },
//   ];
//
//   var rankedUsers = [
//     {
//       "name": "Afsana Hamid",
//       "score": 95,
//       "badge": "Beastly Challenger",
//       "image":
//       "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80",
//     },
//     {
//       "name": "Ariya",
//       "score": 94,
//       "badge": "Beastly Challenger",
//       "image":
//       "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=400&q=80",
//     },
//   ];
//
//   void selectTag(String tag) {
//     selectedTag.value = tag;
//   }
// }




import 'package:get/get.dart';

class HomeScreenController extends GetxController {
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

  final joinCalls = [
    {
      "name": "Ariyan Ahammed",
      "event": "Let's Sick The Small Talk",
      "image":
      "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=400&q=80",
      "date": "6 May, 2025",
      "duration": "10:20m",
    },
    {
      "name": "Afsana Hamid Mim",
      "event": "Let's Say the Next Talk",
      "image":
      "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80",
      "date": "6 May, 2025",
      "duration": "10:20m",
    },
  ];

  final rankedUsers = [
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
