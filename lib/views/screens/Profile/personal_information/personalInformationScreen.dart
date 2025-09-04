import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/views/screens/Profile/personal_information/audio_file_secected_screen.dart';
import 'package:beast_connect/views/screens/Profile/personal_information/personal_informaiton_edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryIconColor),
        ),
        centerTitle: true,
        title: Text(
          "Personal Information",
          style: TextStyle(color: AppColors.secondaryTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  // Apply border radius to container
                  border: Border.all(
                    color: AppColors.primaryColor, // Border color
                    width: 2, // Border width
                  ),
                ),
                width: Get.width, // Full screen width
                height: 300, // Height for the container
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  // Apply the same border radius for clipping
                  child: Image.network(
                    "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg",
                    width: Get.width, // Full width of the screen
                    height: 300, // Fixed height
                    fit: BoxFit
                        .fill, // Ensures the image covers the full width and maintains aspect ratio
                  ),
                ),
              ),

              SizedBox(height: 50),

              Stack(
                children: [
                  // Main Container (should be first)
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.only(top: 25),
                    // Add top margin to make space for the overlay
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 36),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.play_circle_fill,
                                      color: AppColors.primaryIconColor,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: (){Get.to(AudioFileSelectedScreen());},
                                      icon: Icon(CupertinoIcons.music_note,
                                        size: 30,
                                      ),
                                      color: AppColors.primaryIconColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Afsana Hamid Mim",
                                style: TextStyle(
                                  color: AppColors.secondaryTextColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "afsanahamidmim@gmail.com",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.primaryIconColor,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "San Francisco",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20),

                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF232536),
                              // adjust to match background
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.primaryColor),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(2.6), // wider
                                  1: FlexColumnWidth(1.9),
                                  2: FlexColumnWidth(1.9),
                                },

                                children: [
                                  TableRow(
                                    children: [
                                      Text(
                                        "Date of birth",
                                        style: TextStyle(
                                          color: AppColors.secondaryTextColor,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "Height",
                                        style: TextStyle(
                                          color: AppColors.secondaryTextColor,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "Status",
                                        style: TextStyle(
                                          color: AppColors.secondaryTextColor,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Text(
                                        "1-10-1995",
                                        style: TextStyle(
                                          color: AppColors.secondaryTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        "6.1 In",
                                        style: TextStyle(
                                          color: AppColors.secondaryTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        "Single",
                                        style: TextStyle(
                                          color: AppColors.secondaryTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      SizedBox(height: 16),
                                      SizedBox(height: 16),
                                      SizedBox(height: 16),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Text(
                                        "Religion",
                                        style: TextStyle(
                                          color: AppColors.secondaryTextColor,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "Gender",
                                        style: TextStyle(
                                          color: AppColors.secondaryTextColor,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "Qualification",
                                        style: TextStyle(
                                          color: AppColors.secondaryTextColor,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Text(
                                        "Islam",
                                        style: TextStyle(
                                          color: AppColors.secondaryTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        "Female",
                                        style: TextStyle(
                                          color: AppColors.secondaryTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        "BSC",
                                        style: TextStyle(
                                          color: AppColors.secondaryTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 40),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "About",
                                    style: TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Hello there! I'mVickie, seeking a lifelong adventure partner. A blend of tradition and modernity, I find joy in the simple moments and cherish family values. With a heart that believes in love's magic, I'm looking for someone to share happiness. Read more...",
                                      style: TextStyle(
                                        color: AppColors.secondaryTextColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 20),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Interest",
                                        style: TextStyle(
                                          color: AppColors.secondaryTextColor,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Chip(
                                        backgroundColor: AppColors.primaryColor,
                                        // Use backgroundColor instead of color
                                        label: Row(
                                          children: [
                                            Icon(
                                              Icons.menu_book,
                                              color: AppColors.primaryIconColor,
                                            ),
                                            // Your desired icon
                                            SizedBox(width: 8),
                                            // Optional, to add some space between the icon and text
                                            Text(
                                              "Reading",
                                              style: TextStyle(
                                                color: AppColors
                                                    .secondaryTextColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Chip(
                                        backgroundColor: AppColors.primaryColor,
                                        // Use backgroundColor instead of color
                                        label: Row(
                                          children: [
                                            Icon(
                                              Icons.music_note,
                                              color: AppColors.primaryIconColor,
                                            ),
                                            // Your desired icon
                                            SizedBox(width: 8),
                                            // Optional, to add some space between the icon and text
                                            Text(
                                              "Music",
                                              style: TextStyle(
                                                color: AppColors
                                                    .secondaryTextColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Chip(
                                        backgroundColor: AppColors.primaryColor,
                                        // Use backgroundColor instead of color
                                        label: Row(
                                          children: [
                                            Icon(
                                              Icons.sports_baseball,
                                              color: AppColors.primaryIconColor,
                                            ),
                                            // Your desired icon
                                            SizedBox(width: 8),
                                            // Optional, to add some space between the icon and text
                                            Text(
                                              "Sports",
                                              style: TextStyle(
                                                color: AppColors
                                                    .secondaryTextColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(height: 20),

                              ///------------ video
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Video",
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: AppColors.secondaryTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  // Adds some space between the title and grid
                                  GridView.builder(
                                    shrinkWrap: true,
                                    // Makes the GridView take only as much space as needed
                                    physics: NeverScrollableScrollPhysics(),
                                    // Disables scrolling if inside a scrollable widget
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      // Creates 2 columns in the grid
                                      crossAxisSpacing: 10,
                                      // Spacing between columns
                                      mainAxisSpacing: 10, // Spacing between rows
                                    ),
                                    itemCount: 4,
                                    // Total number of items in the grid
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12), // Rounded corners
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "https://cdn.expertphotography.com/wp-content/uploads/2019/09/motion-blur-girl-dancing-on-stage.jpg",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "0:0${index + 4}",
                                              // Replace with dynamic video time if needed
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),


                              ///--------- Music
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Music",
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12,
                                      childAspectRatio: 2.5, // Makes items more rectangular like in the image
                                    ),
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      List<Map<String, String>> albums = [
                                        {
                                          'title': 'Electric Feel',
                                          'artist': 'MGMT',
                                          'image': 'https://i.scdn.co/image/ab67616d0000b273f4b4e81f8efee32b93f9e7d3',
                                        },
                                        {
                                          'title': 'Sweetener',
                                          'artist': 'Ariana Grande',
                                          'image': 'https://upload.wikimedia.org/wikipedia/en/7/7a/Sweetener_album_cover.png',
                                        },
                                        {
                                          'title': 'Lemonade',
                                          'artist': 'Calum Scott',
                                          'image': 'https://i.scdn.co/image/ab67616d0000b273c9b6c0d3d4c4f3a4e6f7e8f9',
                                        },
                                        {
                                          'title': 'Sunset',
                                          'artist': 'Maggie Rogers',
                                          'image': 'https://i.scdn.co/image/ab67616d0000b273a1b2c3d4e5f6g7h8i9j0k1l2',
                                        },
                                      ];

                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.3),
                                              blurRadius: 8,
                                              offset: Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(albums[index]['image']!),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Container(
                                              // Overlay for better text readability
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Colors.transparent,
                                                    Colors.black.withOpacity(0.4),
                                                  ],
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      albums[index]['title']!,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(height: 2),
                                                    Text(
                                                      albums[index]['artist']!,
                                                      style: TextStyle(
                                                        color: Colors.white.withOpacity(0.8),
                                                        fontSize: 13,
                                                      ),
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              /// ---------- gallery
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Gallery Photo",
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: AppColors.secondaryTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  // Adds some space between the title and grid
                                  GridView.builder(
                                    shrinkWrap: true,
                                    // Makes the GridView take only as much space as needed
                                    physics: NeverScrollableScrollPhysics(),
                                    // Disables scrolling if inside a scrollable widget
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      // Creates 2 columns in the grid
                                      crossAxisSpacing: 10,
                                      // Spacing between columns
                                      mainAxisSpacing: 10, // Spacing between rows
                                    ),
                                    itemCount: 4,
                                    // Total number of items in the grid
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12), // Makes the corners rounded
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRc8b_qtC8xoY9NibglDhLKnLZ4Svf9-VVtPA&s",
                                            ),
                                            // Replace with actual image sources
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),


                  /// Positioned container above the border (should be last to appear on top)
                  Positioned(
                    top: 0, // Position it at the top
                    left: Get.width * 0.09, // Adjust horizontal alignment
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF232536),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.primaryColor),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      height: 50, // Height of the top widget
                      width: Get.width * 0.8, // Width of the top widget
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "My Bio", // Your custom text or widget here
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){Get.to(PersonalInformaitonEditScreen());},
                                child: Icon(
                                  CupertinoIcons.square_pencil_fill,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



