import 'package:beast_connect/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class NotificationScreen extends StatelessWidget {
  final List<String> notifications = List.generate(
    10,
        (index) => "It's a match! Ariyan liked your profile.\nYour profile is matched with Ariyan!",
  );

  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        centerTitle: true,
        title: Text('Notifications',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationItem(notification: notifications[index]);
        },
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String notification;

  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Badge(
              label: Text('1'),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.secondaryColor.withValues(alpha: 0.6),
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                Icons.notifications,
                  color: Colors.orangeAccent,
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                notification,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
