import 'dart:async';
import 'dart:isolate';
import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:oneplatformtemplate/template/api/request/authentication/renew_access_token_request.dart';
import 'package:oneplatformtemplate/template/appManager/app_theme.dart';
import 'package:oneplatformtemplate/template/appManager/local_storage_manager.dart';
import 'package:oneplatformtemplate/template/appManager/locale_string.dart';
import 'package:oneplatformtemplate/template/page/splashscreen/splash_screen_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'navigation.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded<Future<void>>(() async {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    runApp(
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider()..initialize(),
        child: MyApp(
          // initialLink: initialLink,
        ),
      ),
    );
  },
          (error, stack) =>{}
  );
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key, }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale locale = Locale('en', 'US');
  String fontSizeAndLanguageCode = '';
  String darkModeStage = '';
  ThemeData customTheme = ThemeData();

  @override
  void initState() {
    super.initState();
    getCustomTheme();
    getToken();
    setLocale();
  }


  setLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString('language_code');
    final String? countryCode = prefs.getString('country_code');
    print("languageCode.toString()");
    print(languageCode.toString() + "_" + countryCode.toString());
    setState(() {
      if (languageCode != null && countryCode != null) {
        this.locale = Locale(languageCode.toString(), countryCode.toString());
        print(languageCode.toString() + "_" + countryCode.toString());
      } else {
        this.locale = Locale('th', 'TH');
        prefs.setString('language_code', 'th');
        prefs.setString('country_code', 'TH');
      }
      Get.updateLocale(locale);
      setFontSize();
    });
  }

  String? fcmToken;
  getToken() async {
    fcmToken = await FirebaseMessaging.instance.getToken();
    print("FCMTOKEN:$fcmToken");
  }

  setFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    final String? fontSize = prefs.getString('font_size');
    if (fontSize == null) {
      prefs.setString('font_size', '1.0');
      prefs.setString('font_size_val', '1');
    }
    getFontAndLanguage();
  }

  getFontAndLanguage() async {
    await LocalStorageManager.getFontAndLanguage().then((value) => {
      setState(() {
        fontSizeAndLanguageCode = value;
        print("fontSizeAndLanguageCode");
        print(fontSizeAndLanguageCode);
      }),
      getCheckDarkMode(),
    });
  }

  getCheckDarkMode() async {
    ThemeProvider().isDarkMode.then((value) => {
      setState(() {
        if (value) {
          darkModeStage = '&app_theme=dark';
        } else {
          darkModeStage = '&app_theme=light';
        }
      })
    });
    var bisbgColor = ThemeProvider().hexToColor('code');
    print(bisbgColor);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return WillPopScope(
          onWillPop: () async {
            if (Navigator.of(context).userGestureInProgress)
              return false;
            else
              return true;
          },
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            locale: locale,
            translations: LocaleString(),
            navigatorKey: GlobalVariable.navState,
            title: 'One Centric',
            theme: customTheme,
            // darkTheme: AppTheme.darkTheme,
            themeMode: provider.themeMode,
            home: const MySplashScreen(), //LoginPage / MyHomePageป
            // routes: {
            //   '/': (context) => MySplashScreen(),
            //   '/home': (context) => MyHomePage(),
            //   '/login': (context) => LoginPage(),
            // },
          ),
        );
      },
    );
  }

  checkLogin() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Future<RenewAccessTokenRequest?> data =
      LocalStorageManager.getAccessToken();
      data.timeout(const Duration(seconds: 5), onTimeout: () {
        Navigation.shared.toLoginPage(context);
        throw ('Timeout');
      });
      data.then((value) {
        // print("getAccessTokenSSP");
        print(value?.accessToken);
        setState(() {
          if (value?.accessToken != "") {
            Navigation.shared.toMyHomePage(context);
            // Navigator.pushNamed(context, '/home');
            // Navigator.pushReplacement(
            //     context, MaterialPageRoute(builder: (context) => MyHomePage()));
          } else if (value?.accessToken == "" || value?.accessToken == null) {
            Navigation.shared.toLoginPage(context);
            // Navigator.pushNamed(context, '/login');
            // Navigator.pushReplacement(
            //     context, MaterialPageRoute(builder: (context) => LoginPage()));
          } else {
            Navigation.shared.toLoginPage(context);
          }
        });
      });
    });
  }

  getCustomTheme() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var currentTheme = _prefs.getString('theme') ?? 'system';
    print('currentThemecurrentThemes# $currentTheme ');
    if (currentTheme == 'TypeA'){
      setState(() => customTheme = AppTheme.typATheme);
    }else if(currentTheme == 'TypeB'){
      setState(() => customTheme = AppTheme.typBTheme);
    }else if(currentTheme == 'TypeC'){
      setState(() => customTheme = AppTheme.typCTheme);
    }else{
      setState(() => customTheme = AppTheme.typATheme);
    }
  }
}

class GlobalVariable {
  /// This global key is used in material app for navigation through firebase notifications.
  /// [navState] usage can be found in [notification_notifier.dart] file.
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
}
