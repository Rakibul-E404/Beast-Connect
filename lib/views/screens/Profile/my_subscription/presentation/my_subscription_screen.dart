import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/ui_helper.dart';
import 'package:beast_connect/widget/buttons/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySubscriptionScreen extends StatelessWidget {
  const MySubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Appbar
            CustomAppBar(title: "Subscription Packages"),
            UIHelper.verticalSpace(24.h),

            ///Section : Current Package
            Container(
              padding: EdgeInsets.all(24.sp),
              decoration: BoxDecoration(
                color: AppColors.boxContainerColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  ///Plan Icon
                  ///Plan Status
                  ///Plan Type
                  ///Plan Details
                  ///Plan Price
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
