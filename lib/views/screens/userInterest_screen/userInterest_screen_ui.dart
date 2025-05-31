// import 'package:beast_connect/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import '../../../widget/buttons/Custom_Elevated_Button.dart';
// import '../../../widget/buttons/custom_text_button.dart';
// import '../../../widget/font/customAppFontStyle.dart';
//
// class UserInterestsScreen extends StatefulWidget {
//   const UserInterestsScreen({super.key});
//
//   @override
//   State<UserInterestsScreen> createState() => _UserInterestsPageState();
// }
//
// class _UserInterestsPageState extends State<UserInterestsScreen> {
//   // Track selected interests
//   final Map<String, bool> selectedInterests = {
//     'Gym': false,
//     'Yoga': false,
//     'Drawing': false,
//     'Fashion': false,
//     'Photography': false,
//     'Craft': false,
//     'Daily Trivia': false,
//     'Puzzle Solving': false,
//     'Team Workout': false,
//     'Cooking': false,
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.tertiaryColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.tertiaryColor,
//         actions: [
//           CustomTextButton(
//               buttonText: 'Skip',
//               textStyle: TextStyle(color: AppColors.secondaryTextColor),
//               onPressed: (){
//             ///todo
//           })
//         ],
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: RichText(text: TextSpan(text: 'Your',
//                       style: CustomAppFontStyle.bold(20, AppColors.primaryColor),
//                       children: [
//                         TextSpan(
//                           text: 'interest?',
//                           style: CustomAppFontStyle.regular(20, AppColors.secondaryTextColor),
//                         ),
//                       ])),
//                 ),
//                 Text(
//                   'Select a few of your interests and let everyone know what you\'re passionate about.',
//                   style: CustomAppFontStyle.regular(16, Colors.grey[600]),
//                 ),
//                 const SizedBox(height: 24),
//
//                 // Interest categories with expandable sections
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         _buildInterestCategory(
//                           title: 'Gym',
//                           subItems: ['Yoga', 'Drawing'],
//                         ),
//                         _buildInterestCategory(
//                           title: 'Fashion',
//                           subItems: ['Photography', 'Craft'],
//                         ),
//                         _buildInterestCategory(
//                           title: 'Daily Trivia',
//                           subItems: ['Puzzle Solving'],
//                         ),
//                         _buildInterestCategory(
//                           title: 'Team Workout',
//                           subItems: ['Cooking'],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 // Submit button
//                 CustomElevatedButton(
//                   onPressed: () {
//                     // Get list of selected interests
//                     final selected = selectedInterests.entries
//                         .where((entry) => entry.value)
//                         .map((entry) => entry.key)
//                         .toList();
//
//                     // Handle submission
//                     if (selected.isEmpty) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Please select at least one interest')),
//                       );
//                     } else {
//                       // Process submission
//                       debugPrint('Selected interests: $selected');
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('${selected.length} interests selected')),
//                       );
//                     }
//                   },
//                   buttonText: 'Submit',
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.white,
//                   isFullWidth: true,
//                   height: 50,
//                   borderRadius: BorderRadius.circular(12),
//                   margin: const EdgeInsets.only(top: 16),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInterestCategory({
//     required String title,
//     required List<String> subItems,
//   }) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: ExpansionTile(
//         title: Text(
//           title,
//           style: CustomAppFontStyle.medium(18, Colors.black),
//         ),
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               children: [
//                 // Main category toggle
//                 _buildInterestItem(title),
//                 const Divider(height: 1),
//                 // Sub-items
//                 ...subItems.map((item) => _buildInterestItem(item)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildInterestItem(String interest) {
//     return CheckboxListTile(
//       title: Text(
//         interest,
//         style: CustomAppFontStyle.regular(16, Colors.black),
//       ),
//       value: selectedInterests[interest],
//       onChanged: (value) {
//         setState(() {
//           selectedInterests[interest] = value!;
//         });
//       },
//       controlAffinity: ListTileControlAffinity.leading,
//       contentPadding: EdgeInsets.zero,
//       activeColor: Colors.blue,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(8)),
//       ),
//     );
//   }
// }


import 'package:beast_connect/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../widget/buttons/custom_text_button.dart';
import '../../../widget/font/customAppFontStyle.dart';

class UserInterestsScreen extends StatefulWidget {
  const UserInterestsScreen({super.key});

  @override
  State<UserInterestsScreen> createState() => _UserInterestsScreenState();
}

class _UserInterestsScreenState extends State<UserInterestsScreen> {
  final Map<String, bool> selectedInterests = {
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
  };

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tertiaryColor,
      appBar: AppBar(

        backgroundColor: AppColors.tertiaryColor,
        elevation: 0,
        actions: [
          CustomTextButton(
            buttonText: 'Skip',
            textStyle: TextStyle(color: AppColors.secondaryTextColor),
            onPressed: () {
              // TODO: Navigate or skip logic
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Your ',
                      style: CustomAppFontStyle.bold(20, AppColors.primaryColor),
                    ),
                    TextSpan(
                      text: 'interests?',
                      style: CustomAppFontStyle.bold(20, AppColors.secondaryTextColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Select a few of your interests and let everyone know what you\'re passionate about.',
                style: CustomAppFontStyle.regular(14, AppColors.secondaryTextColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Chips
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: selectedInterests.entries.map((entry) {
                  final label = entry.key;
                  final isSelected = entry.value;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedInterests[label] = !isSelected;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.orange : Colors.transparent,
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            interestIcons[label],
                            color: isSelected ? Colors.white : Colors.orange,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            label,
                            style: CustomAppFontStyle.regular(
                              14,
                              isSelected ? Colors.white : Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),

              const Spacer(),

              // Gradient Submit Button
              GestureDetector(
                onTap: () {
                  final selected = selectedInterests.entries
                      .where((e) => e.value)
                      .map((e) => e.key)
                      .toList();

                  if (selected.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select at least one interest')),
                    );
                  } else {
                    debugPrint('Selected: $selected');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${selected.length} interests selected')),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.blue],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Submit',
                    style: CustomAppFontStyle.bold(16, Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

