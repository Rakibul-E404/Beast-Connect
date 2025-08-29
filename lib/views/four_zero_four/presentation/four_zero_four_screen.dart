import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/utils/asset_path.dart';
import 'package:beast_connect/utils/text_font_style.dart';
import 'package:beast_connect/utils/ui_helper.dart';
import 'package:beast_connect/widget/my_custom_eleveted_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FourZeroFourScreen extends StatelessWidget {
  const FourZeroFourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UIHelper.verticalSpace(0.1.sh),

                ///Section : 404 Not found image
                Image.asset(
                  AppAssetPath.fourZeroFourImage,
                  height: 250.h,
                  width: 250.w,
                  fit: BoxFit.cover,
                ),
                UIHelper.verticalSpace(98.h),

                ///Section : Text -> Oop's
                Text(
                  "Oops!",
                  textAlign: TextAlign.center,
                  style: TextFontStyle.textStyle20WhiteInterw600,
                ),
                UIHelper.verticalSpace(16.h),

                ///Section : Text -> The page you were looking for can’t be found.
                Text(
                  "The page you were looking for can’t be found.",
                  textAlign: TextAlign.center,
                  style: TextFontStyle.textStyle12WhiteInterw300,
                ),
                UIHelper.verticalSpace(32.h),

                ///Section : Button -> back to home page
                MyCustomElevetedButton(
                  onTap: () {},
                  isButtonColorUsed: true,
                  verticalPadding: 18,
                  buttonTitle: "Back to home page",
                  textStyle: TextFontStyle.textStyle16WhiteInterw500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
