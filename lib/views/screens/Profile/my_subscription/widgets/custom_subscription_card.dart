import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/asset_path.dart';
import 'package:beast_connect/utils/text_font_style.dart';
import 'package:beast_connect/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../widget/custom_gradient_button.dart';
import '../controller/custom_subscription_card_controller.dart';

class CustomSubscriptionCard extends StatelessWidget {
  final bool isCurrentPlan;
  final bool isFreePlan;
  final String planTitle;
  final List planDetailsList;
  final double planPrice;
  final String? buttonTitle;
  final double coins;
  final void Function()? onTap;

  const CustomSubscriptionCard({
    super.key,
    required this.isCurrentPlan,
    required this.isFreePlan,
    required this.planTitle,
    required this.planDetailsList,
    required this.planPrice,
    this.onTap,
    this.buttonTitle,
    required this.coins,
  });

  @override
  Widget build(BuildContext context) {
    // Controller specific to this card
    Get.create(() => SubscriptionCardController());
    final controller = Get.find<SubscriptionCardController>();

    return Container(
      width: 1.sw,
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
        color: AppColors.boxContainerColor,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: SingleChildScrollView(
        // Make the entire card scrollable
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Crown Icon & Current Plan
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

                ///Section : Show Current Plan tag
                if (isCurrentPlan)
                  Container(
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
                  ),
              ],
            ),
            UIHelper.verticalSpace(8.h),

            /// Section : Plan Title && Coins
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Section : Plan Title
                Text(planTitle, style: TextFontStyle.textStyle24WhiteInterw600),

                ///Section : Plan's Coin
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///Section : Coin's Icon
                    Icon(
                      FontAwesomeIcons.coins,
                      color: Colors.orange,
                      size: 16.sp,
                    ),
                    UIHelper.horizontalSpace(6.w),

                    ///Section : Coins
                    Text(
                      coins.toStringAsFixed(0),
                      style: TextFontStyle.textStyle10WhiteInterw400,
                    ),
                  ],
                ),
              ],
            ),
            UIHelper.verticalSpace(14.h),

            /// Section : Divider
            const Divider(),
            UIHelper.verticalSpace(14.h),

            /// Section : Plan Details (scrollable if needed)
            Obx(() {
              final itemsToShow = controller.showAll.value
                  ? planDetailsList
                  : planDetailsList
                        .take(
                          controller.getSafeInitialCount(
                            planDetailsList.length,
                          ),
                        )
                        .toList();

              return Column(
                children: List.generate(
                  itemsToShow.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Row(
                      children: [
                        const Icon(Icons.done, color: Colors.white),
                        UIHelper.horizontalSpace(6.w),
                        Expanded(
                          child: Text(
                            itemsToShow[index],
                            style: TextFontStyle.textStyle12WhiteInterw300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),

            /// Section : Show More / Show Less Button
            if (planDetailsList.length >
                controller.getSafeInitialCount(planDetailsList.length))
              TextButton(
                onPressed: controller.toggleShowAll,
                child: Obx(
                  () => Text(
                    controller.showAll.value ? "Show Less" : "Show More",
                    style: TextFontStyle.textStyle12WhiteInterw300.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),

            UIHelper.verticalSpace(14.h),

            /// Section : Plan Price
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: isFreePlan ? "Free" : "\$${planPrice}",
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
            UIHelper.verticalSpace(40.h),

            /// Section : Update Button
            CustomGradientButton(
              onTap: onTap,
              buttonTitle: buttonTitle ?? "",
              minHeight: 30.h,
              verticalPadding: 6.h,
              textStyle: TextFontStyle.textStyle10WhiteInterw400.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
