import 'dart:async';
import 'package:flutter/material.dart';
import '../../../navigation.dart';
import '../../api/request/authentication/renew_access_token_request.dart';
import '../../appManager/local_storage_manager.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/icon/app_new_icon_1024x12024.png',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  checkLogin() {
    Timer(const Duration(seconds: 1), () {
      Future<RenewAccessTokenRequest?> data =
      LocalStorageManager.getAccessToken();
      data.timeout(const Duration(seconds: 5), onTimeout: () {
        throw ('Timeout');
      });
      data.then((value) {
        // print("getAccessTokenSSP");
        // print(value?.accessToken);
        setState(() {
          if (value?.accessToken != "") {
            Navigation.shared.toFirstMyHomePage(context);
            // print("getAccessTokenSSP");
            // Navigator.pushNamed(context, '/home');
          } else if (value?.accessToken == "" || value?.accessToken == null) {
            Navigation.shared.toLoginPage(context);
            // Navigator.pushNamed(context, '/login');
          } else {
            Navigation.shared.toLoginPage(context);
          }
        });
      });
    });
  }
}
