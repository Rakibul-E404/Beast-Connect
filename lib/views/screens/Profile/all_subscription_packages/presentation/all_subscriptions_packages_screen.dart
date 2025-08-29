import 'dart:developer';

import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/ui_helper.dart';
import 'package:beast_connect/widget/buttons/custom_app_bar.dart';
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
                ///Section : Appbar
                CustomAppBar(title: "All Packages"),
                UIHelper.verticalSpace(24.h),

                ///Section : Beast PlanAll Packages
                CarouselSlider.builder(
                  itemCount: 15,
                  options: CarouselOptions(
                    height: 0.62.sh,
                    // aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
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
                          onTap: () {
                            log(
                              "Current All Packages Index : ___${itemIndex}______",
                            );
                          },
                          isCurrentPlan: itemIndex == 0 ? true : false,
                          isFreePlan: itemIndex == 0 ? true : false,
                          buttonTitle: itemIndex == 0
                              ? "Upgrade"
                              : "Proceed Now",
                          planTitle: "BeastBasic",
                          planDetailsList: AppList.planDetailsList,
                          planPrice: 1.99,
                          coins: itemIndex == 0 ? 300 : itemIndex * 300,
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
