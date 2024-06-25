import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../navigation.dart';
import '../../api/request/authentication/device_token_request.dart';
import '../../api/service/authentication_service.dart';
import '../../appManager/local_storage_manager.dart';

class SessionExpiredDialog extends StatefulWidget {
  final String accessToken;
  final String deviceToken;

  const SessionExpiredDialog({Key? key, required this.accessToken, required this.deviceToken}) : super(key: key);

  @override
  State<SessionExpiredDialog> createState() => _SessionExpiredDialogState();
}

class _SessionExpiredDialogState extends State<SessionExpiredDialog> {
  @override
  initState() {
    super.initState();
  }

  onLogout() async {
    DeviceTokenRequest request = DeviceTokenRequest();

    request.deviceToken = widget.deviceToken.toString();
    request.accessToken = widget.accessToken.toString();

    LocalStorageManager.clearStorage();
    await AuthenticationService.postLogoutForExpiredToken(request).then((value) => {
      if (value.status == 200)
        {
          _handleLogout(),
        }
    });
  }

  void _handleLogout() async {
    Navigation.shared.toLoginPage(context);
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: mediaQuery.width,
        height: mediaQuery.height,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                'assets/icon/icon_pic_timeout.jpg',
                width: mediaQuery.width * 0.5,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                'Session Expired.'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              child: Text(
                'Please Log-in again to extend session.'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              width: mediaQuery.width * 0.5,
              height: 40,
              margin: EdgeInsets.only(top: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // <-- Radius
                  ),
                ),
                onPressed: () {
                  // _handleLogout();
                  onLogout();
                },
                child: Text(
                  'Login'.tr,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
