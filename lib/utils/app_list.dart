import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../views/screens/Profile/profile/model/profile_options_model.dart';
import '../views/screens/Profile/settings/settings_screen/model/settings_option_model.dart'
    show SettingsOptionModel;

class AppList {
  static String testText =
      "Lorem ipsum dolor sit amet consectetur. "
      "Ultrices id feugiat venenatis habitant mattis viverra elementum purus "
      "volutpat. Lacus eu molestie pulvinar rhoncus integer proin elementum. "
      "Pretium sit fringilla massa tristique aenean commodo leo. Aliquet viverra "
      "amet sit porta elementum et pellentesque posuere. Ullamcorper viverra tortor "
      "lobortis viverra auctor egestas. Nulla condimentum ac metus quam turpis gravida"
      "ut velit. Porta justo lacus consequat sed platea. Ut dui massa quam elit faucibus "
      "consectetur sapien aenean auctor. Felis ipsum amet justo in. Netus amet in"
      "egestas sed auctor lorem. Justo ullamcorper velit habitasse lorem eu arcu."
      "Non enim a elit urna eget nibh quisque donec condimentum. Elit ut pellentesque "
      "neque in quis at viverra. Nisl etiam tristique odio eget convallis.";

  static List<SettingsOptionModel> settingsOptionsList = [
    SettingsOptionModel(title: "Change Password", prefixIcon: Icons.lock),
    SettingsOptionModel(title: "Privacy policy", prefixIcon: Icons.bookmark),
    SettingsOptionModel(title: "Terms & conditions", prefixIcon: Icons.warning),
    SettingsOptionModel(title: "About us", prefixIcon: Icons.info),
    SettingsOptionModel(title: "Support", prefixIcon: FontAwesomeIcons.headset),
  ];

  static List<ProfileOptionsModel> profileOptionsList = [
    ProfileOptionsModel(
      prefixIcon: Icons.person,
      title: "Personal Information",
    ),
    ProfileOptionsModel(
      prefixIcon: Icons.video_library,
      title: "Video Schedule",
    ),
    ProfileOptionsModel(
      prefixIcon: Icons.favorite,
      title: "My Connection List",
    ),
    ProfileOptionsModel(
      prefixIcon: Icons.check_circle,
      title: "My Challenges List",
    ),
    ProfileOptionsModel(prefixIcon: Icons.event, title: "My Events List"),
    ProfileOptionsModel(
      prefixIcon: Icons.card_membership,
      title: "My Subscription",
    ),
    ProfileOptionsModel(prefixIcon: Icons.settings, title: "Settings"),
    ProfileOptionsModel(prefixIcon: Icons.exit_to_app, title: "Logout"),
  ];

  static List planDetailsList = [
    "Early access to Join Unlimited Challenges.",
    "Early access to Join Unlimited Challenges.",
    "Early access to Join Unlimited Challenges.",
    "Early access to Join Unlimited Challenges.",
    "Early access to Join Unlimited Challenges.",
    "Early access to Join Unlimited Challenges.",
    "Early access to Join Unlimited Challenges.",
    "Early access to Join Unlimited Challenges.",
    "Early access to Join Unlimited Challenges.",
    "Early access to Join Unlimited Challenges.",
    "Early access to Join Unlimited Challenges.",
    "Early access to Join Unlimited Challenges.",
  ];
}
