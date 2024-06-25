import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:centrifuge/centrifuge.dart' as centrifuge;
// import 'package:centrifuge/centrifuge.dart' as client;
// import 'package:centrifuge/centrifuge.dart';

import '../../../../../navigation.dart';
import '../../../../api/api_manager.dart';
import '../../../../api/model/authentication/req_cid_phone_model.dart';
import '../../../../api/model/authentication/req_otp_model.dart';
import '../../../../api/model/consent/consent_app_model.dart';
import '../../../../api/request/authentication/azure_login_with_code_request.dart';
import '../../../../api/request/authentication/otp_login_regis_request.dart';
import '../../../../api/request/authentication/username_login_request.dart';
import '../../../../api/service/authentication_service.dart';
import '../../../../api/service/consent_service.dart';
import '../../../../appManager/app_theme.dart';
import '../../../../appManager/local_storage_manager.dart';
import '../../../../widget/alertpopupDialog/alert_popup.dart';
import '../../../../widget/alertpopupDialog/bottomsheet_chat_plugin.dart';
import '../../../../widget/alertpopupDialog/bottomsheet_terms_and_conditions.dart';
import '../../../../widget/alertpopupDialog/custom_snackbar.dart';
import '../../../../widget/button/gradient_button.dart';
import '../../../../widget/loading/base_loading_animation.dart';


class EnterpriseLoginPage extends StatefulWidget {
  const EnterpriseLoginPage({Key? key}) : super(key: key);

  @override
  State<EnterpriseLoginPage> createState() => _EnterpriseLoginPageState();
}

class _EnterpriseLoginPageState extends State<EnterpriseLoginPage> {
  final List locale = [
    {'name': 'ENGLISH'.tr, 'locale': Locale('en', 'US'), 'onCheck': false},
    {'name': 'THAI'.tr, 'locale': const Locale('th', 'TH')},
  ];

  String consentType = '',
      consentDetail = '',
      userPhoneNumber = '';

  ConsentAppModel dataConsent = ConsentAppModel();
  String? localeText = '',
      currentVersion = '',
      appPlatform = '',
      enterpriseCode = '',
      firstName = '',
      lastName = '';

  TextEditingController enterpriseTextEditingController = TextEditingController(),
      passwordTextEditingController = TextEditingController(),
      userNameTextEditingController = TextEditingController(),
      phoneNumberTextEditingController = TextEditingController();

  bool isDarkMode = false,
      isLoading = false,
      isDuplicate = false,
      isONOpenOTPPage = false,
      isOpenPassword = true,
      isThai = true,
      isLoginByEnterprise = true,
      isBtnLoading = false,
      isEnableBisNameButton = false,
      isLoginError = false,
      isLoginWithPhoneNumber = false,
      isEnablePhoneButton = false,
      isLoginwithemail = false,
      isEnableUsernameButton = false;

  int _start = 30;

  ReqOtpModel? reqOtpModel;
  ReqCidPhoneModel? reqCidModel;
  late Timer _timer;

  final userNameChecker = GlobalKey<FormState>(),
      passwordFormChecker = GlobalKey<FormState>(),
      checkPhoneNumber = GlobalKey<FormState>();

  late centrifuge.Client client = centrifuge.createClient(ApiManager().centrifugeClient)
    ..setToken(ApiManager().centrifugeToken);
  late centrifuge.Subscription subscriptionAzureLogin;
  StreamSubscription<centrifuge.ConnectedEvent>? _connSub;
  StreamSubscription<centrifuge.DisconnectedEvent>? _disconnSub;
  StreamSubscription<centrifuge.ErrorEvent>? _errorSub;

