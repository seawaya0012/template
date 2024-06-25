import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../navigation.dart';
import '../../../api/model/authentication/duplicate_accounts_model.dart';
import '../../../api/model/authentication/req_otp_model.dart';
import '../../../api/request/authentication/send_otp_request.dart';
import '../../../api/request/serviceApp/save_default_app_requast.dart';
import '../../../api/service/authentication_service.dart';
import '../../../appManager/app_theme.dart';
import '../../../appManager/local_storage_manager.dart';
import '../../../widget/alertpopupDialog/alert_popup.dart';
import '../../../widget/button/gradient_button.dart';

class SelectAccountPage extends StatefulWidget {

  final List<DuplicateAccountsModel> duplicateAccountsList;
  final String phoneNumber;
  final ReqOtpModel reqOtpModel;
  final String supType;

  const SelectAccountPage({Key? key, required this.duplicateAccountsList, required this.phoneNumber, required this.reqOtpModel, required this.supType,}) : super(key: key);

  @override
  State<SelectAccountPage> createState() => _SelectAccountPageState();
}

class  _SelectAccountPageState extends State<SelectAccountPage> {
  final List locale = [
    {'name': 'ENGLISH'.tr, 'locale': Locale('en', 'US'), 'onCheck': false},
    {'name': 'THAI'.tr, 'locale': Locale('th', 'TH')},
  ];

  @override
  int selectMailValue = 0;
  String darkModeStage = '';
  bool isDarkMode = false;
  bool isPrivate = false;
  bool isOnOrganizeTheme = false;
  String? localeText = '';
  bool isThai = true;

  bool isEnable = true;
  bool isBtnLoading = false;

