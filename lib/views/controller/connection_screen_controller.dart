import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../widget/buttons/Custom_Elevated_Button.dart';
import '../../../widget/buttons/Custom_Outline_Button.dart';

class ConnectionScreenController {

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text('Filters', style: Theme.of(context).textTheme.titleLarge)),
              SizedBox(height: 20), // Add some space before the button

              CustomOutlinedButton(
                onPressed: () {
                  _onHobbiesPressed();
                },
                buttonText: 'Hobbies',
                textColor: AppColors.primaryTextColor,
                isFullWidth: true,
                isRounded: true,
                height: 44,
                suffixIcon: Icon(Icons.arrow_forward_ios),
                iconColor: AppColors.primaryColor,
                foregroundColor: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              SizedBox(height: 20),
              CustomOutlinedButton(
                onPressed: () {
                  _onNetworkingPressed();
                },
                buttonText: 'Networking',
                textColor: AppColors.primaryTextColor,
                isFullWidth: true,
                isRounded: true,
                height: 44,
                suffixIcon: Icon(Icons.arrow_forward_ios),
                iconColor: AppColors.primaryColor,
                foregroundColor: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              SizedBox(height: 20),
              CustomOutlinedButton(
                onPressed: () {
                  _onFriendsPressed();
                },
                buttonText: 'Friends',
                textColor: AppColors.primaryTextColor,
                isFullWidth: true,
                isRounded: true,
                height: 44,
                suffixIcon: Icon(Icons.arrow_forward_ios),
                iconColor: AppColors.primaryColor,
                foregroundColor: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: CustomElevatedButton(
                  onPressed: () {
                    _onApplyPressed(context);
                  },
                  buttonText: 'Apply',
                  textColor: AppColors.secondaryTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  isFullWidth: true,
                  isRounded: true,
                  height: 48,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  hasShadow: false,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Filter option handlers - implement your logic here
  void _onHobbiesPressed() {
    // TODO: Implement hobbies filter logic
    debugPrint('Hobbies filter selected');
  }

  void _onNetworkingPressed() {
    // TODO: Implement networking filter logic
    debugPrint('Networking filter selected');
  }

  void _onFriendsPressed() {
    // TODO: Implement friends filter logic
    debugPrint('Friends filter selected');
  }

  void _onApplyPressed(BuildContext context) {
    // TODO: Implement apply filter logic
    debugPrint('Apply filters');
    Navigator.pop(context); // Close the bottom sheet
  }
}


// Connections data (keep this in a separate file or model)
final List<Map<String, dynamic>> Connections = [
  {
    "name": "Afsana",
    "gender": "Female",
    "age": 23,
    "location": "San Francisco",
    "image": "https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
    "active": true,
    "dob": "11-22-3333",
    "qualification": "dev",
    "height":"5.6",
    "status":"Single",
    "religion":"Islam",
    "about": "Hello there! I'mVickie, seeking a lifelong adventure partner. A blend of tradition and modernity, I find joy in the simple moments and cherish family values. With a heart that believes in love's magic, I'm looking for someone to share happiness."
  },
  {
    "name": "Mim",
    "gender": "Female",
    "age": 23,
    "location": "San Francisco",
    "image": "https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
    "active": true,
    "dob": "11-22-3333",
    "qualification": "dev",
    "height":"5.6",
    "status":"Single",
    "religion":"Islam",
    "about": "Hello there! I'mVickie, seeking a lifelong adventure partner. A blend of tradition and modernity, I find joy in the simple moments and cherish family values. With a heart that believes in love's magic, I'm looking for someone to share happiness."
  },
  {
    "name": "Arian",
    "gender": "Male",
    "age": 23,
    "location": "San Francisco",
    "image": "https://images.unsplash.com/photo-1633332755192-727a05c4013d?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
    "active": false,
    "dob": "11-22-3333",
    "qualification": "dev",
    "height":"5.6",
    "status":"Single",
    "religion":"Islam",
    "about": "Hello there! I'mVickie, seeking a lifelong adventure partner. A blend of tradition and modernity, I find joy in the simple moments and cherish family values. With a heart that believes in love's magic, I'm looking for someone to share happiness."
  },
  {
    "name": "Arian",
    "gender": "Male",
    "age": 23,
    "location": "San Francisco",
    "image": "https://images.unsplash.com/photo-1633332755192-727a05c4013d?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
    "active": false,
    "dob": "11-22-3333",
    "qualification": "dev",
    "height":"5.6",
    "status":"Single",
    "religion":"Islam",
    "about": "Hello there! I'mVickie, seeking a lifelong adventure partner. A blend of tradition and modernity, I find joy in the simple moments and cherish family values. With a heart that believes in love's magic, I'm looking for someone to share happiness."
  },
  {
    "name": "Afsana",
    "gender": "Female",
    "age": 23,
    "location": "San Francisco",
    "image": "https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
    "active": true,
    "dob": "11-22-3333",
    "qualification": "dev",
    "height":"5.6",
    "status":"Single",
    "religion":"Islam",
    "about": "Hello there! I'mVickie, seeking a lifelong adventure partner. A blend of tradition and modernity, I find joy in the simple moments and cherish family values. With a heart that believes in love's magic, I'm looking for someone to share happiness."
  },
  {
    "name": "Ariyan",
    "gender": "Male",
    "age": 23,
    "location": "San Francisco",
    "image": "https://images.unsplash.com/photo-1633332755192-727a05c4013d?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
    "active": true,
    "dob": "11-22-3333",
    "qualification": "dev",
    "height":"5.6",
    "status":"Single",
    "religion":"Islam",
    "about": "Hello there! I'mVickie, seeking a lifelong adventure partner. A blend of tradition and modernity, I find joy in the simple moments and cherish family values. With a heart that believes in love's magic, I'm looking for someone to share happiness."
  },
  {
    "name": "Afsana",
    "gender": "Female",
    "age": 23,
    "location": "San Francisco",
    "image": "https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
    "active": true,
    "dob": "11-22-3333",
    "qualification": "dev",
    "height":"5.6",
    "status":"Single",
    "religion":"Islam",
    "about": "Hello there! I'mVickie, seeking a lifelong adventure partner. A blend of tradition and modernity, I find joy in the simple moments and cherish family values. With a heart that believes in love's magic, I'm looking for someone to share happiness."
  },
  {
    "name": "Arian",
    "gender": "Male",
    "age": 23,
    "location": "San Francisco",
    "image": "https://images.unsplash.com/photo-1633332755192-727a05c4013d?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
    "active": true,
    "dob": "11-22-3333",
    "qualification": "dev",
    "height":"5.6",
    "status":"Single",
    "religion":"Islam",
    "about": "Hello there! I'mVickie, seeking a lifelong adventure partner. A blend of tradition and modernity, I find joy in the simple moments and cherish family values. With a heart that believes in love's magic, I'm looking for someone to share happiness.",
  },
  {
    "name": "Arfa",
    "gender": "Female",
    "age": 23,
    "location": "San Francisco",
    "image": "https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
    "active": true,
    "dob": "11-22-3333",
    "qualification": "dev",
    "height":"5.6",
    "status":"Single",
    "religion":"Islam",
    "about": "Hello there! I'mVickie, seeking a lifelong adventure partner. A blend of tradition and modernity, I find joy in the simple moments and cherish family values. With a heart that believes in love's magic, I'm looking for someone to share happiness."
  },

];