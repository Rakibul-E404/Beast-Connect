import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../joinCallWidget.dart';
import '../nextEventWidget.dart';
import '../popularConnectionsWidget.dart';
import '../rankedUsersWidget.dart';
import '../sectionHeader.dart';
import '../user_post_section.dart';

class AllTagSection extends StatelessWidget {
  final double screenWidth;
  final controller; // Assuming this controller is already defined somewhere

  const AllTagSection({super.key, required this.screenWidth, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main scrollable content without filter buttons
        Padding(
          padding: const EdgeInsets.only(top: 60), // Leave space for filter buttons
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 20),
                ///
                /// todo::::::::::::::::::::::::::::: [Popular Connections Section] ::::::::::::::::::::::::::::::::::::::::
                ///
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.quaternaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          buildSectionHeader('Popular Connections'),
                          SizedBox(height: 10),
                          PopularConnectionsWidget(
                            popularConnections: controller.popularConnections,
                            screenWidth: screenWidth,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ///
                /// todo::::::::::::::::::::::::::::: [Join next event Section] ::::::::::::::::::::::::::::::::::::::::
                ///
                buildSectionHeader('Join Your Next Event'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.8,
                        child: JoinNextEventWidget(screenWidth: screenWidth * 0.8),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: screenWidth * 0.8,
                        child: JoinNextEventWidget(screenWidth: screenWidth * 0.8),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ///
                /// todo::::::::::::::::::::::::::::: [join call Section] ::::::::::::::::::::::::::::::::::::::::
                ///
                buildSectionHeader('Join A Call'),
                JoinCallWidget(),
                const SizedBox(height: 20),
                ///
                /// todo::::::::::::::::::::::::::::: [Ranked Section] ::::::::::::::::::::::::::::::::::::::::
                ///
                RankedUsersWidget(
                  rankedUsers: controller.rankedUsers,
                  screenWidth: screenWidth,
                ),

                const SizedBox(height: 20),

                ///
                /// todo::::::::::::::::::::::::::::: [User Post Section] ::::::::::::::::::::::::::::::::::::::::
                ///
                UserPostSection(),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
