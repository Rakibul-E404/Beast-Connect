import 'package:beast_connect/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
                    margin: EdgeInsets.only(top: 25), // Add top margin to make space for the overlay
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
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
                                      Icon(CupertinoIcons.play_circle_fill,color: AppColors.primaryIconColor,size: 30,),
                                    ],
                                  )),
                              SizedBox(width: 10,),
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
                                    Icon(CupertinoIcons.music_note,color: AppColors.primaryIconColor,size: 30,),
                                  ],
                                ),
                              )
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
                              Icon(Icons.location_on,color: AppColors.primaryIconColor,size: 20,),
                              SizedBox(width: 8,),
                              Text(
                                "San Francisco",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20,),

                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF232536), // adjust to match background
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(2.6),  // wider
                                  1: FlexColumnWidth(1.9),
                                  2: FlexColumnWidth(1.9),
                                },

                                children: [
                                  TableRow(
                                    children: [
                                      Text("Date of birth", style: TextStyle(
                                        color: AppColors.secondaryTextColor,
                                        fontSize: 18,
                                      )),
                                      Text("Height", style: TextStyle(
                                        color: AppColors.secondaryTextColor,
                                        fontSize: 18,
                                      )),
                                      Text("Status", style: TextStyle(
                                        color: AppColors.secondaryTextColor,
                                        fontSize: 18,
                                      )),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Text("1-10-1995", style: TextStyle(
                                        color: AppColors.secondaryTextColor,
                                        fontSize: 15,
                                      )),
                                      Text("6.1 In", style: TextStyle(
                                        color: AppColors.secondaryTextColor,
                                        fontSize: 15,
                                      )),
                                      Text("Single", style: TextStyle(
                                        color: AppColors.secondaryTextColor,
                                        fontSize: 15,
                                      )),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      SizedBox(height: 16), SizedBox(height: 16), SizedBox(height: 16),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Text("Religion", style: TextStyle(
                                        color: AppColors.secondaryTextColor,
                                        fontSize: 18,
                                      )),
                                      Text("Gender", style: TextStyle(
                                        color: AppColors.secondaryTextColor,
                                        fontSize: 18,
                                      )),
                                      Text("Qualification", style: TextStyle(
                                        color: AppColors.secondaryTextColor,
                                        fontSize: 18,
                                      )),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Text("Islam", style: TextStyle(
                                        color: AppColors.secondaryTextColor,
                                        fontSize: 15,
                                      )),
                                      Text("Female", style: TextStyle(
                                        color: AppColors.secondaryTextColor,
                                        fontSize: 15,
                                      )),
                                      Text("BSC", style: TextStyle(
                                        color: AppColors.secondaryTextColor,
                                        fontSize: 15,
                                      )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 40,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("About",style: TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 25
                                  ),),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text("Hello there! I'mVickie, seeking a lifelong adventure partner. A blend of tradition and modernity, I find joy in the simple moments and cherish family values. With a heart that believes in love's magic, I'm looking for someone to share happiness. Read more...",style: TextStyle(
                                        color: AppColors.secondaryTextColor,
                                        fontSize: 16
                                    ),),
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
                    left: Get.width * 0.1, // Adjust horizontal alignment
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
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
                              Text(
                                "My Bio", // Your custom text or widget here
                                style: TextStyle(color: Colors.black,fontSize: 25),
                              ),
                              Icon(CupertinoIcons.square_pencil_fill,color: AppColors.primaryColor,)
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








