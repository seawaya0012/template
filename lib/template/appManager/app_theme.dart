import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme {

  static final typATheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xff301E67),
    secondaryHeaderColor: Color(0xff3D3B93),
    selectedRowColor: Color(0xff301E67),
    unselectedWidgetColor: Color(0xff301E67).withOpacity(.5),
    backgroundColor: Color(0xFFD9E2E6),
    scaffoldBackgroundColor: Colors.white,
    hoverColor: Color(0xff301E67),
    focusColor: Color(0xff301E67),
    toggleableActiveColor: Color(0xff301E67),
    dividerColor: Color(0xff301E67),
    splashColor: Color(0xff301E67),
    highlightColor: Color(0xff301E67),
    indicatorColor: Color(0xff301E67),
    cardColor: Color(0xffF9F9F9).withOpacity(0.8),
    canvasColor: Color(0xFFD9E2E6),
    dialogBackgroundColor: Color(0xFFD9E2E6),
    errorColor: Colors.redAccent,
    // colorScheme: ColorScheme.light(brightness: Brightness.light),
    colorScheme: ColorScheme.light().copyWith(primary: Color(0xff301E67)),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff301E67),
    ),
  );

  static final typBTheme  = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xff628E90),
    secondaryHeaderColor: Color(0xffF5EFE6),
    selectedRowColor: Color(0xff628E90),
    unselectedWidgetColor: Color(0xff628E90).withOpacity(.5),
    backgroundColor: Color(0xFFD9E2E6),
    scaffoldBackgroundColor: Colors.white,
    hoverColor: Color(0xff628E90),
    focusColor: Color(0xff628E90),
    toggleableActiveColor: Color(0xff628E90),
    dividerColor: Color(0xff628E90),
    splashColor: Color(0xff628E90),
    highlightColor: Color(0xff628E90),
    indicatorColor: Color(0xff628E90),
    cardColor: Color(0xffF9F9F9).withOpacity(0.8),
    canvasColor: Color(0xFFD9E2E6),
    dialogBackgroundColor: Color(0xFFD9E2E6),
    errorColor: Colors.redAccent,
    // colorScheme: ColorScheme.light(brightness: Brightness.light),
    colorScheme: ColorScheme.light().copyWith(primary: Color(0xff628E90)),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff628E90),
    ),
  );

  static final typCTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xff8E5D4C),
    secondaryHeaderColor: Color(0xffF6F3E2),
    selectedRowColor: Color(0xff8E5D4C),
    unselectedWidgetColor: Color(0xff8E5D4C).withOpacity(.5),
    backgroundColor: Color(0xff8E5D4C),
    scaffoldBackgroundColor: Colors.white,
    hoverColor: Color(0xff8E5D4C),
    focusColor: Color(0xff8E5D4C),
    toggleableActiveColor: Color(0xff8E5D4C),
    dividerColor: Color(0xff8E5D4C),
    splashColor: Color(0xff8E5D4C),
    highlightColor: Color(0xff8E5D4C),
    indicatorColor: Color(0xff8E5D4C),
    cardColor: Color(0xffF9F9F9).withOpacity(0.8),
    canvasColor: Color(0xF2D9E2E6),
    dialogBackgroundColor: Color(0xF2D9E2E6),
    errorColor: Colors.redAccent,
    // colorScheme: ColorScheme.light(brightness: Brightness.light),
    colorScheme: ColorScheme.light().copyWith(primary: Color(0xff8E5D4C)),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff8E5D4C),
    ),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xff083E5E),
    secondaryHeaderColor: Color(0xff083E5E),
    selectedRowColor: Color(0xff083E5E),
    unselectedWidgetColor: Color(0xff083E5E).withOpacity(.5),
    backgroundColor: Color(0xFFD9E2E6),
    scaffoldBackgroundColor: Colors.white,
    hoverColor: Color(0xff083E5E),
    focusColor: Color(0xff083E5E),
    toggleableActiveColor: Color(0xff083E5E),
    dividerColor: Color(0xff083E5E),
    splashColor: Color(0xff038DC9),
    highlightColor: Color(0xff038DC9),
    indicatorColor: Color(0xff083E5E),
    cardColor: Color(0xffF9F9F9).withOpacity(0.8),
    canvasColor: Color(0xFFD9E2E6),
    dialogBackgroundColor: Color(0xFFD9E2E6),
    errorColor: Colors.redAccent,
    // colorScheme: ColorScheme.light(brightness: Brightness.light),
    colorScheme: ColorScheme.light().copyWith(primary: Color(0xff083E5E)),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff083E5E),
    ),
  );
}

class ThemeProvider extends ChangeNotifier {
  String currentTheme = 'light';

  ThemeMode get themeMode {
    // if (currentTheme == 'light') {
      return ThemeMode.light;
    // }
    // else if (currentTheme == 'dark') {
    //   return ThemeMode.dark;
    // }
    // else {
    //   return ThemeMode.system;
    // }
  }

  Future<bool> get isDarkMode async {
    return false;
  }

  changeTheme(String theme) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    await _prefs.setString('theme', theme);

    currentTheme = theme;
    notifyListeners();
  }

  Color hexToColor(String code) {
    String colorCode = '';
    colorCode = code;
    if (code.length != 7) {
      colorCode = "#FFFFFF";
    }
    print('codessss');
    print(code);
    return new Color(
            int.parse(colorCode.substring(1, 7), radix: 16) + 0xFF000000) ??
        Color.fromARGB(1, 0, 0, 0);
  }

  initialize() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    currentTheme = _prefs.getString('theme') ?? 'system';
    notifyListeners();
  }

  Future<ThemeData> getCustomTheme() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var currentTheme = _prefs.getString('theme') ?? 'system';
    ThemeData customTheme = ThemeData();
    print('currentThemecurrentThemes# $currentTheme ');
      if (currentTheme == 'TypeA'){
        customTheme = AppTheme.typATheme;
      }else if(currentTheme == 'TypeB'){
        customTheme = AppTheme.typBTheme;
      }else if(currentTheme == 'TypeC'){
        customTheme = AppTheme.typCTheme;
      }else{
        customTheme = AppTheme.lightTheme;
      }
      return customTheme;
  }
}
