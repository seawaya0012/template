import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:io';
import '../../../navigation.dart';
import '../../api/model/authentication/req_cid_phone_model.dart';
import '../../api/model/authentication/req_otp_model.dart';
import '../../api/request/authentication/login_cid_and_phone_request.dart';
import '../../api/request/authentication/login_register_cid_and_phone_request.dart';
import '../../api/request/authentication/otp_login_regis_request.dart';
import '../../api/request/authentication/send_otp_request.dart';
import '../../api/service/authentication_service.dart';
import '../../appManager/app_theme.dart';
import '../../appManager/local_storage_manager.dart';
import '../../widget/alertpopupDialog/alert_popup.dart';
import '../../widget/appbar/base_appbar.dart';
import '../../widget/button/gradient_button.dart';

class SendOtpPage extends StatefulWidget {
  final String typeOtp;
  final String phoneNumber;
  final String idCard;
  final ReqOtpModel reqOtpModel;
  final ReqCidPhoneModel reqCidPhoneModel;
  final String supTypeOtp;

  const SendOtpPage(
      {Key? key,
        required this.typeOtp,
        required this.phoneNumber,
        required this.reqOtpModel, required this.reqCidPhoneModel, required this.idCard, required this.supTypeOtp})
      : super(key: key);

  @override
  State<SendOtpPage> createState() => _SendOtpPageState();
}

class _SendOtpPageState extends State<SendOtpPage> {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";
  bool isEnable = false,
      isBtnLoading = false,
      isDarkMode = false;

  String? currentVersion = '',
      appPlatform = '';
  int _start = 60;

