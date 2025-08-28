import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/app_list.dart';
import 'package:beast_connect/utils/ui_helper.dart';
import 'package:beast_connect/views/screens/Profile/settings/change_password/presentation/change_password_screen.dart';
import 'package:beast_connect/widget/buttons/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../about_us/presentation/about_us_screen.dart';
import '../../privacy_policy/presentation/privacy_policy_screen.dart';
import '../../support/presentation/support_screen.dart';
import '../../terms_and_conditions/presentation/terms_and_conditions_screen.dart';
import '../widgets/settings_option.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                ///AppBar
                CustomAppBar(title: "Settings"),
                UIHelper.verticalSpace(20.h),

                ///Settings Options
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: AppList.settingsOptionsList.length,
                  separatorBuilder: (context, index) =>
                      UIHelper.verticalSpace(12.h),

                  itemBuilder: (cosntext, index) {
                    var data = AppList.settingsOptionsList[index];
                    return CustomMenuButton(
                      onTap: () {
                        index == 0
                            ? Get.to(() => ChangePasswordScreen())
                            : index == 1
                            ? Get.to(() => PrivacyPolicyScreen())
                            : index == 2
                            ? Get.to(() => TermsAndConditionsScreen())
                            : index == 3
                            ? Get.to(() => AboutUsScreen())
                            : index == 4
                            ? Get.to(() => SupportScreen())
                            : null;
                      },
                      icon: data.prefixIcon,
                      label: data.title,
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
