import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../main.dart';
import '../../../../navigation.dart';
import '../../../api/api_manager.dart';
import '../../../api/model/consent/consent_app_model.dart';
import '../../../api/request/authentication/device_token_request.dart';
import '../../../api/service/authentication_service.dart';
import '../../../api/service/consent_service.dart';
import '../../../appManager/local_storage_manager.dart';
import '../../../widget/alertpopupDialog/base_confirm_alert_dialog.dart';
import '../../../widget/background_screen/background_color_screen.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key, required VoidCallback callBackFunc})
      : super(key: key);
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? localeText = '';
  String? currentVersion = '';
  String? version = '';
  String url = '';


  bool isLoading = false;

  ConsentAppModel dataConsent = ConsentAppModel();

  @override
  void initState() {
    super.initState();
    refreshUI();
    getDataConsentOnePlatform();
  }

  refreshUI() {
    setLocale();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: const Text('Setting')
      ),
      body: Stack(
        children: [
          const BackgroundColorScreen(haveNavigationBar: true,haveMainApp: false,),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))),
              child: SettingsList(
                lightTheme: SettingsThemeData(
                  tileHighlightColor:  Theme.of(context).cardColor,
                  settingsListBackground: Colors.transparent,
                  settingsSectionBackground: Colors.white.withOpacity(0.8),
                  dividerColor: Colors.transparent,
                ),
                darkTheme: SettingsThemeData(
                  tileHighlightColor:  Theme.of(context).cardColor,
                  settingsListBackground: Colors.transparent,
                  settingsSectionBackground: Colors.white.withOpacity(0.8),
                  dividerColor: Colors.transparent,
                ),
                sections: [
                  //personal information
                  SettingsSection(
                    title: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Personal Information'.tr,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )),
                    tiles: [
                      SettingsTile.navigation(
                        key: const ValueKey('manageAccount'),
                        leading: Image.asset(
                          'assets/icon/icon_manage_account.png',
                          scale: 22,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text('Manage Account'.tr)),
                        onPressed: (context) async {
                          await LocalStorageManager.getIsLockBiz().then((value) => {
                            setState(() {
                              if(value == false){
                                LocalStorageManager.clearBusinessId();
                                LocalStorageManager.clearDefaultAccount();
                                Navigation.shared.toEditProfilePage(context, () {
                                });
                              } else{
                                LocalStorageManager.clearDefaultAccount();
                                Navigation.shared.toEditProfilePage(context, () {
                                });
                              }
                            })
                          });

                        },
                      ),
                    ],
                  ),
                  //General
                  SettingsSection(
                    title: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'General'.tr,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )),
                    tiles: <SettingsTile>[
                      SettingsTile.navigation(
                        //leading: Icon(Icons.language),
                        leading: Image.asset(
                          'assets/icon/icon_language.png',
                          scale: 22,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text('Language'.tr)),
                        // value: Text(localeText?.tr ?? ""),
                        onPressed: (context) {
                          Navigation.shared.toLanguagePage(context, () {
                            setLocale();
                          });
                        },
                      ),
                      SettingsTile.navigation(
                        leading: Image.asset(
                          'assets/icon/icon_theme.png',
                          scale: 22,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text('Theme'.tr)),
                        onPressed: (context) {
                          Navigation.shared.toThemePage(context, () {
                            refreshUI();
                          });
                        },
                      ),
                      SettingsTile.navigation(
                        leading: Icon(
                          Icons.font_download_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text('Font Size'.tr)),
                        onPressed: (context) {
                          Navigation.shared.toFontPage(context);
                        },
                      ),
                    ],
                  ),
                  SettingsSection(
                    tiles: [
                      SettingsTile(
                        // leading: Icon(Icons.logout),
                        leading: Image.asset(
                          'assets/icon/icon_logout.png',
                          scale: 22,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Sign Out'.tr,
                            // textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: (context) {
                          showAlertLogOutDialog(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  setLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString('language_code');
    setState(() {
      if (languageCode == 'th') {
        localeText = "THAI";
      } else {
        localeText = "ENGLISH";
      }
    });
  }

  void showAlertLogOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => BaseConfirmAlertDialog(
        title: '${'You want to log out'.tr} ?',
        mainContext: context,
        callbackFunc: () {
          onLogout();
        },
        alertImage: 'assets/icon/icon_error.png',
        description: '',
      ),
    );
  }

  onLogout() async {
    DeviceTokenRequest request = DeviceTokenRequest();
    // request.deviceToken = await FirebaseMessaging.instance.getToken() ?? "";
    await LocalStorageManager.getAccessToken()
        .then((value) => request.accessToken = value?.accessToken ?? '');
    await AuthenticationService.postAccountLogout(request).then((value) => {
      if (value.status == 200)
        {
          _handleLogout(),
        }
    });
  }

  void _handleLogout() async {
    LocalStorageManager.clearStorage();
    Navigation.shared.toLoginPage(context);
    final prefs = await SharedPreferences.getInstance();
    final String? currentTheme = prefs.getString('theme');
    prefs.clear();
    prefs.setString('theme',currentTheme ?? 'TypeA' );
  }

  getDataConsentOnePlatform() async {
    await ConsentService.getConsentOnePlatform().then((result) => {
      setState(() {
        dataConsent = result.model ?? ConsentAppModel();
      })
    });
  }
}

