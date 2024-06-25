import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:get/get.dart';
import 'package:oneplatformtemplate/template/page/authentication/send_message_page.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../navigation.dart';
import '../../api/api_manager.dart';
import '../../api/model/authentication/req_cid_phone_model.dart';
import '../../api/model/authentication/req_otp_model.dart';
import '../../api/model/consent/consent_app_model.dart';
import '../../api/request/authentication/bms_qrcode_login_request.dart';
import '../../api/request/authentication/login_cid_and_phone_request.dart';
import '../../api/request/authentication/login_service_qrcode_request.dart';
import '../../api/request/authentication/otp_login_regis_request.dart';
import '../../api/request/authentication/register_by_qrcode_key_request.dart';
import '../../api/request/authentication/send_otp_request.dart';
import '../../api/request/authentication/username_login_request.dart';
import '../../api/service/authentication_service.dart';
import '../../api/service/consent_service.dart';
import '../../appManager/app_theme.dart';
import '../../appManager/local_storage_manager.dart';
import '../../widget/alertpopupDialog/alert_popup.dart';
import '../../widget/alertpopupDialog/bottomsheet_chat_plugin.dart';
import '../../widget/alertpopupDialog/bottomsheet_terms_and_conditions.dart';
import '../../widget/background_screen/background_color_screen.dart';
import '../../widget/button/gradient_button.dart';
import 'dart:io';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final List locale = [
    {'name': 'ENGLISH'.tr, 'locale': Locale('en', 'US'), 'onCheck': false},
    {'name': 'THAI'.tr, 'locale': Locale('th', 'TH')},
  ];

  ConsentAppModel dataConsent = ConsentAppModel();
  String consentType = '';
  String consentDetail = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDataConsentOnePlatform();
    checkDarkMode();
    setCurrentVersion();
  }

  @override
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  String? localeText = '';

  bool isDarkMode = false;

  bool isQRCodeBtnEnable = true;
  bool isLoading = false;
  bool isEnable = false;
  bool isDuplicate = false;

  bool isONOpenOTPPage = false;
  ReqOtpModel? reqOtpModel;
  ReqCidPhoneModel? reqCidModel;
  String userPhoneNumber = '';

  // String statusUser = '';
  bool isOpenpassword = true;
  bool isThai = true;
  final checkUsernamedata = GlobalKey<FormState>();
  final checkPassworddata = GlobalKey<FormState>();

  final emailcheck = GlobalKey<FormState>();
  final passwordcheck = GlobalKey<FormState>();
  bool isLoginwithemail = false;
  bool isLoginwithphonenumber = true;

  bool isLoginWithIdcard = false;

  bool isBtnLoading = false;
  bool isEnableUsernameButton = false;
  bool isLoginError = false;

  bool isEnablePhoneButton = false;
  final checkNumberData = GlobalKey<FormState>();
  TextEditingController phonenumberTextEditingController =
      TextEditingController();
  String? currentVersion = '';
  String? appPlatform = '';

  bool loadingButtonColor = true;
  bool loadingButton = false;
  final checkIDCard = GlobalKey<FormState>();
  final checkPhoneNumber = GlobalKey<FormState>();
  bool isCheckIDCardFunc = false;
  bool isCheckIDCardLoading = false;
  bool isCheckPhoneNumber = false;
  bool isCheckPhoneNumberEmpty = false;
  String idCard = '';
  TextEditingController idCardThaiFucntionTextEditingController =
      TextEditingController();
  TextEditingController phoneNumberInCidTextEditingController =
      TextEditingController();

  Widget build(BuildContext context) {
    final double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;

    return Scaffold(
      bottomNavigationBar: null,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                Stack(
                  children: [
                    Column(
                      children: <Widget>[
                        ClipPath(
                          clipper: ClipperStack(),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: [
                                BackgroundColorScreen(
                                  haveNavigationBar: false,
                                  haveMainApp: false,
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 32),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(16, 16, 8, 0),
                                        alignment: Alignment.topLeft,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: Size(50, 30),
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              alignment: Alignment.centerLeft),
                                          onPressed: () {
                                            setState(() {
                                              isThai = !isThai;
                                            });
                                            if (isThai) {
                                              updateLanguage(
                                                  Locale('th', 'TH'));
                                              localeText = 'ENGLISH';
                                            } else {
                                              updateLanguage(
                                                  Locale('en', 'US'));
                                              localeText = 'ไทย';
                                            }
                                          },
                                          child: Text(
                                            localeText ?? "",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          key: ValueKey('registerBtn'),
                                          onTap: () {
                                            onOpenChatPluginBottomSheet(
                                                'https://chat-plugin.one.th/web-plugin/firstpage-chat/chat_plugin?type=auto&bot_id=90ce6c4a-edd8-478f-8037-50d86bbe8981&tokenservice=PRGOx02aMJGU0hGOPNFSvNFdnF3btkVNBhEb0VDehBneqdjb4Z0U5V3VyV3bENTLuElZphTbjdnSp9UaZ5mYsp0QMlWRE9UNnRlWppUbORTUH1UMwknT6FERPRXWH90MRRFT0E1RaxWMTlFMN1mTs50RNVTSp9UaRdVYmJ1MilmS5VmL5o0QWhFcrlkNJN0Y1IlbJNXSp5UMJpXVJpUaPl2YHJGaKlXZgHmS5RhchQ');
                                          },
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                16, 16, 8, 0),
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              'help'.tr,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.04),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isLoginwithphonenumber = true;
                                          if (isLoginwithphonenumber == true) {
                                            isLoginwithemail = false;
                                            isONOpenOTPPage = false;
                                            isLoginWithIdcard = false;
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 8),
                                        child: Text(
                                          'Phone Number'.tr,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: isLoginwithphonenumber
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context).disabledColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ), //PhoneNumber
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isLoginWithIdcard = true;
                                          if (isLoginWithIdcard == true) {
                                            isLoginwithphonenumber = false;
                                            isLoginwithemail = false;
                                            isONOpenOTPPage = false;
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 8),
                                        child: Text(
                                          'ID Card'.tr,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: isLoginWithIdcard
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context).disabledColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      key: ValueKey("registerBtn"),
                                      onTap: () {
                                        setState(() {
                                          isLoginwithemail = true;
                                          if (isLoginwithemail == true) {
                                            isLoginwithphonenumber = false;
                                            isONOpenOTPPage = false;
                                            isLoginWithIdcard = false;
                                          }
                                        });
                                      },
                                      child: Container(
                                        child:  Container(
                                          padding: EdgeInsets.symmetric(vertical: 8),
                                          child: Text(
                                            'Username'.tr,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: isLoginwithemail
                                                  ? Theme.of(context).primaryColor
                                                  : Theme.of(context).disabledColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(24, 0, 24, 8),
                              decoration: BoxDecoration(),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 2,
                                      width: MediaQuery.of(context).size.width *
                                              0.5 -
                                          32,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        color: isLoginwithphonenumber
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context).disabledColor,
                                      ),
                                    ),
                                  ), //PhoneNumber
                                  Expanded(
                                    child: Container(
                                      height: 2,
                                      width: MediaQuery.of(context).size.width *
                                              0.5 -
                                          32,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        color: isLoginWithIdcard
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context).disabledColor,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 2,
                                      width: MediaQuery.of(context).size.width *
                                              0.5 -
                                          32,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        color: isLoginwithemail
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context).disabledColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                children: [
                                  isLoginwithemail
                                      ? _loginByEmail(context)
                                      : Container(),
                                  isLoginwithphonenumber &&
                                          isONOpenOTPPage == false
                                      ? _phonenumberData(context)
                                      : Container(),
                                  isONOpenOTPPage && isLoginwithemail == false
                                      ? _phonenumberData(context)
                                      : Container(),
                                  isLoginWithIdcard
                                      ? _loginByIdCard(context)
                                      : Container(),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                16, 0, 16, 0),
                                            height: 1,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor,
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(16, 0, 16, 0),
                                          child: Text(
                                            'Or'.tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                16, 0, 8, 0),
                                            height: 1,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(32, 8, 32, 16),
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigation.shared.toEnterpriseLoginPage(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape:
                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
                                        padding: EdgeInsets.all(0.0),
                                      ),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            gradient:  LinearGradient(
                                              colors: [Color(0xff004665), Color(0xff004665)],
                                            ),

                                            borderRadius: BorderRadius.circular(24.0)),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child:  Container(
                                            width: MediaQuery.of(context).size.width,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,

                                              children: [
                                                Container(
                                                  padding:
                                                  EdgeInsets.only(right: 8),
                                                  child: Icon(
                                                    Icons.apartment,
                                                    color: Colors.white,
                                                    size: 18,
                                                  ),
                                                ),
                                                Text(
                                                  'Login by Enterprise Account'
                                                      .tr,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(32, 8, 32, 16),
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          isQRCodeBtnEnable = false;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape:
                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
                                        padding: EdgeInsets.all(0.0),
                                      ),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            gradient:  LinearGradient(
                                              colors: [Color(0xffa44a01),Color(0xffa44a01)],
                                            ),

                                            borderRadius: BorderRadius.circular(24.0)),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child:  Container(
                                            width: MediaQuery.of(context).size.width,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,

                                              children: [
                                                Container(
                                                  padding:
                                                  EdgeInsets.only(right: 8),
                                                  child: Icon(
                                                    Icons.qr_code_scanner_outlined,
                                                    color: Colors.white,
                                                    size: 18,
                                                  ),
                                                ),
                                                Text(
                                                  'Login by QR Code'.tr,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      // fontWeight: FontWeight.w700,
                                                      color: Colors.white ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SafeArea(
                      child: Container(
                        margin: useMobileLayout
                            ? EdgeInsets.only(top: 16)
                            : EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.08),
                        height: useMobileLayout
                            ? MediaQuery.of(context).size.height * 0.20
                            : MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            )
                          ],
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/icon/app_new_icon_1024x12024.png"),
                            scale: 28,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      'No Account?'.tr,
                      style:
                          TextStyle(fontSize: 16, color: Color(0xff808080)),
                    ),
                  ),
                  GestureDetector(
                    key: ValueKey('registerBtn'),
                    onTap: () {
                      onShowConsent();
                    },
                    child: Container(
                      child: Text(
                        'Register here'.tr,
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  checkDarkMode() async {
    ThemeProvider().isDarkMode.then((value) => {
          setState(() {
            isDarkMode = value;
          })
        });
  }

  Widget _loginByIdCard(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
          child: Form(
              key: checkIDCard,
              child: TextFormField(
                  key: ValueKey('userField'),
                  controller: idCardThaiFucntionTextEditingController,
                  inputFormatters: [MaskedInputFormatter('0000000000000')],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.credit_card,
                        color: Theme.of(context).primaryColor
                        ),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    hintText: 'Thai ID Card'.tr,
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffC4C4C4)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    errorStyle: TextStyle(
                      height: 0,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.7)),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  validator: (value) {
                    if (isCheckIDCardFunc == false) {
                      return 'ID card code is invalid.'.tr;
                    }
                    if (value == null || value.isEmpty) {
                      return 'Please Fill Data'.tr;
                    }
                    return null;
                  },
                  onChanged: (text) {
                    setState(() {
                      if (idCardThaiFucntionTextEditingController.text.length ==
                          13) {
                        isCheckIDCardFunc = checkIDCardThai(text);
                        checkIDCard.currentState!.validate();
                        isCheckIDCardLoading = true;
                      } else {
                        isCheckIDCardLoading = false;
                      }
                    });
                  })),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
          child: Form(
              key: checkPhoneNumber,
              child: TextFormField(
                  key: ValueKey('userField'),
                  controller: phoneNumberInCidTextEditingController,
                  inputFormatters: [MaskedInputFormatter('00-0000-0000')],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Theme.of(context).primaryColor,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    hintText: 'Phone Number'.tr,
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffC4C4C4)
                        ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    errorStyle: TextStyle(
                      height: 0,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.7)),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  validator: (value) {},
                  onChanged: (text) {
                    setState(() {
                      var userPhoneNumberInCid = text.replaceAll("-", "");
                      if (userPhoneNumberInCid.length == 10) {
                        isCheckPhoneNumber = true;
                      } else {
                        isCheckPhoneNumber = false;
                      }
                    });
                  })),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(32, 8, 32, 16),
          height: 48,
          child: GradientButton(
            title: 'Sign In'.tr,
            isEnable: isCheckIDCardLoading &&
                isCheckPhoneNumber &&
                isCheckIDCardFunc &&
                loadingButtonColor,
            callBack: () {
              if (checkIDCard.currentState!.validate() == true) {
                onLoginByCidAndPhone(phoneNumberInCidTextEditingController.text,
                    idCardThaiFucntionTextEditingController.text);
              }
            },
            isBtnLoading: loadingButton,
          ),
        ),
      ],
    );
  }

  checkIDCardThai(String idCardNumber) {
    var sum = 0;
    for (var i = 0; i < idCardNumber.length - 1; i++) {
      sum += int.parse(idCardNumber[i]) * (13 - i);
    }
    var checkDigit = (11 - (sum % 11)) % 10;
    if (checkDigit == int.parse(idCardNumber[12])) {
      return true;
    } else {
      return false;
    }
  }

  Widget _loginByEmail(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
            child: Form(
                key: checkUsernamedata,
                child: TextFormField(
                    key: ValueKey('userField'),
                    controller: userNameTextEditingController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: 'Username / Email'.tr,
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffC4C4C4)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      errorStyle: TextStyle(
                        height: 0,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.7)),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    validator: (value) {
                      if (isLoginError == true) {
                        return '';
                      } else {
                        isLoginError == false;
                      }
                      if (value == null || value.isEmpty) {
                        return 'Please Fill Data'.tr;
                      }
                      return null;
                    },
                    onChanged: (text) {
                      setState(() {
                        if (userNameTextEditingController.text.length > 0 &&
                            passwordTextEditingController.text.length > 0) {
                          isEnableUsernameButton = true;
                        } else {
                          isEnableUsernameButton = false;
                        }
                      });
                    })),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
            child: Form(
              key: checkPassworddata,
              child: TextFormField(
                  key: ValueKey('passField'),
                  controller: passwordTextEditingController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.7)),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    suffixIcon: IconButton(
                      icon: ImageIcon(
                        isOpenpassword
                            ? AssetImage("assets/icon/icon_eyeoff.png")
                            : AssetImage("assets/icon/icon_eyeon.png"),
                        size: 22,
                        color: isOpenpassword
                            ? Theme.of(context).primaryColor.withOpacity(0.5)
                            : Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          isOpenpassword = !isOpenpassword;
                        });
                      },
                    ),
                    hintText: 'Password'.tr,
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffC4C4C4)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  obscureText: isOpenpassword,
                  validator: (value) {
                    if (isLoginError == true) {
                      return 'Incorrect Username or Password.'.tr;
                    }

                    if (value == null || value.isEmpty) {
                      return 'Please Fill Data'.tr;
                    }
                    return null;
                  },
                  onChanged: (text) {
                    setState(() {
                      if (userNameTextEditingController.text.length > 0 &&
                          passwordTextEditingController.text.length > 0) {
                        isEnableUsernameButton = true;
                      } else {
                        isEnableUsernameButton = false;
                      }
                    });
                  }),
            ),
          ),
          Container(
              height: 16,
              margin: EdgeInsets.fromLTRB(32, 0, 32, 16),
              alignment: Alignment.topRight,
              child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Forget Password ?'.tr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff999999),
                    ),
                  ))),
          Container(
            margin: EdgeInsets.fromLTRB(32, 8, 32, 16),
            height: 48,
            child: GradientButton(
              key: const ValueKey("signInBtn"),
              title: 'Sign In'.tr,
              isEnable: isEnableUsernameButton,
              callBack: () {
                onLoginUsername();
              },
              isBtnLoading: isBtnLoading,
            ),
          ),
        ],
      ),
    );
  }

  Widget _phonenumberData(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
                height: 48,
                child: Form(
                  key: checkNumberData,
                  child: TextFormField(
                    controller: phonenumberTextEditingController,
                    keyboardType: TextInputType.number,
                    cursorHeight: 20,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Theme.of(context).primaryColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.7)),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      hintText: "Phone Number".tr,
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffC4C4C4)),
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    inputFormatters: [MaskedInputFormatter('00-0000-0000')],
                    validator: (value) {
                      if (value?.length != 12) {
                        return 'โปรดใส่ข้อมูลให้ครบ 10 ตัว';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      setState(() {
                        userPhoneNumber = phonenumberTextEditingController.text
                            .replaceAll("-", "");
                        if (userPhoneNumber.length == 10) {
                          isEnablePhoneButton = true;
                        } else {
                          isEnablePhoneButton = false;
                        }
                      });
                    },
                  ),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(32, 8, 32, 16),
              height: 48,
              child: GradientButton(
                title: 'Continue'.tr,
                isEnable: isEnablePhoneButton,
                callBack: () {
                  if (checkNumberData.currentState!.validate()) {
                    onSendReqOPT(userPhoneNumber);
                  }
                },
                isBtnLoading: isBtnLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }

  setCurrentVersion() async {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String version = packageInfo.version;
      setState(() {
        currentVersion = version;
        appPlatform = Platform.isAndroid ? 'android' : 'ios';
      });
    });
  }

  onLoginUsername() async {
    setState(() {
      isBtnLoading = true;
      isEnableUsernameButton = false;
    });
    var request = UsernameLoginRequest();
    request.username = userNameTextEditingController.text;
    request.password = passwordTextEditingController.text;

    request.typeApp = appPlatform ?? '';
    request.versionApp = currentVersion ?? '';

    await AuthenticationService.postLogin(request).then((result) => {
          if (result.status == 200)
            {
              isLoginError = false,
              Navigation.shared.toMyHomePage(context),
            }
          else
            {
              setState(() {
                isLoginError = true;
                checkUsernamedata.currentState!.validate();
                checkPassworddata.currentState!.validate();
              }),
            },
          setState(() {
            isBtnLoading = false;
            isEnableUsernameButton = true;
          }),
        });
  }

  onSendReqOPT(phoneNumber) async {
    setState(() {
      isBtnLoading = true;
      isEnablePhoneButton = false;
    });
    var request = OtpLoginRegisRequest();
    request.phone = phoneNumber;
    request.typeOtp = 'login';

    await AuthenticationService.postReqOTPLoginRegisV2(request)
        .then((result) => {
              if (result.status == 200)
                {
                  setState(() {
                    reqOtpModel = result.reqOtpModel;
                    reqOtpModel?.mobileRefId = phoneNumber;
                  }),
                  if (result.reqOtpModel?.typeOtp == "select accounts")
                    {
                      Navigation.shared.toSendOtpPage(
                          context,
                          'select accounts',
                          phoneNumber,
                          '',
                          reqOtpModel!,
                          ReqCidPhoneModel(),
                          ''),
                    }
                  else
                    {
                      Navigation.shared.toSendOtpPage(
                          context,
                          'login',
                          phoneNumber,
                          '',
                          reqOtpModel!,
                          ReqCidPhoneModel(),
                          ''),
                    },
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
                          )),
                },
              setState(() {
                isBtnLoading = false;
                isEnablePhoneButton = true;
              }),
            });
  }

  onLoginPhoneNumber(otpCode) async {
    setState(() {
      isBtnLoading = true;
    });
    var request = SendOtpRequest();
    request.otp = otpCode;
    request.typeOtp = 'login';
    request.phone = userPhoneNumber;

    await AuthenticationService.postLoginRegisterPhone(request)
        .then((result) => {
              setState(() {
                if (result.status == 200) {
                  Navigation.shared.toMyHomePage(context);
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertPopup(
                            description: result.message.toString().tr,
                            icon: Icons.error_outline_outlined,
                            title: "Login Error",
                            callBack: () {
                            },
                          ));
                }
                isBtnLoading = false;
              })
            });
  }

  pathQrcode(String findCode) async {
    try {
      setState(() {
        isLoading = true;
      });
      var urlHost = Uri.parse(findCode).host;
      if (findCode.contains('id_card_num')) {
        var request =
            RegisterByQrcodeBMSRequest.fromJson(json.decode(findCode));
        onRegisterByQrcodeBMSRequest(request);
      } else if (findCode[0] == '{' && findCode[findCode.length - 1] == '}') {
        onRegisterByQrcodeKey(findCode);
      } else if (urlHost == ApiManager().dynamicLinkQrCode) {
      } else if (findCode.contains('login-service')) {
        pathToDynamicLoginService(findCode);
      }
      else {
        showDialogLoginServiceQrcode('This Service Cannot Be Used.'.tr,
            "Warning1".tr, Icons.error_outline_outlined, false);
        setState(() {
          isLoading = true;
        });
        if (findCode.contains('id_card_num')) {
          var request =
              RegisterByQrcodeBMSRequest.fromJson(json.decode(findCode));
          await onRegisterByQrcodeBMSRequest(request);
        } else if (findCode[0] == '{' && findCode[findCode.length - 1] == '}') {
          await onRegisterByQrcodeKey(findCode);
        } else {
          setState(() {
            isLoading = false;
          });
        }
      }
    } catch (e) {
      if (findCode.contains('id_card_num')) {
        var request =
            RegisterByQrcodeBMSRequest.fromJson(json.decode(findCode));
        await onRegisterByQrcodeBMSRequest(request);
      } else if (findCode[0] == '{' && findCode[findCode.length - 1] == '}') {
        await onRegisterByQrcodeKey(findCode);
      }
    }
  }

  onRegisterByQrcodeKey(String key) async {
    setState(() {
      isBtnLoading = true;
      isEnable = false;
    });
    var request = RegisterByQrcodeKeyRequest();
    request.key = key;

    await AuthenticationService.postRegisterByQrcodeKey(request)
        .then((result) async => {
              if (result.status == 200)
                {
                  if (result.loginActionModel?.actionType == 'go_to_biz')
                    {
                      await LocalStorageManager.saveCurrentBis(
                              result.loginActionModel?.businessId ?? '')
                          .then((value) => {
                                Navigation.shared
                                    .toMyHomePageWithActionJumpToBis(
                                        context,
                                        result.loginActionModel?.actionType ??
                                            '',
                                        result.loginActionModel?.businessId ??
                                            ''),
                              })
                    }
                  else
                    {Navigation.shared.toRegisterCompletePage(context)}
                }
              else
                {
                  if (result.message == ':map[username:[username duplicate]]')
                    {
                      this.isDuplicate = true,
                    }
                  else
                    {
                      this.isDuplicate = false,
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertPopup(
                                description: result.message.toString().tr,
                                icon: Icons.error_outline_outlined,
                                title: "Login Error",
                                callBack: () {
                                  setState(() {
                                    isQRCodeBtnEnable = true;
                                  });
                                  // Navigator.of(context).pop();
                                },
                              ))
                    }
                },
              setState(() {
                isBtnLoading = false;
                isLoading = false;
                isEnable = true;
              }),
            });
  }

  onRegisterByQrcodeBMSRequest(RegisterByQrcodeBMSRequest request) async {
    setState(() {
      isBtnLoading = true;
      isEnable = false;
    });

    await AuthenticationService.postRegisterByQrcodeBMS(request)
        .then((result) async {
      if (result.status == 200) {
        if (result.loginActionModel?.actionType == 'go_to_biz') {
          await LocalStorageManager.saveCurrentBis(
                  result.loginActionModel?.businessId ?? '')
              .then((value) => {
                    Navigation.shared.toMyHomePageWithActionJumpToBis(
                        context,
                        result.loginActionModel?.actionType ?? '',
                        result.loginActionModel?.businessId ?? ''),
                  });
        } else if (result.loginActionModel?.actionType == 'show_message') {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertPopup(
                    description: result.loginActionModel?.message ?? '',
                    icon: Icons.error_outline_outlined,
                    title: "Successed".tr,
                    callBack: () {},
                  ));
        } else {
          Navigation.shared.toMyHomePage(context);
        }
      } else {
        if (result.message == ':map[username:[username duplicate]]') {
          this.isDuplicate = true;
        } else {
          this.isDuplicate = false;
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertPopup(
                    description: result.message.toString().tr,
                    icon: Icons.error_outline_outlined,
                    title: "Login Error",
                    callBack: () {
                      setState(() {
                        isQRCodeBtnEnable = true;
                      });
                    },
                  ));
        }
      }
      setState(() {
        isBtnLoading = false;
        isLoading = false;
        isEnable = true;
      });
    });
  }

  updateLanguage(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language_code', '${locale.languageCode}');
    prefs.setString('country_code', '${locale.countryCode}');
    Get.updateLocale(locale);
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
      }
    } else {
      setState(() {
        locale[0]['onCheck'] = true;
        prefs.setString('language_code', 'th');
        prefs.setString('country_code', 'TH');
      });
    }
  }


  void onShowConsent() {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        enableDrag: false,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
        builder: (BuildContext context) {
          return BottomSheetTermsAndConditions(
            callBack: ((statusAccept) {
              if (statusAccept) {
                if (statusAccept) {
                  Navigation.shared.toRegisterPage(context, () {
                  });
                }
              }
            }),
            companyPicture: '',
            actionInPage: 'toRegisterPage',
            businessId: '',
            roleId: '',
            deptId: '',
            roleName: '',
            goToBiz: '',
            isDarkMode: isDarkMode,
            consentType: consentType,
            consentDetail: consentDetail,
          );
        });
  }

  getDataConsentOnePlatform() async {
    await ConsentService.getConsentOnePlatform().then((result) => {
          setState(() {
            dataConsent = result.model ?? ConsentAppModel();
            if (dataConsent.detail!.isEmpty) {
              consentType = 'text';
              consentDetail = '';
            } else {
              consentType = 'html';
              consentDetail = dataConsent.detail ?? '';
            }
          })
        });
  }


  pathToDynamicLoginService(String pathData) {
    var uri = Uri.dataFromString(pathData);
    Map<String, String> params = uri.queryParameters;
    String dataCustomer = params['customer'].toString();
    String serviceName = params['data'].toString();
    if (dataCustomer.isNotEmpty &&
        dataCustomer != 'null' &&
        serviceName.isNotEmpty &&
        serviceName != 'null') {
      postLoginServiceQrcode(serviceName, dataCustomer);
    } else {
      showDialogLoginServiceQrcode('Unable login with this QR code.'.tr,
          "Warning3".tr, Icons.error_outline_outlined, false);
    }
  }

  showDialogLoginServiceQrcode(String dataDescription, String dataTitle,
      IconData iconShow, bool goToHomePage) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertPopup(
              description: dataDescription,
              icon: iconShow,
              title: dataTitle,
              callBack: () {
                if (goToHomePage) {
                  Navigation.shared.toMyHomePage(context);
                }
              },
            ));
  }

  postLoginServiceQrcode(String dataService, String serviceName) async {
    setState(() {
      isBtnLoading = true;
      isLoading = true;
      isEnable = true;
    });

    LoginServiceQrcodeRequest request = LoginServiceQrcodeRequest();
    request.serviceData = dataService;
    request.serviceName = serviceName;
    await AuthenticationService.postLoginServiceQrcode(request)
        .then((result) async => {
              if (result.status == 200)
                {
                  if (result.loginActionModel?.actionType == 'go_to_biz')
                    {
                      await LocalStorageManager.saveCurrentBis(
                              result.loginActionModel?.businessId ?? '')
                          .then((value) => {
                                Navigation.shared
                                    .toMyHomePageWithActionJumpToBis(
                                        context,
                                        result.loginActionModel?.actionType ??
                                            '',
                                        result.loginActionModel?.businessId ??
                                            ''),
                              })
                    }
                  else if (result.loginActionModel?.actionType ==
                      'show_message')
                    {
                      showDialogLoginServiceQrcode(
                          result.loginActionModel?.message ?? '',
                          "Send Successed".tr,
                          Icons.check_circle_outline_outlined,
                          false),
                    }
                  else
                    {
                      Navigation.shared.toMyHomePage(context),
                    }
                }
              else
                {
                  showDialogLoginServiceQrcode(
                      'This Service Cannot Be Used.'.tr,
                      "Warning4".tr,
                      Icons.error_outline_outlined,
                      false)
                },
              setState(() {
                isBtnLoading = false;
                isLoading = false;
                isEnable = false;
              })
            });
  }

  onLoginByCidAndPhone(String phoneNumber, String idCard) async {
    setState(() {
      loadingButtonColor = false;
      loadingButton = true;
    });
    String replacePhoneNumber = phoneNumber.replaceAll("-", "").trim();
    LoginCidAndPhoneRequest request = LoginCidAndPhoneRequest();
    request.idCard = idCard;
    request.phone = replacePhoneNumber;
    await AuthenticationService.postLoginRegisterCidAndPhoneNumber(request)
        .then((result) {
      setState(() {
        if (result.status == 200) {
          reqCidModel = result.reqCidModel;
          if (result.reqCidModel?.typeOtp == 'login') {
            Navigation.shared.toSendOtpPage(
                context,
                'login',
                replacePhoneNumber,
                idCard,
                ReqOtpModel(),
                reqCidModel ?? ReqCidPhoneModel(),
                '');
          } else if (result.reqCidModel?.typeOtp == 'register') {
            Navigation.shared.toSendOtpPage(
                context,
                'register',
                replacePhoneNumber,
                idCard,
                ReqOtpModel(),
                reqCidModel ?? ReqCidPhoneModel(),
                '');
          } else if (result.reqCidModel?.typeOtp == 'select accounts') {
            Navigation.shared.toSendOtpPage(
                context,
                'select accounts',
                replacePhoneNumber,
                idCard,
                ReqOtpModel(),
                reqCidModel ?? ReqCidPhoneModel(),
                '');
          }
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertPopup(
                    description: result.message.toString().tr,
                    icon: Icons.error_outline_outlined,
                    title: "Login Error",
                    callBack: () {
                    },
                  ));
        }
        setState(() {
          loadingButton = false;
          loadingButtonColor = true;
        });
      });
    });
  }

  onOpenChatPluginBottomSheet(String urlString) async {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.0))),
        isScrollControlled: true,
        isDismissible: true,
        enableDrag: false,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return BottomSheetChatPlugin(
            urlString: urlString,
          );
        });
  }
}

class ClipperStack extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();

    path.lineTo(0, height);
    path.quadraticBezierTo(width * 0.5, height - 200, width, height);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