  void initState() {
    super.initState();
    getCheckDarkMode();
    setStatusBar();
    setLocale();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isPrivate && isOnOrganizeTheme
          ? Colors.transparent
          : Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), // here the desired height
          child: AppBar(
            leading: BackButton(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shadowColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: Platform.isIOS
                ? SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).scaffoldBackgroundColor,
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
            actions: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 16),
                alignment: Alignment.topRight,
                child: TextButton(
                  style: TextButton.styleFrom(fixedSize: Size(80,30 )),
                  onPressed: () {
                    setState(() {
                      isThai = !isThai;
                    });
                    if (isThai) {
                      updateLanguage(Locale('th', 'TH'));
                      localeText = 'ENGLISH';
                    } else {
                      updateLanguage(Locale('en', 'US'));
                      localeText = 'ไทย';
                    }
                  },
                  child: Text(
                    localeText ?? "",
                    style:
                    TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ],
          )),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('This number has multiple accounts opened.'.tr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
                      ),
                      // SizedBox(height: 20,),
                      Padding(
                        padding: EdgeInsets.only(left: 24,right: 24,top: 16,bottom: 32),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Please select the account for which you want to set up a login.'.tr,style: TextStyle(fontSize: 15),)),
                      ),
                      // SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.duplicateAccountsList.length,
                            itemBuilder:
                                (BuildContext context, int index)
                            => Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 24, 0),
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: Theme.of(context).dialogBackgroundColor,
                                    ),
                                    child: Icon(Icons.person,size: 48,),
                                  ),
                                  Expanded(child: Text(widget.duplicateAccountsList[index].email ?? '',style: (TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),)),
                                  Radio(
                                    value: index,
                                    groupValue: selectMailValue,
                                    onChanged: handleRadio,
                                    activeColor: Colors.blueAccent,
                                    toggleable: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),)),
            Row(
              children: [
                Expanded(
                  child: Container(
                      height: 48,
                        padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
                        child: GradientButton(title: 'Login'.tr, isEnable: isEnable, callBack: (){
                          widget.supType == 'enterpriseLogin' ? onSendOtpEnterpriseLogin():onSendOtp();
                        }, isBtnLoading: isBtnLoading)
                    ),
                  ),
                const SizedBox(width: 20,),
                Expanded(
                  child: Container(
                      height: 48,
                      padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                      child: ElevatedButton(onPressed: () {
                        Navigator.of(context).pop();
                      },  style: ElevatedButton.styleFrom(
                        shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
                        padding: const EdgeInsets.all(0.0),
                      ),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(24.0)),
                            child: Container(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  'Cancel'.tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )

                      )
                  ),
                ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  onSendOtp() async {
    print('onSendOtp');
    setState(() {
      isBtnLoading = true;
      isEnable = false;
    });
    var request = SendOtpRequest();
    request.typeOtp = 'set account';
    request.phone = widget.phoneNumber;
    request.oneId = widget.duplicateAccountsList[selectMailValue].oneId ?? '';

    await AuthenticationService.postLoginRegisterPhone(request)
        .then((result) => {
      if (result.status == 200){
        Navigation.shared.toMyHomePage(context)
      }
      else
        {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertPopup(
                description: result.message.toString().tr,
                icon: Icons.error_outline_outlined,
                title: "Login Error",
                callBack: () {
                  // Navigator.of(context).pop();
                },
              ))
        }
    });
    setState(() {
      isBtnLoading = false;
    });
  }

  onSendOtpEnterpriseLogin() async {
    print('onSendOtp');
    setState(() {
      isBtnLoading = true;
      isEnable = false;
    });
    var request = SendOtpRequest();
    request.otp = "";
    request.consentStatus = "";
    request.typeOtp = 'set account';
    request.phone = widget.phoneNumber;
    request.oneId = widget.duplicateAccountsList[selectMailValue].oneId ?? '';
    request.mobileRefId = widget.reqOtpModel.mobileRefId ?? "";

    request.otpUid = widget.reqOtpModel.otpUid ?? "";


    await AuthenticationService.postAzureLoginRegisterPhone(request)
        .then((result) async => {
      if (result.status == 200){
          print('go to biz ${result.loginActionModel?.actionType}'),
          if (result.loginActionModel?.actionType == 'go_to_biz')
            {
              print('go to biz if start'),
              await LocalStorageManager.saveCurrentBis(result.loginActionModel?.businessId ?? '').then((value) => {
              Navigation.shared.toMyHomePageWithActionJumpToBis(context, result.loginActionModel?.actionType ?? '', result.loginActionModel?.businessId ?? '')
              }),
              print('go to biz if end'),
            } else{
            Navigation.shared.toMyHomePage(context)
          }
      }
      else
        {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertPopup(
                description: result.message.toString().tr,
                icon: Icons.error_outline_outlined,
                title: "Select Account Error",
                callBack: () {
                  // Navigator.of(context).pop();
                },
              ))
        }
    });
    setState(() {
      isBtnLoading = false;
    });
  }
  void handleRadio(int? value) {
    print('value');
    setState(() {
      selectMailValue = value!;
      print(selectMailValue);
    });
  }

  setStatusBar() async {
    ThemeProvider().isDarkMode.then((value) => {
      setState(() {
        isDarkMode = value;
      })
    });
    var bisbgColor = ThemeProvider().hexToColor('code');
    print(bisbgColor);
  }


  setOnOrganizeThemeOn() async {
    var isOnDefaultAppRequest =
    IsOnDefaultAppRequest({'status': 'save', 'message': 'isOn'});
    await LocalStorageManager.saveIsOnOrganizeTheme(isOnDefaultAppRequest);
    setState(() {
      isOnOrganizeTheme = true;
    });
  }

  checkIsOnOrganizeTheme() {
    LocalStorageManager.getIsOnOrganizeTheme().then((value) {
      setState(() {
        if (value != "") {
          if (value == 'isOn') {
            isOnOrganizeTheme = true;
          } else if (value == 'isOff') {
            isOnOrganizeTheme = false;
          } else {
            isOnOrganizeTheme = false;
          }
        } else if (value == "" || value == null) {
          isOnOrganizeTheme = true;
          setOnOrganizeThemeOn();
        }
      });
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

  updateLanguage(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language_code', '${locale.languageCode}');
    prefs.setString('country_code', '${locale.countryCode}');
    // initialize();
    Get.updateLocale(locale);
    // Get.back();
  }

  initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString('language_code');
    final String? countryCode = prefs.getString('country_code');
    final localeLength = locale.length;
    if (languageCode != null && countryCode != null) {
      for (int i = 0; i < localeLength; i++) {
        setState(() {
          if (locale[i]['locale'] == Locale(languageCode, countryCode)) {
            locale[i]['onCheck'] = true;
          } else {
            locale[i]['onCheck'] = false;
          }
        });
        print(locale[i]['onCheck']);
      }
    } else {
      setState(() {
        locale[0]['onCheck'] = true;
        prefs.setString('language_code', 'th');
        prefs.setString('country_code', 'TH');
      });
      print(locale[0]['onCheck']);
    }
  }

  setLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString('language_code');
    final String? countryCode = prefs.getString('country_code');
    print("languageCode.toString() ${languageCode}");
    setState(() {
      if (languageCode != null && countryCode != null) {
        setState(() {
          if (languageCode == 'th') {
            this.localeText = "ENGLISH";
            isThai = true;
          } else {
            this.localeText = "ไทย";
            isThai = false;
          }
        });
        print(languageCode.toString() + "_" + countryCode.toString());
      } else {
        setState(() {
          this.localeText = "ENGLISH";
          isThai = true;
        });
        prefs.setString('language_code', 'th');
        prefs.setString('country_code', 'TH');
      }
    });
  }
}