  Future<void> connectServer(String channelCode) async {
    _connSub = client.connected.listen((event) async {
      print("Connected to server ");
      String channel = ApiManager.eventAzureData + channelCode;
      print("Subscribing $channel");
      final subscription = client.getSubscription(channel);
      subscription?.error.listen(print);
      // subscription.subscribeErrorStream.listen(print);
      subscription?.subscribed.listen(print);
      // subscription.subscribeSuccessStream.listen(print);
      subscription?.unsubscribed.listen(print);
      // subscription.unsubscribeStream.listen(print);
      subscription?.join.listen(print);
      // subscription.joinStream.listen(print);
      subscription?.leave.listen(print);
      // subscription.leaveStream.listen(print);
      subscription?.publication
          .map<String>((e) => utf8.decode(e.data))
          .listen((data) {
        Map valueMap = json.decode(data) as Map<String, dynamic>;
        print('eventAzureDatavalueMap  $valueMap');
        _timer.cancel();
        print('time >>> $_start');
        checkIsLogin(enterpriseCode ?? '');
      });
      // subscription.publishStream
      //     .map<String>((e) => utf8.decode(e.data))
      //     .listen((data) {
      //   Map valueMap = json.decode(data) as Map<String, dynamic>;
      //   print('eventAzureDatavalueMap  $valueMap');
      //   _timer.cancel();
      //   print('time >>> $_start');
      //   checkIsLogin(enterpriseCode ?? '');
      // });
      subscriptionAzureLogin = subscription!;
      await subscriptionAzureLogin.subscribe();
    });
    _disconnSub = client.disconnected.listen((event) {
      print("Disconnected from server ");
    });
    // _disconnSub = client.disconnectStream.listen((event) {
    //   print("Disconnected from server ");
    // });
    _errorSub = client.error.listen((event) {
      print(event.error);
    });
    // _errorSub = client.errorStream.listen((event) {
    //   print(event.error);
    // });
    await client.connect();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setLocale();
    checkDarkMode();
    setCurrentVersion();
    prefer();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    client.disconnect();
    _timer.cancel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            'Back'.tr,
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        actions: [              Container(
          padding: EdgeInsets.fromLTRB(0, 0, 24, 0),
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
        ),],
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [Color(0xff083E5E), Color(0xff107DBC)],
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //     ),
        //   ),
        // ),
      ),
      body: isLoading
          ? BaseLoadingAnimation()
          : Column(
        children: [
          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(

                      margin: EdgeInsets.fromLTRB(0, 16, 0, 8),
                      child: Image.asset(
                        'assets/icon/business_account.png',
                        width: 256,
                        height: 256,
                      ),
                    ),

                    Container(

                      padding: EdgeInsets.fromLTRB(32, 0, 32, 8),
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
                              'Login by Enterprise Account'.tr,
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
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
                    isLoginByEnterprise ? _loginByEnterpriseTap(context) : Container(),
                    isONOpenOTPPage
                        ? _phoneNumberData(context)
                        : Container(),
                    isLoginwithemail ? _loginByEmail(context) : Container(),
                  ],
                ),
              ),
            ),
          ),
          Container(
            // height: 100,
            child: GestureDetector(
              key: ValueKey('registerBtn'),
              onTap: () {
                onOpenChatPluginBottomSheet('https://chat-plugin.one.th/web-plugin/firstpage-chat/chat_plugin?type=auto&bot_id=90ce6c4a-edd8-478f-8037-50d86bbe8981&tokenservice=PRGOx02aMJGU0hGOPNFSvNFdnF3btkVNBhEb0VDehBneqdjb4Z0U5V3VyV3bENTLuElZphTbjdnSp9UaZ5mYsp0QMlWRE9UNnRlWppUbORTUH1UMwknT6FERPRXWH90MRRFT0E1RaxWMTlFMN1mTs50RNVTSp9UaRdVYmJ1MilmS5VmL5o0QWhFcrlkNJN0Y1IlbJNXSp5UMJpXVJpUaPl2YHJGaKlXZgHmS5RhchQ');
              },
              child: Container(
                height: 32,
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Need help'.tr,
                  style: TextStyle(
                      fontSize: 18, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginByEmail(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
            // height: 48,
            child: Form(
                key: userNameChecker,
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
                      // errorText: 'Error Text',
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
                            color: Color(0xffE6E6E6).withOpacity(0.9)),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    validator: (value) {
                      // print('validator');
                      // print(value);
                      if (isLoginError == true) {
                        // print('isLoginError');
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
                        // print('onChangedonChanged');
                        // print(text);
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
            // padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
            child: Form(
              key: passwordFormChecker,
              child: TextFormField(
                  key: ValueKey('passField'),
                  controller: passwordTextEditingController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color(0xffE6E6E6).withOpacity(0.9)),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    suffixIcon: IconButton(
                      icon: ImageIcon(
                        isOpenPassword
                            ? AssetImage("assets/icon/icon_eyeoff.png")
                            : AssetImage("assets/icon/icon_eyeon.png"),
                        size: 22,
                        color: isOpenPassword
                            ? Color(0xffE6E6E6).withOpacity(0.9)
                            : Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          isOpenPassword = !isOpenPassword;
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
                  obscureText: isOpenPassword,
                  validator: (value) {
                    // print('validatorOpenpassword');
                    if (isLoginError == true) {
                      // print('isLoginErrorOpenpassword');
                      return 'Incorrect Username or Password.'.tr;
                    }

                    if (value == null || value.isEmpty) {
                      return 'Please Fill Data'.tr;
                    }
                    return null;
                  },
                  onChanged: (text) {
                    setState(() {
                      // print('onChangedonChanged');
                      // print(text);
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
                    // style: TextStyle(color: Colors.black),
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
                // if (checkUsernamedata.currentState!.validate() &&
                //     checkPassworddata.currentState!.validate()) {
                //   onLoginUsername();
                // } else {
                //   print('ล็อคอินไม่สำเร็จ');
                // }
              },
              isBtnLoading: isBtnLoading,
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginByEnterpriseTap(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(32, 0, 32, 8),
            child: Text('Please enter your enterprise\'s abbreviation'.tr,textAlign: TextAlign.left,style: TextStyle(fontSize: 16),),),
          Container(
            margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
            // height: 48,
            child: Form(
                key: userNameChecker,
                child: TextFormField(
                    key: ValueKey('userField'),
                    controller: enterpriseTextEditingController,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: 'Enterprise\'s abbreviation'.tr,
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffC4C4C4)),
                      // errorText: 'Error Text',
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
                            color: Color(0xffE6E6E6).withOpacity(0.9)),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    validator: (value) {
                      // print('validator');
                      // print(value);
                      if (isLoginError == true) {
                        // print('isLoginError');
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
                        // print('onChangedonChanged');
                        // print(text);
                        if (enterpriseTextEditingController.text.length > 0) {
                          isEnableBisNameButton = true;
                        } else {
                          isEnableBisNameButton = false;
                        }
                      });
                    })),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(32, 0, 32, 8),
            child:  Text("If don\'t know, please contact your enterprise".tr,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Theme.of(context).disabledColor),),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(32, 8, 32, 16),
            height: 48,
            child: GradientButton(
              key: const ValueKey("signInBtn"),
              title: 'Continue '.tr,
              isEnable: isEnableBisNameButton,
              callBack: () {
                onSendBisName(enterpriseTextEditingController.text);
              },
              isBtnLoading: isBtnLoading,
            ),
          ),

        ],
      ),
    );
  }

  Widget _phoneNumberData(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(child: Text("Hi".tr,textAlign: TextAlign.left,style: TextStyle(fontSize: 18),),),
                Container(child: Text(' $firstName $lastName',textAlign: TextAlign.left,style: TextStyle(fontSize: 18),),),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(32, 0, 32, 8),
            child:  Text("please enter your phone number.".tr,textAlign: TextAlign.left,style: TextStyle(fontSize: 18),),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
            // height: 48,
            child: Form(
                key: checkPhoneNumber,
                child: TextFormField(
                    key: ValueKey('userField'),
                    controller: phoneNumberTextEditingController,
                    inputFormatters: [MaskedInputFormatter('00-0000-0000')],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        // color: Color(0xffC4C4C4)
                        // color: Colors.grey,
                      ),
                      contentPadding:
                      EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: 'Phone Number'.tr,
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffC4C4C4)),
                      // errorText: 'Error Text',
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
                            color: Color(0xffE6E6E6).withOpacity(0.9)),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    validator: (value) {
                    },
                    onChanged: (text) {
                      setState(() {
                        var userPhoneNumberInCid = text.replaceAll("-", "");
                        if (userPhoneNumberInCid.length == 10) {
                          isEnablePhoneButton = true;
                          setState(() {
                            userPhoneNumber = userPhoneNumberInCid;
                          });
                        } else {
                          isEnablePhoneButton = false;
                        }
                      });
                    })),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(32, 8, 32, 16),
            height: 48,
            child: GradientButton(
              title: 'Continue'.tr,
              isEnable: isEnablePhoneButton,
              callBack: () {
                // widget.callBack(isEnablePhoneButton);
                print('isEnablePhoneButton');
                print(isEnablePhoneButton);
                print(userPhoneNumber);
                onSendReqOPT(userPhoneNumber);
              },
              isBtnLoading: isBtnLoading,
            ),
          ),

        ],
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
          isThai = true;
        });
        prefs.setString('language_code', 'th');
        prefs.setString('country_code', 'TH');
      }
    });
  }

  checkDarkMode() async {
    ThemeProvider().isDarkMode.then((value) => {
      setState(() {
        isDarkMode = value;
      })
    });
  }

  setCurrentVersion() async {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String version = packageInfo.version;
      setState(() {
        currentVersion = version;
        appPlatform = Platform.isAndroid ? 'android' : 'ios';
      });
    });
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // print(packageInfo);
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


  Future<void> prefer() async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // statusUser = preferences.getString('Status')!;
  }

  onSendBisName(String bisName) async {
    print('onSendOtpCidAndPhone');
    setState(() {
      isLoading = true;
      isBtnLoading = true;
      isEnableBisNameButton = false;
    });

    await AuthenticationService.getAzureLoginByBizName(bisName)
        .then((result){
      if (result.status == 200){
        setState(() {
          isLoading = false;
          isBtnLoading = false;
          enterpriseTextEditingController.text = '';
        });
        Navigation.shared.toBizNameLoginWebView(context, result.azureLoginByBizNameModel?.link,(String webUrl){
          startTimer();
          Uri url = Uri.parse(webUrl);
          Map<String, String> params = url.queryParameters;
          print(params);
          setState(() {
            enterpriseCode = params['code'] ?? '';
            String? connectCode = '';
            if (enterpriseCode!.length >= 50){
              connectCode = enterpriseCode?.substring(enterpriseCode!.length - 50);
            }else{
              connectCode = enterpriseCode;
            }
            print("enterpriseCode $connectCode");
            connectServer(connectCode ?? '');
            isLoading = true;
            isLoginByEnterprise = false;
          });
        }) ;
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
                setState(() {
                  isBtnLoading = false;
                  isLoading = false;
                  isEnableBisNameButton = enterpriseTextEditingController.text.isNotEmpty ? true : false;
                });
              },
            ));
      }
    });

  }

  onSendReqOPT(phoneNumber) async {
    setState(() {
      isLoading = true;
      isEnablePhoneButton = false;
    });
    var request = OtpLoginRegisRequest();
    request.phone = phoneNumber;
    request.code = enterpriseCode ?? '';

    await AuthenticationService.postAzureReqOtpLoginRegister(request)
        .then((result) => {
      print("reqOtpModelssss ${result.reqOtpModel} "),
      if (result.status == 200)
        {
          setState(() {
            reqOtpModel = result.reqOtpModel;
          }),
          if (result.reqOtpModel?.typeOtp == "select accounts")
            {
              Navigation.shared.toSendOtpPage(context, 'select accounts',phoneNumber,'',reqOtpModel!,ReqCidPhoneModel(),'enterpriseLogin'),
            }else if (result.reqOtpModel?.typeOtp == "register"){
            onShowConsent(phoneNumber),
          }else
            {
              Navigation.shared.toSendOtpPage(context,result.reqOtpModel!.typeOtp ?? 'login',phoneNumber,'',reqOtpModel!,ReqCidPhoneModel(),'enterpriseLogin'),
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
        isLoading = false;
        isEnablePhoneButton = true;
      }),
    });
  }

  checkIsLogin(String enterpriseCode) async {
    print("checkIsLogin $enterpriseCode");
    await AuthenticationService.getAzureCheckIsLogin(enterpriseCode)
        .then((result){
      setState(() {
        isLoading = true;
      });
      if (result.status == 200){
        print('azureCheckIsLoginModel ${result.azureCheckIsLoginModel!.isLogin}');
        setState(() {
          firstName = result.azureCheckIsLoginModel?.firstName;
          lastName = result.azureCheckIsLoginModel?.lastName;
          if (result.azureCheckIsLoginModel?.mobileNo != ''){
            String? showPhoneNumber = result.azureCheckIsLoginModel?.mobileNo?.replaceAllMapped(RegExp(r'(\d{3})(\d{3})(\d+)'), (Match m) => "${m[1]}-${m[2]}-${m[3]}");
            phoneNumberTextEditingController.text = showPhoneNumber ?? '';
            var userPhoneNumberInCid = phoneNumberTextEditingController.text.replaceAll("-", "");
            if (userPhoneNumberInCid.length == 10) {
              isEnablePhoneButton = true;
              setState(() {
                userPhoneNumber = userPhoneNumberInCid;
              });
            } else {
              isEnablePhoneButton = false;
            }
          }
        });
        if (result.azureCheckIsLoginModel!.isLogin == true){
          onPostAzureLoginWithCodeRequest(enterpriseCode ?? '');
        }
        else{
          setState(() {
            isONOpenOTPPage = true;
            isLoading = false;
            isBtnLoading = false;
          });
        }
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
              },
            ));
        setState(() {
          isLoading = false;
          isLoginByEnterprise = true;
          enterpriseTextEditingController.clear();
          isEnableBisNameButton = false;
          isBtnLoading = false;
          _start = 30;
          client.disconnect();
          CustomSnack.show(context, 'Login Error'.tr + '\n' + 'Please Reconnect.'.tr);
        });
      }


    });
  }

  onPostAzureLoginWithCodeRequest(String enterpriseCode) async {
    setState(() {
      isLoading = true;
    });
    print("checkIsLogin $enterpriseCode");
    AzureLoginWithCodeRequest request  = AzureLoginWithCodeRequest();
    request.code = enterpriseCode ;
    request.versionApp = currentVersion ?? '';
    request.typeApp = appPlatform ?? '';

    await AuthenticationService.postAzureLoginWithCodeAzure(request)
        .then((result) async {

      if (result.status == 200){
        setState(() {
          isLoading = false;
        });
        if (result.loginActionModel?.actionType == 'go_to_biz') {
          print('go to biz if start2 ${result.loginActionModel?.isLockBiz}');
          if (result.loginActionModel?.isLockBiz ?? false){
            Navigation.shared.toMyHomePageWithActionLockBiz(context, result.loginActionModel?.businessId ?? '');
          }
          else{
            await LocalStorageManager.saveCurrentBis(result.loginActionModel?.businessId ?? '').then((value) => {
              Navigation.shared.toMyHomePageWithActionJumpToBis(
                  context,
                  result.loginActionModel?.actionType ?? '',
                  result.loginActionModel?.businessId ?? '')
            });
          }
        }
        else{
          Navigation.shared.toMyHomePage(context);
        }
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

              },
            ));
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  void onShowConsent(String phoneNumber) {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        enableDrag: false,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
        builder: (BuildContext context) {
          return BottomSheetTermsAndConditions(
            callBack: ((statusAccept) {
              if (statusAccept) {
                Navigation.shared.toSendOtpPage(context,reqOtpModel!.typeOtp ?? 'register',phoneNumber,'',reqOtpModel!,ReqCidPhoneModel(),'enterpriseLogin');
              }
            }),
            companyPicture: '',
            actionInPage: '',
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
    print('onLoginUsername(');
    print(request.username);
    print(request.password);

    await AuthenticationService.postLogin(request).then((result) => {
      if (result.status == 200)
        {
          print('result.status'),
          isLoginError = false,
          Navigation.shared.toMyHomePage(context),
        }
      else
        {
          setState(() {
            isLoginError = true;
            userNameChecker.currentState!.validate();
            passwordFormChecker.currentState!.validate();
          }),
          // showDialog(
          //     context: context,
          //     builder: (BuildContext context) => AlertPopup(
          //           description: result.message.toString().tr,
          //           icon: Icons.error_outline_outlined,
          //           title: "Login Error",
          //           callBack: () {
          //             // Navigator.of(context).pop();
          //           },
          //         ))
        },
      setState(() {
        isBtnLoading = false;
        isEnableUsernameButton = true;
      }),

      // isEnabled = true;
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

  onOpenChatPluginBottomSheet(String urlString) async {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.0))),
        isScrollControlled: true,
        isDismissible: true,
        enableDrag:false,
        // useSafeArea: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return BottomSheetChatPlugin(urlString: urlString,);
        });
  }

  void startTimer() {
    // timer.cancel();
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec, (Timer timer) {
      setState(() {
        _start--;
        print('_start >>$_start');
        if(_start <= 0){
          setState(() {
            isLoading = false;
            isLoginByEnterprise = true;
            enterpriseTextEditingController.clear();
            isEnableBisNameButton = false;
            isBtnLoading = false;
            _timer.cancel();
            _start = 30;
            client.disconnect();
            CustomSnack.show(context, '${'Connection Timed Out'.tr}\n${'Please Reconnect.'.tr}');
          });
        }
      });
    },
    );
  }

}
