import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/asset_path.dart';
import 'package:beast_connect/utils/text_font_style.dart';
import 'package:beast_connect/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSubscriptionCard extends StatelessWidget {
  final bool isCurrentPlan;
  final bool isFreePlan;
  final String planTitle;
  final List planDetailsList;
  final double planPrice;

  const CustomSubscriptionCard({
    super.key,
    required this.isCurrentPlan,
    required this.isFreePlan,
    required this.planTitle,
    required this.planDetailsList,
    required this.planPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
        color: AppColors.boxContainerColor,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Section : Crown Icon & Current Plan
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///Section : Crown Icon
              Container(
                padding: EdgeInsets.all(13.sp),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  AppAssetPath.crownIcon,
                  width: 30.w,
                  height: 26.h,
                  fit: BoxFit.contain,
                ),
              ),

              ///Section : Current Plan
              isCurrentPlan
                  ? Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 11.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(24.r),
                      ),

                      child: Text(
                        "current plan",
                        style: TextFontStyle.textStyle10WhiteInterw400,
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
          UIHelper.verticalSpace(8.h),

          ///Section : Plan Title
          Text(planTitle, style: TextFontStyle.textStyle24WhiteInterw600),
          UIHelper.verticalSpace(14.h),

          ///Section Divider
          Divider(),
          UIHelper.verticalSpace(14.h),

          ///Ssection : Plan details
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: planDetailsList.length,
            separatorBuilder: (context, index) => UIHelper.verticalSpace(8.h),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Icon(Icons.done, color: Colors.white),
                  UIHelper.horizontalSpace(6.w),
                  Expanded(
                    child: Text(
                      "Early access to Join Unlimited Challenges.",
                      textAlign: TextAlign.start,
                      style: TextFontStyle.textStyle12WhiteInterw300,
                    ),
                  ),
                ],
              );
            },
          ),
          UIHelper.verticalSpace(14.h),

          ///Section : Plan Price
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: isFreePlan ? "Free" : "\$$planPrice",
                  style: TextFontStyle.textStyle24WhiteInterw500,
                ),
                if (!isFreePlan)
                  TextSpan(
                    text: " /monthly",
                    style: TextFontStyle.textStyle12WhiteInterw300,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
