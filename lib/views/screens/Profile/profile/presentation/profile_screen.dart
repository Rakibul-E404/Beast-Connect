import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/controller/personal_profile_controller.dart';
import 'package:beast_connect/utils/app_list.dart';
import 'package:beast_connect/utils/text_font_style.dart';
import 'package:beast_connect/utils/ui_helper.dart';
import 'package:beast_connect/views/screens/Profile/my_subscription/presentation/my_subscription_screen.dart';
import 'package:beast_connect/views/screens/Profile/settings/settings_screen/presentation/settings_screen.dart';
import 'package:beast_connect/views/screens/Profile/profile/widgets/my_profile_active_subscription_type.dart';
import 'package:beast_connect/views/screens/Profile/profile/widgets/profile_menue_option.dart';
import 'package:beast_connect/widget/buttons/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PersonalProfileController(
      context,
      imagePath: 'assets/image/userImage.png',
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///Appbar
                CustomAppBar(title: "Profile"),
                UIHelper.verticalSpace(22.h),

                // Profile image with square frame and rounded corners
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),

                    border: Border.all(color: Colors.orange, width: 0.5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),

                    child: Image.asset(
                      controller.imagePath,

                      height: 100.h,
                      width: 100.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(12.h),

                // User name
                Text(
                  'Afsana Hamid',
                  style: TextFontStyle.textStyle18WhiteInterw500,
                ),
                UIHelper.verticalSpace(20.h),

                ///Section : Profile Active Plan
                MyProfileActiveSubscriptionType(
                  planIcon: Icon(
                    FontAwesomeIcons.crown,
                    color: Colors.white,
                    size: 18,
                  ),
                  planTitle: "BeastPlus",
                  planDuration: "Months",
                  planCoin: 1000,
                ),
                UIHelper.verticalSpace(20.h),

                ///Section : Menu Options
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: AppList.profileOptionsList.length,
                  separatorBuilder: (context, index) =>
                      UIHelper.verticalSpace(16.h),
                  itemBuilder: (context, index) {
                    var data = AppList.profileOptionsList[index];
                    return ProfileMenueOption(
                      buttonTitle: data.title,
                      prefixIcon: data.prefixIcon,
                      onTap: () {
                        index == 0
                            ? Get.to(() => SettingsScreen())
                            : index == 1
                            ? Get.to(() => SettingsScreen())
                            : index == 2
                            ? Get.to(() => SettingsScreen())
                            : index == 3
                            ? Get.to(() => SettingsScreen())
                            : index == 4
                            ? Get.to(() => SettingsScreen())
                            : index == 5
                            ? Get.to(() => MySubscriptionScreen())
                            : index == 6
                            ? Get.to(() => SettingsScreen())
                            : index == 7
                            ? Get.to(() => SettingsScreen())
                            : null;
                      },
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
