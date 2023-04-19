import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rive_animation/utils/CPColors.dart';

part 'AppStore.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  bool isDarkModeOn = false;

  bool isHover = false;

  Color? iconColor;

  Color? backgroundColor;

  Color? appBarColor;

  Color? scaffoldBackground;

  Color? backgroundSecondaryColor;

  Color? appColorPrimaryLightColor;

  Color? iconSecondaryColor;

  Color? textPrimaryColor;

  Color? textSecondaryColor;

  Future<void> toggleDarkMode({bool? value}) async {
    isDarkModeOn = value ?? !isDarkModeOn;

    if (isDarkModeOn) {
      scaffoldBackground = appBackgroundColorDark;

      appBarColor = cardBackgroundBlackDark;
      backgroundColor = Colors.white;
      backgroundSecondaryColor = Colors.white;
      appColorPrimaryLightColor = cardBackgroundBlackDark;

      iconColor = iconColorPrimary;
      iconSecondaryColor = iconColorSecondary;

      textPrimaryColor = whiteColor;
      textSecondaryColor = Colors.white54;

      textPrimaryColorGlobal = whiteColor;
      textSecondaryColorGlobal = Colors.white54;
      shadowColorGlobal = appShadowColorDark;
    } else {
      scaffoldBackground = scaffoldLightColor;

      appBarColor = Colors.white;
      backgroundColor = Colors.black;
      backgroundSecondaryColor = appSecondaryBackgroundColor;
      appColorPrimaryLightColor = appColorPrimaryLight;

      iconColor = iconColorPrimaryDark;
      iconSecondaryColor = iconColorSecondaryDark;

      textPrimaryColor = appTextColorPrimary;
      textSecondaryColor = appTextColorSecondary;

      textPrimaryColorGlobal = appTextColorPrimary;
      textSecondaryColorGlobal = appTextColorSecondary;
      shadowColorGlobal = appShadowColor;
    }
    setStatusBarColor(scaffoldBackground!);

    setValue('isDarkModeOnPref', isDarkModeOn);
  }

  void toggleHover({bool value = false}) => isHover = value;
}
