import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/app_list.dart';
import 'package:beast_connect/utils/ui_helper.dart';
import 'package:beast_connect/widget/buttons/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                      onTap: () {},
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
