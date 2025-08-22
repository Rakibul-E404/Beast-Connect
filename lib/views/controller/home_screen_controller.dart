// import 'package:get/get.dart';
//
// class HomeScreenController extends GetxController {
//   final currentTabIndex = 0.obs; // Tab index observable
//
//   // Filter tag index observable
//   final filterTagIndex = 0.obs;
//
//   // List of filter tags
//   final filterTags = <Map<String, String>>[
//     {'name': 'All'},
//     {'name': 'Fitness'},
//     {'name': 'Cooking'},
//     {'name': 'Drawing'},
//     {'name': 'Quiz'},
//   ];
//
//   // Selected tag (observable)
//   final selectedTag = 'All'.obs;
//
//   void changeTabIndex(int index) {
//     currentTabIndex.value = index;
//   }
//
//   // Method to select tag based on tag name
//   void selectTag(String tag) {
//     selectedTag.value = tag;
//     // Update the filterTagIndex when tag is selected
//     int index = filterTags.indexWhere((filter) => filter['name'] == tag);
//     if (index != -1) {
//       filterTagIndex.value = index;
//     }
//   }
//
//   // Method to change the selected tag based on index
//   void changeFilterTagIndex(int index) {
//     if (index >= 0 && index < filterTags.length) {
//       filterTagIndex.value = index;
//       selectedTag.value = filterTags[index]['name']!;
//     }
//   }
//
//   var userName = "Afsana Hamid Mim";
//   var userMessage =
//       "I'm so happy using the BeastConnect app! I've discovered amazing games, exciting events, and so many advanced features that make every moment fun and meaningful. Loving the experience!";
//
//   final popularConnections = [
//     {
//       "name": "Afsana",
//       "age": 23,
//       "gender": "Female",
//       "location": "San Francisco",
//       "image":
//       "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80",
//       "active": true,
//     },
//     {
//       "name": "Joya Habib",
//       "age": 23,
//       "gender": "Female",
//       "location": "San Francisco",
//       "image":
//       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK2PEVKLr4P_EMy2PV3C-AE9X2XGAjvKoAlw&s",
//       "active": true,
//     },
//     {
//       "name": "Ariyan",
//       "age": 23,
//       "gender": "Male",
//       "location": "San Francisco",
//       "image":
//       "https://www.shutterstock.com/image-photo/smiling-young-middle-eastern-man-260nw-2063524544.jpg",
//       "active": false,
//     },
//   ];
//
//   final nextEvents = [
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
//       "name": "Call 1",
//       "image": "https://example.com/image1.png",
//       "event": "Event 1",
//       "date": "2025-06-04",
//       "duration": "30 mins",
//     },
//     {
//       "name": "Call 2",
//       "image": "https://example.com/image2.png",
//       "event": "Event 2",
//       "date": "2025-06-05",
//       "duration": "45 mins",
//     },
//   ];
//
//   List<dynamic> rankedUsers = [
//     {
//       'name': 'User 1',
//       'score': 100,
//       'image':
//       'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80'
//     },
//     {
//       'name': 'User 2',
//       'score': 200,
//       'image':
//       'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=400&q=80'
//     },
//   ];
//
//   final rankedUserss = [
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
// }