  bool checkOtpTimeSuccess = true;

  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setStatusBar();
    setCurrentVersion();
    startTimer();
    print('widget.reqOtpModel.toString() >>${widget.reqOtpModel.toString()}');
    print('widget.reqOtpModel.toString() >>${widget.reqCidPhoneModel.toString()}');
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
  setStatusBar() async {
    ThemeProvider().isDarkMode.then((value) => {
      setState(() {
        print('isDarkMode');
        print(isDarkMode);
        isDarkMode = value;
      })
    });
    // var bisbgColor = ThemeProvider().hexToColor('code');
    // print(bisbgColor);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(appbarTitle: 'Back'.tr,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 24),
                  child: Image.asset(
                    'assets/icon/icon_pic_otp.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Text(
                  'Enter OTP'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  'Enter 6 Digit OTP which sent to number'.tr +
                      ' ${widget.phoneNumber.toString()}',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).disabledColor),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(24, 16, 24, 0),
                child: PinCodeTextField(
                  keyboardType: TextInputType.number,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeColor: Theme.of(context).primaryColor,
                      selectedColor: Theme.of(context).primaryColor,
                      inactiveColor: Theme.of(context).disabledColor,
                      activeFillColor: Colors.transparent,
                      selectedFillColor: Colors.transparent,
                      disabledColor: Theme.of(context).disabledColor,
                      inactiveFillColor: Colors.transparent),
                  animationDuration: const Duration(milliseconds: 300),
                  // backgroundColor: Theme.of(context).backgroundColor,
                  enableActiveFill: true,
                  controller: textEditingController,
                  onCompleted: (v) {
                    debugPrint("Completed");
                    print('onCompleted');
                    print(v);
                    setState(() {
                      isEnable = true;
                    });
                  },
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      if (value.length < 6) {
                        isEnable = false;
                      }
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print('beforeTextPaste');
                    print(text);
                    return true;
                  },
                  appContext: context,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(32, 0, 32, 8),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        'If not received, please press'.tr,
                        style: TextStyle(
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.5),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    checkOtpTimeSuccess ?
                    Row(
                      children: [
                        Text(' Resend OTP in'.tr, style: TextStyle(color: Theme.of(context).disabledColor.withOpacity(0.5), fontSize: 12, fontWeight: FontWeight.w400),),
                        Text(' $_start', style: TextStyle(color: Theme.of(context).disabledColor.withOpacity(0.5), fontSize: 12, fontWeight: FontWeight.w400),)],)
                        :
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          checkOtpTimeSuccess = true;
                        });
                        print('reSendReqOTP');
                        widget.idCard.isEmpty ? onSendReqOTP(widget.phoneNumber) : onLoginByCidAndPhone(widget.idCard,widget.phoneNumber);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Text(
                          'sent OTP again'.tr,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context)
                                  .disabledColor
                                  .withOpacity(0.5),
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(32, 16, 32, 8),
                height: 48,
                child: GradientButton(
                  title: 'Continue'.tr,
                  isEnable: isEnable,
                  callBack: () {
                    print('context');
                    print(currentText);

                    print('reqOtpModel.refcode >>${widget.reqOtpModel.refcode.toString().isNotEmpty}');
                    widget.reqOtpModel.refcode.toString().isNotEmpty ?
                    widget.supTypeOtp == 'enterpriseLogin' ? onSendOtpEnterpriseLogin(currentText):onSendOtp(currentText) : onSendOtpCidAndPhone(currentText);
                  },
                  isBtnLoading: isBtnLoading,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec, (Timer timer) {
      setState(() {
        _start--;
        print('_start >>$_start');
        if (_start <= 0) {
          setState(() {
            checkOtpTimeSuccess = false;
            _timer.cancel();
            _start = 60;
          });
        }
      },
      );
    },
    );
  }

  onSendReqOTP(phoneNumber) async {
    var request = OtpLoginRegisRequest();
    request.phone = phoneNumber;
    request.typeOtp = widget.typeOtp.toString();

    await AuthenticationService.postReqOTPLoginRegisV2(request)
        .then((result) => {
      if (result.status == 200)
        {
          startTimer()
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
  }

  //re sent cid
  onLoginByCidAndPhone(String idCard, String phoneNumber)async{
    LoginCidAndPhoneRequest request = LoginCidAndPhoneRequest();
    request.idCard = idCard;
    request.phone = phoneNumber;
    await AuthenticationService.postLoginRegisterCidAndPhoneNumber(request).then((result){
      setState(() {
        if(result.status == 200){
          startTimer();
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertPopup(
                description: result.message.toString().tr,
                icon: Icons.error_outline_outlined,
                title: "Login Error",
                callBack: () {
                  // Navigator.of(context).pop();
                },
              ));
        }
      });
    });
  }

  onSendOtp(otpCode) async {
    print('onSendOtp');
    setState(() {
      isBtnLoading = true;
      isEnable = false;
    });
    var request = SendOtpRequest();
    request.otp = otpCode;
    request.consentStatus = "T";
    request.typeOtp = widget.typeOtp;
    request.phone = widget.phoneNumber;
    request.mobileRefId = widget.reqOtpModel.mobileRefId ?? "";

    request.typeApp = appPlatform ?? '';
    request.versionApp = currentVersion ?? '';


    await AuthenticationService.postLoginRegisterPhone(request)
        .then((result) => {
      if (result.status == 200){
        if (widget.typeOtp == 'login' ) {
          Navigation.shared.toMyHomePage(context)
        }else if(widget.typeOtp == 'select accounts'){
          Navigation.shared.toSelectAccountPage(context,result.duplicateAccountsList ?? [],widget.phoneNumber,widget.reqOtpModel,widget.supTypeOtp)
        }else{
          Navigation.shared.toRegisterCompletePage(context)
        }
      }
      else
        {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertPopup(
                description: result.message.toString().tr,
                icon: Icons.error_outline_outlined,
                title: widget.typeOtp == 'register' ? "Register Error" : "Login Error",
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

  onSendOtpEnterpriseLogin(otpCode) async {
    print('onSendOtp');
    setState(() {
      isBtnLoading = true;
      isEnable = false;
    });
    var request = SendOtpRequest();
    request.otp = otpCode;
    request.consentStatus = "T";
    request.typeOtp = widget.typeOtp;
    request.phone = widget.phoneNumber;
    request.mobileRefId = widget.reqOtpModel.mobileRefId ?? "";

    request.otpUid = widget.reqOtpModel.otpUid ?? "";

    request.typeApp = appPlatform ?? '';
    request.versionApp = currentVersion ?? '';


    await AuthenticationService.postAzureLoginRegisterPhone(request)
        .then((result) async => {
      if (result.status == 200){
        if(widget.typeOtp == 'select accounts'){
          Navigation.shared.toSelectAccountPage(context,result.duplicateAccountsList ?? [],widget.phoneNumber,widget.reqOtpModel,widget.supTypeOtp)
        }else{
          print('go to biz ${result.loginActionModel?.actionType}'),
          if (result.loginActionModel?.actionType == 'go_to_biz')
            {
              print('go to biz if start'),
              if (result.loginActionModel?.isLockBiz ?? false){
                Navigation.shared.toMyHomePageWithActionLockBiz(context, result.loginActionModel?.businessId ?? '')
              }else{
                await LocalStorageManager.saveCurrentBis(result.loginActionModel?.businessId ?? '').then((value) => {
                  Navigation.shared.toMyHomePageWithActionJumpToBis(context, result.loginActionModel?.actionType ?? '', result.loginActionModel?.businessId ?? '')
                })
              }

            } else{
            Navigation.shared.toMyHomePage(context)
          }
        }
      }
      else
        {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertPopup(
                description: result.message.toString().tr,
                icon: Icons.error_outline_outlined,
                title: widget.typeOtp == 'register' ? "Register Error" : "Login Error",
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

  onSendOtpCidAndPhone(String otpCode) async {
    print('onSendOtpCidAndPhone');
    setState(() {
      isBtnLoading = true;
      isEnable = false;
    });
    var request = LoginRegisterCidAndPhoneRequest();

    request.consentStatus = "T";
    request.mobileRefId = widget.reqCidPhoneModel.mobileRefId ?? "";
    request.oneId = "";
    request.otp = otpCode;
    request.otpUid = widget.reqCidPhoneModel.otpUid ?? "";
    request.phone = widget.phoneNumber;
    request.typeApp = appPlatform ?? '';
    request.typeOtp = widget.typeOtp;
    request.versionApp = currentVersion ?? '';


    await AuthenticationService.postLoginRegisterCidAndPhone(request)
        .then((result){
      if (result.status == 200){
        if (widget.typeOtp == 'login' ) {
          Navigation.shared.toMyHomePage(context);
        }else if(widget.typeOtp == 'select accounts'){
          print('select accounts');
          Navigation.shared.toSelectAccountPage(context,result.duplicateAccountsList ?? [],widget.phoneNumber,ReqOtpModel(),widget.supTypeOtp);
          // Navigation.shared.toSelectAccountPage(context,result.duplicateAccountsList ?? [],widget.phoneNumber,widget.reqOtpModel);
        }else{
          print('else');
          Navigation.shared.toRegisterCompletePage(context);
        }
      }
      else
      {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertPopup(
              description: result.message.toString().tr,
              icon: Icons.error_outline_outlined,
              title: widget.typeOtp == 'register' ? "Register Error" : "Login Error",
              callBack: () {
                Navigator.of(context).pop();
              },
            ));
      }
    });
    setState(() {
      isBtnLoading = false;
    });
  }
}
