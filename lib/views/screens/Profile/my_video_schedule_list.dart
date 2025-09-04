import 'package:beast_connect/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class MyVideoScheduleList extends StatelessWidget {
  final List<VideoSchedule> videoSchedules = [
    VideoSchedule(
      title: 'Let\'s Skip the Small Talk',
      date: '6 May, 2025',
      time: '10:20am',
      status: 'Active',
      duration: '3 min',
      location: 'San Francisco',
    ),
    VideoSchedule(
      title: 'Let\'s Skip the Small Talk',
      date: '6 May, 2025',
      time: '10:20am',
      status: 'Ended',
      duration: '3 min',
      location: 'San Francisco',
    ),
    VideoSchedule(
      title: 'Let\'s Skip the Small Talk',
      date: '6 May, 2025',
      time: '10:20am',
      status: 'Ended',
      duration: '3 min',
      location: 'San Francisco',
    ),
    VideoSchedule(
      title: 'Let\'s Skip the Small Talk',
      date: '6 May, 2025',
      time: '10:20am',
      status: 'Ended',
      duration: '3 min',
      location: 'San Francisco',
    ),
  ];

   MyVideoScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: AppColors.primaryIconColor,),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('My Video Schedule List',style: TextStyle(
          color: AppColors.secondaryTextColor
        ),),
        actions: [
          IconButton(
            icon: Icon(Icons.add,color: AppColors.primaryIconColor,size: 30,),
            onPressed: () {
              // Action to create a new video schedule
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: videoSchedules.length,
        itemBuilder: (context, index) {
          final schedule = videoSchedules[index];
          return VideoScheduleItem(schedule: schedule);
        },
      ),
    );
  }
}

class VideoSchedule {
  final String title;
  final String date;
  final String time;
  final String status;
  final String duration;
  final String location;

  VideoSchedule({
    required this.title,
    required this.date,
    required this.time,
    required this.status,
    required this.duration,
    required this.location,
  });
}

class VideoScheduleItem extends StatelessWidget {
  final VideoSchedule schedule;

  const VideoScheduleItem({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        // Show delete confirmation dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppColors.tertiaryColor,
            title: Text('Delete Video Schedule',style: TextStyle(
              color: AppColors.secondaryTextColor
            ),),
            content: Text('Are you sure you want to delete this schedule?',style: TextStyle(
              color: AppColors.secondaryTextColor
            ),),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('Cancel',style: TextStyle(
                  color: AppColors.secondaryColor
                ),),
              ),
              TextButton(
                onPressed: () {
                  // Perform the delete action here
                  // You can remove this schedule from the list
                  Navigator.of(context).pop(); // Close the dialog
                  // Show some confirmation or remove the item from the list if needed
                },
                child: Text('Delete',style: TextStyle(
                  color: Colors.redAccent
                ),),
              ),
            ],
          ),
        );
      },
      child: Card(
        color: AppColors.quaternaryColor,
        margin: EdgeInsets.all(8.0),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Image of the user (or any static image for now)
              CircleAvatar(
                backgroundImage: NetworkImage('https://images.news18.com/webstories/uploads/2024/10/httpswww.instagram.compC8wyF9CIBTKutm_sourceig_web_copy_linkigshMzRlODBiNWFlZA-96-2024-10-938e0b1942144b83714ed23636e54829.jpg'),
                radius: 30,
              ),
              SizedBox(width: 10),
              // Video schedule details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(schedule.title, style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.secondaryTextColor)),
                    SizedBox(height: 4),
                    Text('${schedule.date} - ${schedule.time}', style: TextStyle(color: AppColors.secondaryTextColor)),
                    SizedBox(height: 4),
                    Text('Location: ${schedule.location}', style: TextStyle(color: AppColors.secondaryTextColor)),
                  ],
                ),
              ),
              // Duration and status label
              Column(
                children: [
                  Text(schedule.duration, style: TextStyle(color: AppColors.secondaryTextColor)),
                  SizedBox(height: 4),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: schedule.status == 'Active' ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      schedule.status,
                      style: TextStyle(color: Colors.white),
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








