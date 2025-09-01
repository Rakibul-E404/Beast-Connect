import 'package:beast_connect/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,color: AppColors.primaryIconColor,)),
        centerTitle: true,
        title: Text("Personal Information",style: TextStyle(
          color: AppColors.secondaryTextColor
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)), // Apply border radius to container
                  border: Border.all(
                    color: AppColors.primaryColor, // Border color
                    width: 2, // Border width
                  ),
                ),
                width: Get.width, // Full screen width
                height: 300, // Height for the container
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)), // Apply the same border radius for clipping
                  child: Image.network(
                    "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg",
                    width: Get.width, // Full width of the screen
                    height: 300, // Fixed height
                    fit: BoxFit.fill, // Ensures the image covers the full width and maintains aspect ratio
                  ),
                ),
              ),
        
              SizedBox(
                height: 50,
              ),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                    border: Border.all(
        
                    color: Colors.white
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        Icon(Icons.edit,color: Colors.white,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Afsana Hamid Mim",style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text("afsanahamidmim@gmail.com",style: TextStyle(
                            color: AppColors.secondaryTextColor,
                          ),),
                        ],
                      )
                    ],
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
