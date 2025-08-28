import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/app_list.dart';
import 'package:beast_connect/utils/text_font_style.dart';
import 'package:beast_connect/utils/ui_helper.dart';
import 'package:beast_connect/widget/buttons/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../widget/custom_eleveted_button.dart';
import '../widgets/custom_subscription_card.dart';

class MySubscriptionScreen extends StatelessWidget {
  const MySubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
            child: Column(
              children: [
                ///Appbar
                CustomAppBar(title: "Subscription Packages"),
                UIHelper.verticalSpace(20.h),

                ///Section : My Packages & All Packages
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Packages",
                      style: TextFontStyle.textStyle16WhiteInterw400,
                    ),
                    CustomElevetedButton(
                      onTap: () {},
                      isBorderColorUsed: true,
                      buttonTitle: "All Package",
                    ),
                  ],
                ),
                UIHelper.verticalSpace(32.h),

                ///Section : Current Package
                CustomSubscriptionCard(
                  isCurrentPlan: true,
                  isFreePlan: true,
                  planDetailsList: AppList.planDetailsList,
                  planPrice: 1.99,
                  planTitle: "BeastBasic",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