import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final currentTabIndex = 0.obs; // Tab index observable

  // Filter tag index observable
  final filterTagIndex = 0.obs;

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

  void changeTabIndex(int index) {
    currentTabIndex.value = index;
  }

  // Method to select tag based on tag name - UPDATED
  void selectTag(String tag) {
    selectedTag.value = tag;
    // Update the filterTagIndex when tag is selected
    int index = filterTags.indexWhere((filter) => filter['name'] == tag);
    if (index != -1) {
      filterTagIndex.value = index;
    }

    // REMOVED: Navigation to FitnessPage
    // The content will be filtered in the UI instead of navigating
  }

  // Method to change the selected tag based on index
  void changeFilterTagIndex(int index) {
    if (index >= 0 && index < filterTags.length) {
      filterTagIndex.value = index;
      selectedTag.value = filterTags[index]['name']!;
    }
  }

  // Method to get filtered content based on selected tag
  List<Map<String, dynamic>> getFilteredContent() {
    switch (selectedTag.value) {
      case 'All':
        return allContent; // This won't be used since AllTagSection will be shown
      case 'Fitness':
        return fitnessContent;
      case 'Cooking':
        return cookingContent;
      case 'Drawing':
        return drawingContent;
      case 'Quiz':
        return quizContent;
      default:
        return allContent;
    }
  }

  var userName = "Afsana Hamid Mim";
  var userMessage =
      "I'm so happy using the BeastConnect app! I've discovered amazing games, exciting events, and so many advanced features that make every moment fun and meaningful. Loving the experience!";

  final popularConnections = [
    {
      "name": "Afsana",
      "age": 23,
      "gender": "Female",
      "location": "San Francisco",
      "image":
      "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80",
      "active": true,
    },
    {
      "name": "Joya Habib",
      "age": 23,
      "gender": "Female",
      "location": "San Francisco",
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK2PEVKLr4P_EMy2PV3C-AE9X2XGAjvKoAlw&s",
      "active": true,
    },
    {
      "name": "Ariyan",
      "age": 23,
      "gender": "Male",
      "location": "San Francisco",
      "image":
      "https://www.shutterstock.com/image-photo/smiling-young-middle-eastern-man-260nw-2063524544.jpg",
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

  var joinCalls = [
    {
      "name": "Call 1",
      "image": "https://example.com/image1.png",
      "event": "Event 1",
      "date": "2025-06-04",
      "duration": "30 mins",
    },
    {
      "name": "Call 2",
      "image": "https://example.com/image2.png",
      "event": "Event 2",
      "date": "2025-06-05",
      "duration": "45 mins",
    },
  ];

  List<dynamic> rankedUsers = [
    {
      'name': 'User 1',
      'score': 100,
      'image':
      'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80'
    },
    {
      'name': 'User 2',
      'score': 200,
      'image':
      'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=400&q=80'
    },
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

  // Sample content data for different tags
  final List<Map<String, dynamic>> allContent = [
    {
      "type": "fitness",
      "title": "Morning Workout Challenge",
      "description": "Join our daily fitness routine",
      "image": "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=400&q=80",
    },
    {
      "type": "cooking",
      "title": "Healthy Cooking Tips",
      "description": "Learn to cook nutritious meals",
      "image": "https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?auto=format&fit=crop&w=400&q=80",
    },
    {
      "type": "drawing",
      "title": "Art Workshop",
      "description": "Express yourself through art",
      "image": "https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?auto=format&fit=crop&w=400&q=80",
    },
    {
      "type": "quiz",
      "title": "Daily Knowledge Quiz",
      "description": "Test your knowledge",
      "image": "https://images.unsplash.com/photo-1606092195730-5d7b9af1efc5?auto=format&fit=crop&w=400&q=80",
    },
  ];

  final List<Map<String, dynamic>> fitnessContent = [
    {
      "type": "fitness",
      "title": "Morning Workout Challenge",
      "description": "Join our daily fitness routine",
      "image": "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=400&q=80",
    },
    {
      "type": "fitness",
      "title": "HIIT Training Session",
      "description": "High-intensity interval training",
      "image": "https://images.unsplash.com/photo-1538805060514-97d9cc17730c?auto=format&fit=crop&w=400&q=80",
    },
    {
      "type": "fitness",
      "title": "Yoga & Meditation",
      "description": "Find your inner peace",
      "image": "https://images.unsplash.com/photo-1540206395-68808572332f?auto=format&fit=crop&w=400&q=80",
    },
  ];

  final List<Map<String, dynamic>> cookingContent = [
    {
      "type": "cooking",
      "title": "Healthy Cooking Tips",
      "description": "Learn to cook nutritious meals",
      "image": "https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?auto=format&fit=crop&w=400&q=80",
    },
    {
      "type": "cooking",
      "title": "Quick Breakfast Ideas",
      "description": "Start your day right",
      "image": "https://images.unsplash.com/photo-1484723091739-30a097e8f929?auto=format&fit=crop&w=400&q=80",
    },
  ];

  final List<Map<String, dynamic>> drawingContent = [
    {
      "type": "drawing",
      "title": "Art Workshop",
      "description": "Express yourself through art",
      "image": "https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?auto=format&fit=crop&w=400&q=80",
    },
    {
      "type": "drawing",
      "title": "Digital Art Basics",
      "description": "Learn digital drawing techniques",
      "image": "https://images.unsplash.com/photo-1541961017774-22349e4a1262?auto=format&fit=crop&w=400&q=80",
    },
  ];

  final List<Map<String, dynamic>> quizContent = [
    {
      "type": "quiz",
      "title": "Daily Knowledge Quiz",
      "description": "Test your knowledge",
      "image": "https://images.unsplash.com/photo-1606092195730-5d7b9af1efc5?auto=format&fit=crop&w=400&q=80",
    },
    {
      "type": "quiz",
      "title": "Science Trivia",
      "description": "How much do you know about science?",
      "image": "https://images.unsplash.com/photo-1532094349884-543bc11b234d?auto=format&fit=crop&w=400&q=80",
    },
  ];
}