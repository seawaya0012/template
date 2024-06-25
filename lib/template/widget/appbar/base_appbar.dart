import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import '../../appManager/app_theme.dart';

class BaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String appbarTitle;

  const BaseAppBar({Key? key, required this.appbarTitle}) : super(key: key);

  @override
  State<BaseAppBar> createState() => _BaseAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BaseAppBarState extends State<BaseAppBar> {
  bool isDarkMode = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      systemOverlayStyle: Platform.isIOS
          ? SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: isDarkMode
                  ? Brightness.dark
                  : Brightness.light, // For Android (dark icons)
              statusBarBrightness: isDarkMode
                  ? Brightness.dark
                  : Brightness.light, // F // For iOS (dark icons)
            )
          : SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: isDarkMode
                  ? Brightness.light
                  : Brightness.dark, // For Android (dark icons)
              statusBarBrightness: isDarkMode
                  ? Brightness.light
                  : Brightness.dark, // F // For iOS (dark icons)
            ),
      title: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Text(
          // textAlign: TextAlign.center,
          widget.appbarTitle,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      // flexibleSpace: Container(
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //       colors: [Color(0xff083E5E), Color(0xff107DBC)],
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //     ),
      //   ),
      // ),
    );
  }

  checkThemeMode() async {
    ThemeProvider().isDarkMode.then((value) => {
          setState(() {
            isDarkMode = value;
          })
        });
  }
}
