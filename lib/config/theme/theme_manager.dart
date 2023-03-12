import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService with ChangeNotifier {
  // SharedPreferences? sharedPreferences;

  static String themeKey = "key";

  late bool? darkTheme;
  ThemeService() {
    darkTheme = true;
  }

  // initSetup() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  // }

  // getSharedPre() async {
  //   darkTheme = sharedPreferences!.getBool(themeKey);
  // }

  // saveSharedPre() async {
  //   await initSetup();
  //   darkTheme = await sharedPreferences!.setBool(themeKey, darkTheme!);
  // }

  toggleTheme() {
    darkTheme = !darkTheme!;
    notifyListeners();
    // saveSharedPre();
  }
}
