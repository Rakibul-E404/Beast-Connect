import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/asset_path.dart';
import '../../../widget/font/customAppFontStyle.dart';

class PublicUserLeaderboard extends StatefulWidget {
  const PublicUserLeaderboard({super.key});

  @override
  _PublicUserLeaderboardState createState() => _PublicUserLeaderboardState();
}

class _PublicUserLeaderboardState extends State<PublicUserLeaderboard> {
  final List<Map<String, String>> leaderboard = [
    {
      "rank": "01",
      "name": "Ariyaan",
      "activity": "Push Up",
      "date": "10-5-2025",
      "coins": "40",
    },
    {
      "rank": "02",
      "name": "Ariyaan",
      "activity": "Push Up",
      "date": "10-5-2025",
      "coins": "40",
    },
    {
      "rank": "03",
      "name": "Ariyaan",
      "activity": "Push Up",
      "date": "10-5-2025",
      "coins": "40",
    },
    {
      "rank": "04",
      "name": "Ariyaan",
      "activity": "Push Up",
      "date": "10-5-2025",
      "coins": "40",
    },
    {
      "rank": "05",
      "name": "Ariyaan",
      "activity": "Push Up",
      "date": "10-5-2025",
      "coins": "40",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryIconColor),
        ),
        title: Text('Leaderboard', style: TextStyle(color: AppColors.secondaryTextColor)),
        // backgroundColor: AppColors.tertiaryColor,
        backgroundColor: AppColors.tertiaryColor,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: AppColors.tertiaryColor),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Rankings Section
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.tertiaryColor,
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Top ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Rankings',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.leaderboard,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Image.asset('assets/image/leaderBoard.png'),

              SizedBox(height: 20),

              ///
              ///::::::::::::::::::::::::::: Leaderboard List :::::::::::::::::::::::::::::
              ///
              Expanded(
                child: ListView.builder(
                  itemCount: leaderboard.length,
                  itemBuilder: (context, index) {
                    final rank = leaderboard[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: AppColors.quaternaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Text(
                            rank['rank']!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/avatar.png'),
                            radius: 20,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                rank['name']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                rank['activity']!,
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                rank['coins']! + ' coins',
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                rank['date']!,
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
