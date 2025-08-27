import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../views/screens/Profile/settings/settings_screen/model/settings_option_model.dart'
    show SettingsOptionModel;

class AppList {
  static List<SettingsOptionModel> settingsOptionsList = [
    SettingsOptionModel(title: "Change Password", prefixIcon: Icons.lock),
    SettingsOptionModel(title: "Privacy policy", prefixIcon: Icons.bookmark),
    SettingsOptionModel(title: "Terms & conditions", prefixIcon: Icons.warning),
    SettingsOptionModel(title: "About us", prefixIcon: Icons.info),
    SettingsOptionModel(title: "Support", prefixIcon: FontAwesomeIcons.headset),
  ];
}
