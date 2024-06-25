import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import '../../../navigation.dart';
import '../../api/model/authentication/req_cid_phone_model.dart';
import '../../api/model/authentication/req_otp_model.dart';
import '../../api/request/authentication/bms_qrcode_login_request.dart';
import '../../api/request/authentication/otp_login_regis_request.dart';
import '../../api/request/authentication/register_by_qrcode_key_request.dart';
import '../../api/request/authentication/register_username_request.dart';
import '../../api/request/authentication/send_otp_request.dart';
import '../../api/service/authentication_service.dart';
import '../../appManager/local_storage_manager.dart';
import '../../widget/alertpopupDialog/alert_popup.dart';
import '../../widget/alertpopupDialog/bottomsheet_chat_plugin.dart';
import '../../widget/button/gradient_button.dart';
import '../../widget/loading/base_loading_animation.dart';
import 'send_message_page.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback callbackfunc;

  const RegisterPage({Key? key, required this.callbackfunc}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? localeText = '';

  bool isRegisterfullDetail = true;
  bool isRegisterEasy = false;
  bool isONOpenOTPPage = false;
  bool isQRPage = false;

  bool isLoading = false;

  String patternUsername = r'^([a-zA-Z])[a-zA-Z0-9]';
  String patternPassword = r'^(?=.*?[a-zA-Z])[a-zA-Z0-9!@#\$&*~].{0,}$';
  String characterUsername = r'^(?=.*?[!@#\$&*~]).{0,}$';

  ReqOtpModel? reqOtpModel;
  String userPhoneNumber = '';

  bool isOpenPassword = true;
  bool isOpenPasswordConfirm = true;

  TextEditingController mobileNoTextEditingController = TextEditingController();
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController passwordInputTextEditingController =
  TextEditingController();
  TextEditingController passwordInputConfirmTextEditingController =
  TextEditingController();

  final qrData = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewController;

  final checkMobileNoData = GlobalKey<FormState>();
  final checkUsernameData = GlobalKey<FormState>();
  final checkPasswordData = GlobalKey<FormState>();
  final checkPasswordConfirmData = GlobalKey<FormState>();
  bool isThai = true;
  bool isEnable = false;
  bool isBtnLoading = false;
  bool isQRCodeBtnEnable = true;

  bool isCheckTextUsername = false;
  bool isCheckCharacterUsername = false;
  bool isCheckLengthUsername = false;
  bool isCheckTextPassword = false;
  bool isCheckLengthPassword = false;
  bool isDuplicate = false;

  bool isEnablePhoneButton = false;
  final checkNumberData = GlobalKey<FormState>();
  TextEditingController phonenumberTextEditingController =
  TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setLocale();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.callbackfunc();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await qrViewController!.pauseCamera();
    }
    qrViewController!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? BaseLoadingAnimation()
          : Column(
        children: [
          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 24, 8, 0),
                          alignment: Alignment.topLeft,
                          child: TextButton(
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
                        Expanded(
                          child: GestureDetector(
                            key: ValueKey('registerBtn'),
                            onTap: () {
                              onOpenChatPluginBottomSheet('https://chat-plugin.one.th/web-plugin/firstpage-chat/chat_plugin?type=auto&bot_id=90ce6c4a-edd8-478f-8037-50d86bbe8981&tokenservice=PRGOx02aMJGU0hGOPNFSvNFdnF3btkVNBhEb0VDehBneqdjb4Z0U5V3VyV3bENTLuElZphTbjdnSp9UaZ5mYsp0QMlWRE9UNnRlWppUbORTUH1UMwknT6FERPRXWH90MRRFT0E1RaxWMTlFMN1mTs50RNVTSp9UaRdVYmJ1MilmS5VmL5o0QWhFcrlkNJN0Y1IlbJNXSp5UMJpXVJpUaPl2YHJGaKlXZgHmS5RhchQ');
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 40, 24, 16),
                              alignment: Alignment.topRight,
                              child: Text(
                                'help'.tr,
                                style: TextStyle(
                                    fontSize: 16, color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Image.asset(
                        'assets/icon/app_new_icon_1024x12024.png',
                        width: 126,
                        height: 126,
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(32, 24, 32, 0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Expanded(
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             setState(() {
                    //               isRegisterfullDetail = true;
                    //               isONOpenOTPPage = false;
                    //               if (isRegisterfullDetail == true) {
                    //                 isRegisterEasy = false;
                    //                 isQRPage = false;
                    //               }
                    //             });
                    //           },
                    //           child: Container(
                    //             height: 64,
                    //             child: Column(
                    //               children: [
                    //                 Container(
                    //                   padding: EdgeInsets.symmetric(
                    //                       vertical: 8),
                    //                   child: Text(
                    //                     'Username'.tr,
                    //                     style: TextStyle(
                    //                       fontSize: 16,
                    //                       fontWeight: FontWeight.w700,
                    //                       color: isRegisterfullDetail
                    //                           ? Theme.of(context)
                    //                               .primaryColor
                    //                           : Theme.of(context)
                    //                               .disabledColor,
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Container(
                    //                   height: 2,
                    //                   width: MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                           0.5 -
                    //                       32,
                    //                   decoration: BoxDecoration(
                    //                     borderRadius: BorderRadius.all(
                    //                         Radius.circular(4)),
                    //                     color: isRegisterfullDetail
                    //                         ? Theme.of(context)
                    //                             .primaryColor
                    //                         : Theme.of(context)
                    //                             .disabledColor,
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       GestureDetector(
                    //         onTap: () {
                    //           setState(() {
                    //             isRegisterEasy = true;
                    //             if (isRegisterEasy == true) {
                    //               isRegisterfullDetail = false;
                    //               isQRPage = false;
                    //             }
                    //           });
                    //         },
                    //         child: Container(
                    //           height: 64,
                    //           child: Column(
                    //             children: [
                    //               Container(
                    //                 padding:
                    //                     EdgeInsets.symmetric(vertical: 8),
                    //                 child: Text(
                    //                   'Phone Number'.tr,
                    //                   style: TextStyle(
                    //                     fontSize: 16,
                    //                     fontWeight: FontWeight.w700,
                    //                     color: isRegisterEasy
                    //                         ? Theme.of(context)
                    //                             .primaryColor
                    //                         : Theme.of(context)
                    //                             .disabledColor,
                    //                   ),
                    //                 ),
                    //               ),
                    //               Container(
                    //                 height: 2,
                    //                 width: MediaQuery.of(context)
                    //                             .size
                    //                             .width *
                    //                         0.5 -
                    //                     32,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.all(
                    //                       Radius.circular(4)),
                    //                   color: isRegisterEasy
                    //                       ? Theme.of(context).primaryColor
                    //                       : Theme.of(context)
                    //                           .disabledColor,
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.fromLTRB(32, 24, 32, 0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              key: ValueKey("registerBtn"),
                              onTap: () {
                                setState(() {
                                  isRegisterfullDetail = true;
                                  isONOpenOTPPage = false;
                                  if (isRegisterfullDetail == true) {
                                    isRegisterEasy = false;
                                    isQRPage = false;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8),
                                child: Text(
                                  'Username'.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: isRegisterfullDetail
                                        ? Theme.of(context)
                                        .primaryColor
                                        : Theme.of(context)
                                        .disabledColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isRegisterEasy = true;
                                  if (isRegisterEasy == true) {
                                    isRegisterfullDetail = false;
                                    isQRPage = false;
                                  }
                                });
                              },
                              child: Container(
                                padding:
                                EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  'Phone Number'.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: isRegisterEasy
                                        ? Theme.of(context)
                                        .primaryColor
                                        : Theme.of(context)
                                        .disabledColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Expanded(
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       setState(() {
                          //         isLoginWithIdcard = true;
                          //         if (isLoginWithIdcard == true) {
                          //           isLoginwithphonenumber = false;
                          //           isLoginwithemail = false;
                          //           isONOpenOTPPage = false;
                          //         }
                          //       });
                          //     },
                          //     child: Container(
                          //       child: Container(
                          //         padding: EdgeInsets.symmetric(vertical: 8),
                          //         child: Text(
                          //           'ID Card'.tr,
                          //           textAlign: TextAlign.center,
                          //           style: TextStyle(
                          //             fontSize: 16,
                          //             fontWeight: FontWeight.w700,
                          //             color: isLoginWithIdcard
                          //                 ? Theme.of(context).primaryColor
                          //                 : Theme.of(context).disabledColor,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(32, 0, 32, 8),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 2,
                              width: MediaQuery.of(context)
                                  .size
                                  .width *
                                  0.5 -
                                  32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(4)),
                                color: isRegisterfullDetail
                                    ? Theme.of(context)
                                    .primaryColor
                                    : Theme.of(context)
                                    .disabledColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 2,
                              width: MediaQuery.of(context)
                                  .size
                                  .width *
                                  0.5 -
                                  32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(4)),
                                color: isRegisterEasy
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context)
                                    .disabledColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    isRegisterfullDetail
                        ? _registerFullData(context)
                        : Container(),

                    isRegisterEasy && !isONOpenOTPPage
                        ? _registerEasyData(context)
                        : Container(),

                    // isQRPage
                    //     ? buildQrView(context)
                    //     : Container(),

                    isONOpenOTPPage && isRegisterfullDetail == false
                        ? _registerEasyData(context)
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    height: 1,
                    color: Theme.of(context).unselectedWidgetColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  // width: MediaQuery.of(context).size.width,
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
                    padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
                    height: 1,
                    color: Theme.of(context).unselectedWidgetColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isQRCodeBtnEnable = false;
              });
              // Navigation.shared.qrCodeScanPage(
              //     context,
              //         (qrPath) => {
              //       pathQrcode(qrPath ?? ''),
              //       setState(() {
              //         isQRCodeBtnEnable = true;
              //       }),
              //     });
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 4, 0, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.qr_code_scanner_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Register by QR Code'.tr,
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 32,
            margin: EdgeInsets.fromLTRB(0, 4, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    'Already Have an account?'.tr,
                    style:
                    TextStyle(fontSize: 16, color: Color(0xff808080)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigation.shared.toLoginPage(context);
                    Navigator.of(context).pop(context);
                  },
                  child: Container(
                    child: Text(
                      'Login here'.tr,
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // GestureDetector(
          //   key: ValueKey('registerBtn'),
          //   onTap: () {
          //     onOpenChatPluginBottomSheet('https://chat-plugin.one.th/web-plugin/firstpage-chat/chat_plugin?type=auto&bot_id=90ce6c4a-edd8-478f-8037-50d86bbe8981&tokenservice=PRGOx02aMJGU0hGOPNFSvNFdnF3btkVNBhEb0VDehBneqdjb4Z0U5V3VyV3bENTLuElZphTbjdnSp9UaZ5mYsp0QMlWRE9UNnRlWppUbORTUH1UMwknT6FERPRXWH90MRRFT0E1RaxWMTlFMN1mTs50RNVTSp9UaRdVYmJ1MilmS5VmL5o0QWhFcrlkNJN0Y1IlbJNXSp5UMJpXVJpUaPl2YHJGaKlXZgHmS5RhchQ');
          //   },
          //   child: Container(
          //     height: 32,
          //     margin: EdgeInsets.only(bottom: 20),
          //     child: Text(
          //       'Need help'.tr,
          //       style: TextStyle(
          //           fontSize: 18, color: Theme.of(context).primaryColor),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _registerFullData(BuildContext context) {
    return Column(
      children: [
        Container(
          // padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
          margin: EdgeInsets.fromLTRB(32, 16, 32, 16),
          child: Form(
            key: checkMobileNoData,
            child: TextFormField(
              key: ValueKey('telText'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                // LengthLimitingTextInputFormatter(10),
                MaskedInputFormatter('00-0000-0000'),
              ],
              onChanged: (text) {
                setState(() {
                  userPhoneNumber = text.replaceAll("-", "");
                  print(userPhoneNumber);
                });
              },
              controller: mobileNoTextEditingController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                hintText: 'Mobile No'.tr,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color(0xffE6E6E6).withOpacity(0.9)),
                  borderRadius: BorderRadius.circular(24),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffC4C4C4)),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Fill Data'.tr;
                } else if (userPhoneNumber.length < 10) {
                  return 'Please fill your mobile number completely.'.tr;
                } else {
                  return null;
                }
              },
            ),
          ),
        ),
        Container(
          // padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
          child: Form(
            key: checkUsernameData,
            child: TextFormField(
              key: ValueKey('userText'),
              controller: usernameTextEditingController,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp("[a-zA-Z0-9]"), allow: true)
              ],
              decoration: InputDecoration(
                errorMaxLines: 2,
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                hintText: 'Username'.tr,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color(0xffE6E6E6).withOpacity(0.9)),
                  borderRadius: BorderRadius.circular(24),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffC4C4C4)),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onChanged: (value) {
                RegExp regExpPatternUsername = new RegExp(patternUsername);
                regExpPatternUsername.hasMatch(value);
                RegExp regExpCharacterUsername = new RegExp(characterUsername);
                regExpCharacterUsername.hasMatch(value);

                setState(() {
                  // value.toLowerCase();
                  print('regExpPatternUsername');
                  print(value.length);
                  print(regExpPatternUsername.hasMatch(value));
                  print(regExpCharacterUsername.hasMatch(value));

                  if (value.length < 6) {
                    isCheckLengthUsername = false;
                  } else {
                    isCheckLengthUsername = true;
                  }

                  if (regExpPatternUsername.hasMatch(value)) {
                    isCheckTextUsername = true;
                  } else {
                    isCheckTextUsername = false;
                  }

                  if (!regExpCharacterUsername.hasMatch(value)) {
                    isCheckCharacterUsername = true;
                  } else {
                    isCheckCharacterUsername = false;
                  }
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Fill Data'.tr;
                } else if (value.length < 6) {
                  return 'Must have at least 6 characters and no special characters.'
                      .tr;
                } else if (isDuplicate) {
                  return 'This username already exist.'.tr;
                } else {
                  return null;
                }
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(32, 8, 32, 0),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 8),
                child: Icon(Icons.check_circle_rounded,
                    size: 16,
                    color: isCheckTextUsername
                        ? Color(0xff24B300)
                        : Color(0xffE6E6E6)),
              ),
              Text(
                'use Lower or Upper Letter.'.tr,
                style: TextStyle(
                    fontSize: 12, color: Theme.of(context).disabledColor),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 8),
                child: Icon(Icons.check_circle_rounded,
                    size: 16,
                    color: isCheckCharacterUsername
                        ? Color(0xff24B300)
                        : Color(0xffE6E6E6)),
              ),
              Text(
                'No special symbol.'.tr,
                style: TextStyle(
                    fontSize: 12, color: Theme.of(context).disabledColor),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(32, 0, 32, 8),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 16,
                  color: isCheckLengthUsername
                      ? Color(0xff24B300)
                      : Color(0xffE6E6E6),
                ),
              ),
              Text(
                'At least 6 letter.'.tr,
                style: TextStyle(
                    fontSize: 12, color: Theme.of(context).disabledColor),
              )
            ],
          ),
        ),
        Container(
          // padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
          child: Form(
            key: checkPasswordData,
            child: TextFormField(
              key: ValueKey('passText'),
              controller: passwordInputTextEditingController,
              decoration: InputDecoration(
                errorMaxLines: 2,
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                suffixIcon: IconButton(
                  icon: ImageIcon(
                    isOpenPassword
                        ? AssetImage("assets/icon/icon_eyeoff.png")
                        : AssetImage("assets/icon/icon_eyeon.png"),
                    size: 22,
                    color: isOpenPasswordConfirm
                        ? Color(0xffE6E6E6).withOpacity(0.9)
                        : Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      isOpenPassword = !isOpenPassword;
                    });
                  },
                ),
                hintText: 'Password'.tr,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color(0xffE6E6E6).withOpacity(0.9)),
                  borderRadius: BorderRadius.circular(24),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffC4C4C4)),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              obscureText: isOpenPassword,
              onChanged: (value) {
                RegExp regExpPatternPassword = new RegExp(patternPassword);
                regExpPatternPassword.hasMatch(value);

                setState(() {
                  print('regExpPatternPassword');
                  print(value.length);

                  if (value.length < 8) {
                    isCheckLengthPassword = false;
                  } else {
                    isCheckLengthPassword = true;
                  }

                  if (regExpPatternPassword.hasMatch(value)) {
                    isCheckTextPassword = true;
                  } else {
                    isCheckTextPassword = false;
                  }

                  if (isCheckTextUsername &&
                      isCheckCharacterUsername &&
                      isCheckLengthUsername &&
                      isCheckTextPassword &&
                      isCheckLengthPassword) {
                    isEnable = true;
                  } else {
                    isEnable = false;
                  }

                  if (isCheckTextUsername &&
                      isCheckCharacterUsername &&
                      isCheckLengthUsername &&
                      isCheckTextPassword &&
                      isCheckLengthPassword) {
                    isEnable = true;
                  } else {
                    isEnable = false;
                  }
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Fill Data'.tr;
                } else if (passwordInputTextEditingController.text.length < 8) {
                  return 'Must have at least 8 characters.'.tr;
                }
                // else if (regExp.hasMatch(value) == false){
                //   return 'Must contain at least one digit of English letters and numbers. using special characters.'.tr;
                // }
                else {
                  return null;
                }
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(32, 8, 32, 0),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 16,
                  color: isCheckTextPassword
                      ? Color(0xff24B300)
                      : Color(0xffE6E6E6),
                ),
              ),
              Text(
                'use Lower or Upper Letter.'.tr,
                style: TextStyle(
                    fontSize: 12, color: Theme.of(context).disabledColor),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(32, 0, 32, 8),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 16,
                  color: isCheckLengthPassword
                      ? Color(0xff24B300)
                      : Color(0xffE6E6E6),
                ),
              ),
              Text(
                'At least 8 letter.'.tr,
                style: TextStyle(
                    fontSize: 12, color: Theme.of(context).disabledColor),
              )
            ],
          ),
        ),
        Container(
          // padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
          child: Form(
            key: checkPasswordConfirmData,
            child: TextFormField(
              key: ValueKey('passConfirmText'),
              controller: passwordInputConfirmTextEditingController,
              decoration: InputDecoration(
                errorMaxLines: 2,
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                suffixIcon: IconButton(
                  icon: ImageIcon(
                    isOpenPasswordConfirm
                        ? AssetImage("assets/icon/icon_eyeoff.png")
                        : AssetImage("assets/icon/icon_eyeon.png"),
                    size: 22,
                    color: isOpenPasswordConfirm
                        ? Color(0xffE6E6E6).withOpacity(0.9)
                        : Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      isOpenPasswordConfirm = !isOpenPasswordConfirm;
                    });
                  },
                ),
                hintText: 'Confirm Password'.tr,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color(0xffE6E6E6).withOpacity(0.9)),
                  borderRadius: BorderRadius.circular(24),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffC4C4C4)),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              obscureText: isOpenPasswordConfirm,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Fill Data'.tr;
                } else if (passwordInputConfirmTextEditingController.text !=
                    passwordInputTextEditingController.text) {
                  return 'Passwords Do Not Match'.tr;
                } else {
                  return null;
                }
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(32, 16, 32, 16),
          height: 48,
          child: GradientButton(
            key: ValueKey('continueBtn'),
            title: 'Continue'.tr,
            isEnable: isEnable,
            callBack: () {
              isDuplicate = false;
              if (checkMobileNoData.currentState!.validate() &&
                  checkUsernameData.currentState!.validate() &&
                  checkPasswordData.currentState!.validate() &&
                  checkPasswordConfirmData.currentState!.validate()) {
                print('สมัครสำเร็จ');
                onRegisterUsername();
              } else {
                print('สมัครไม่สำเร็จ');
              }
            },
            isBtnLoading: isBtnLoading,
          ),
        )
      ],
    );
  }

  Widget _registerEasyData(BuildContext context) {
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
                      //add prefix icon
                      prefixIcon: Icon(
                        Icons.phone,
                        // color: Color(0xffC4C4C4)
                        // color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Color(0xffE6E6E6).withOpacity(0.9)),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      // errorText: userInput.text.isEmpty?"Error":null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      // fillColor: Colors.grey,
                      hintText: "Phone Number".tr,
                      //make hint text
                      hintStyle: TextStyle(
                        // color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffC4C4C4)),
                      labelStyle: TextStyle(
                        // color: Colors.grey,
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
                    // widget.callBack(isEnablePhoneButton);
                    print('isEnablePhoneButton');
                    print(isEnablePhoneButton);
                    print(userPhoneNumber);
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

  Widget buildQrView(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.75,
      width: MediaQuery.of(context).size.width * 0.75,
      child: QRView(
        key: qrData,
        onQRViewCreated: onQRViewCreated,
        onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
        overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 20,
          borderLength: 30,
          borderWidth: 20,
          cutOutSize: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    print('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  Future<void> onQRViewCreated(QRViewController controller) async {
    controller.resumeCamera();
    setState(() => qrViewController = controller);
    // setQRCode();
    controller.scannedDataStream.listen((barcode) {
      controller.pauseCamera();
      pathQrcode(barcode.code ?? '');
      // setState(() => barcodeLink = barcode);
    });
  }

  pathQrcode(String findCode) {
    setState(() {
      isLoading = true;
    });
    print('findCode : ${findCode}');
    if (findCode.contains('id_card_num')) {
      var request = RegisterByQrcodeBMSRequest.fromJson(json.decode(findCode));
      onRegisterByQrcodeBMSRequest(request);
    } else if (findCode[0] == '{' && findCode[findCode.length - 1] == '}') {
      onRegisterByQrcodeKey(findCode);
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  onRegisterByQrcodeKey(String key) async {
    setState(() {
      isBtnLoading = true;
      isEnable = false;
    });

    print('onRegisterUsername');
    print(userPhoneNumber);
    var request = RegisterByQrcodeKeyRequest();
    request.key = key;

    await AuthenticationService.postRegisterByQrcodeKey(request)
        .then((result) async => {
      print('postRegisterUsername'),
      if (result.status == 200)
        {
          if (result.loginActionModel?.actionType == 'go_to_biz')
            {
              // Navigation.shared.toMyHomePageWithActionJumpToBis(
              //     context,
              //     result.loginActionModel?.actionType ?? '',
              //     result.loginActionModel?.businessId ?? '')
              // Navigation.shared.toPrivateServiceNewUiV2(context, result.loginActionModel?.businessId??'',false,(){})
              await LocalStorageManager.saveCurrentBis(result.loginActionModel?.businessId??'').then((value) =>
              {
                Navigation.shared.toMyHomePageWithActionJumpToBis(
                    context,
                    result.loginActionModel?.actionType ?? '',
                    result.loginActionModel?.businessId ?? ''),
              })
            }
          else if (result.loginActionModel?.actionType ==
              'show_message')
            {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertPopup(
                    description:
                    result.loginActionModel?.message ?? '',
                    icon: Icons.error_outline_outlined,
                    title: "Successed".tr,
                    callBack: () {},
                  ))
            }
          else
            {Navigation.shared.toRegisterCompletePage(context)}
        }
      else
        {
          if (result.message == ':map[username:[username duplicate]]')
            {
              this.isDuplicate = true,
              checkUsernameData.currentState!.validate()
            }
          else
            {
              this.isDuplicate = false,
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertPopup(
                    description: result.message.toString().tr,
                    icon: Icons.error_outline_outlined,
                    title: "Register Error",
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

    print('onRegisterUsername');
    print(userPhoneNumber);

    await AuthenticationService.postRegisterByQrcodeBMS(request)
        .then((result) async => {
      print('postRegisterUsername'),
      if (result.status == 200)
        {
          if (result.loginActionModel?.actionType == 'go_to_biz')
            {
              // Navigation.shared.toMyHomePageWithActionJumpToBis(
              //     context,
              //     result.loginActionModel?.actionType ?? '',
              //     result.loginActionModel?.businessId ?? '')
              // Navigation.shared.toPrivateServiceNewUiV2(context, result.loginActionModel?.businessId??'',false,(){})
              await LocalStorageManager.saveCurrentBis(result.loginActionModel?.businessId??'').then((value) =>
              {
                Navigation.shared.toMyHomePageWithActionJumpToBis(
                    context,
                    result.loginActionModel?.actionType ?? '',
                    result.loginActionModel?.businessId ?? ''),
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
              checkUsernameData.currentState!.validate()
            }
          else
            {
              this.isDuplicate = false,
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertPopup(
                    description: result.message.toString().tr,
                    icon: Icons.error_outline_outlined,
                    title: "Register Error",
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

  Widget _sentOTPDATA(BuildContext context) {
    return Container(
      child: SendMessagePage(
        path: 'Register With PhoneNumber'.tr,
        otpDetail: reqOtpModel ?? ReqOtpModel(),
        callBack: (otpCode) {
          onSendOtp(otpCode);
        },
        phoneNumber: userPhoneNumber,
        backToEdit: () {
          setState(() {
            isONOpenOTPPage = false;
          });
        },
      ),
    );
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
        });
        prefs.setString('language_code', 'th');
        prefs.setString('country_code', 'TH');
      }
    });
  }

  updateLanguage(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language_code', '${locale.languageCode}');
    prefs.setString('country_code', '${locale.countryCode}');
    // initialize();
    Get.updateLocale(locale);
    // Get.back();
  }

  onRegisterUsername() async {
    setState(() {
      isBtnLoading = true;
      isEnable = false;
    });
    var request = RegisterUsernameRequest();
    request.username = usernameTextEditingController.text;
    request.password = passwordInputTextEditingController.text;
    request.mobileNo = userPhoneNumber;

    print('onRegisterUsername');
    print(userPhoneNumber);

    await AuthenticationService.postRegisterUsername(request).then((result) => {
      print('postRegisterUsername'),
      if (result.status == 200)
        {
          print('result.status'),
          // Navigation.shared.toMyHomePage(context)
          Navigation.shared.toRegisterCompletePage(context)
        }
      else
        {
          if (result.message == ':map[username:[username duplicate]]')
            {
              this.isDuplicate = true,
              checkUsernameData.currentState!.validate()
            }
          else
            {
              this.isDuplicate = false,
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertPopup(
                    description: result.message.toString().tr,
                    icon: Icons.error_outline_outlined,
                    title: "Register Error",
                    callBack: () {
                      // Navigator.of(context).pop();
                    },
                  ))
            }
        },
      setState(() {
        isBtnLoading = false;
        isEnable = true;
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
    request.typeOtp = 'register';

    await AuthenticationService.postReqOTPLoginRegisV2(request)
        .then((result) => {
      if (result.status == 200)
        {
          setState(() {
            reqOtpModel = result.reqOtpModel;
            userPhoneNumber = phoneNumber;
            isONOpenOTPPage = true;
            Navigation.shared.toSendOtpPage(
                context,'register', phoneNumber, '', reqOtpModel!,ReqCidPhoneModel(),'');
          }),
        }
      else
        {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertPopup(
                description: result.message.toString().tr,
                icon: Icons.error_outline_outlined,
                title: "Register Error",
                callBack: () {
                  // Navigator.of(context).pop();
                },
              ))
        },
      setState(() {
        isBtnLoading = false;
        isEnablePhoneButton = true;
      }),
    });
  }

  onSendOtp(otpCode) async {
    var request = SendOtpRequest();
    request.otp = otpCode;
    request.consentStatus = "T";
    request.typeOtp = 'register';
    request.phone = userPhoneNumber;
    request.mobileRefId = reqOtpModel?.mobileRefId ?? "";

    await AuthenticationService.postLoginRegisterPhone(request)
        .then((result) => {
      if (result.status == 200)
        {Navigation.shared.toMyHomePage(context)}
      else
        {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertPopup(
                description: result.message.toString().tr,
                icon: Icons.error_outline_outlined,
                title: "Register Error",
                callBack: () {
                  // Navigator.of(context).pop();
                },
              ))
        }
    });
  }

  onOpenChatPluginBottomSheet(String urlString) async {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.0))),
        isScrollControlled: true,
        isDismissible: true,
        // useSafeArea: true,
        enableDrag:false,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return BottomSheetChatPlugin(urlString: urlString,);
        });
  }
}
