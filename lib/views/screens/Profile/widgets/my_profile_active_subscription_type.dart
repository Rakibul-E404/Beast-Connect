import 'package:beast_connect/utils/text_font_style.dart';
import 'package:beast_connect/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/app_colors.dart';

class MyProfileActiveSubscriptionType extends StatelessWidget {
  final Icon planIcon;
  final String planTitle;
  final String planDuration;
  final double planCoin;
  const MyProfileActiveSubscriptionType({
    super.key,
    required this.planIcon,
    required this.planTitle,
    required this.planDuration,
    required this.planCoin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,

        border: Border.all(color: AppColors.primaryColor, width: 2.sp),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Section : Plan Icon
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),

            child: planIcon,
          ),
          UIHelper.horizontalSpace(12.w),

          ///-------------- BeastPlus text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(planTitle, style: TextFontStyle.textStyle18WhiteInterw700),
              SizedBox(height: 8),

              ///------------- Months text-----------------
              Text(
                planDuration,
                style: TextFontStyle.textStyle14WhiteInterw400,
              ),
            ],
          ),
          Spacer(),

          /// ----------My Subscription Coins------------------
          Container(
            width: 84.w,
            height: 27.h,
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///Section : Coin's Icon
                Icon(FontAwesomeIcons.coins, color: Colors.white, size: 16.sp),
                UIHelper.horizontalSpace(6.w),

                ///Section : Coins
                Text(
                  planCoin.toStringAsFixed(0),
                  style: TextFontStyle.textStyle10WhiteInterw400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
