import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/ui_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_list.dart';
import '../../my_subscription/widgets/custom_subscription_card.dart';

class AllSubscriptionsPackagesScreen extends StatelessWidget {
  const AllSubscriptionsPackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: 15,
                  options: CarouselOptions(
                    height: 350.h,
                    aspectRatio: 16 / 16,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 800,
                    ),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {
                      // handle page change here
                      debugPrint("Page changed: $index, reason: $reason");
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                        return CustomSubscriptionCard(
                          isCurrentPlan: true,
                          isFreePlan: true,
                          planDetailsList: AppList.planDetailsList,
                          planPrice: 1.99,
                          planTitle: "BeastBasic",
                        );
                      },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
