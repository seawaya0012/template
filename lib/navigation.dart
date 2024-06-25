
import 'package:flutter/material.dart';
import 'package:oneplatformtemplate/template/api/model/authentication/duplicate_accounts_model.dart';
import 'package:oneplatformtemplate/template/api/model/authentication/req_cid_phone_model.dart';
import 'package:oneplatformtemplate/template/api/model/authentication/req_otp_model.dart';
import 'package:oneplatformtemplate/template/api/model/business/check_have_firstname_and_lastname_model.dart';
import 'package:oneplatformtemplate/template/api/model/consent/consent_app_model.dart';
import 'package:oneplatformtemplate/template/page/authentication/login_page.dart';
import 'package:oneplatformtemplate/template/page/authentication/register_page.dart';
import 'package:oneplatformtemplate/template/page/authentication/send_otp_v2_page.dart';
import 'package:oneplatformtemplate/template/page/authentication/subpage/enterpriseLogin/enterprise_login_page.dart';
import 'package:oneplatformtemplate/template/page/authentication/subpage/register_complete_page.dart';
import 'package:oneplatformtemplate/template/page/authentication/subpage/select_account_page.dart';
import 'package:oneplatformtemplate/template/page/home/blank_page.dart';
import 'package:oneplatformtemplate/template/page/home/home_page.dart';
import 'package:oneplatformtemplate/template/page/home/servicepage/example_page.dart';
import 'package:oneplatformtemplate/template/page/home/setting/setting_page.dart';
import 'package:oneplatformtemplate/template/page/home/setting/subpage/consent/consent_html_page.dart';
import 'package:oneplatformtemplate/template/page/home/setting/subpage/edit_profile_page.dart';
import 'package:oneplatformtemplate/template/page/home/setting/subpage/font_page.dart';
import 'package:oneplatformtemplate/template/page/home/setting/subpage/language_page.dart';
import 'package:oneplatformtemplate/template/page/home/setting/subpage/theme_page.dart';
import 'package:oneplatformtemplate/template/page/webview/biz_name_login_web_view_page.dart';
import 'package:oneplatformtemplate/template/widget/alertpopupDialog/input_firstname_lastname_dialog.dart';
import 'package:page_transition/page_transition.dart';

import 'main.dart';

class Navigation {
  static Navigation shared = Navigation();

  //Setting
  final currentContext = GlobalVariable.navState.currentContext!;

  void toMyHomePage(context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(
                selectPage: 0,
                actionType: '',
                businessId: '',
                isDefaultApp: false)));
  }

  void toFirstMyHomePage(context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(
                selectPage: 0,
                actionType: '',
                businessId: '',
                isDefaultApp: true)));
  }

  void backToMyHomePage(context) {
    Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.leftToRight,
            duration: Duration(milliseconds: 100),
            child: MyHomePage(
                selectPage: 0,
                actionType: '',
                businessId: '',
                isDefaultApp: false)));
  }

  void toMyHomeSettingPage(context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(
                selectPage: 1,
                actionType: '',
                businessId: '',
                isDefaultApp: false)));
  }

  void toMyHomePageWithActionJumpToBis(
      context, String actionType, String businessId) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(
                selectPage: 0,
                actionType: actionType,
                businessId: businessId,
                isDefaultApp: false)));
  }

  void toMyHomePageWithActionLockBiz(context, String businessId) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(
                selectPage: 0,
                actionType: 'is_lock_biz',
                businessId: businessId,
                isDefaultApp: false)));
  }

  void toLoginPage(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void toEnterpriseLoginPage(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => EnterpriseLoginPage()));
  }


  void toSettingPage(context, VoidCallback callbackFunc) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SettingPage(
                  callBackFunc: callbackFunc,
                )));
  }

  // void toSetDefaultAppPage(context, VoidCallback callbackFunc) {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => SetDefaultAppPage()));
  // }

  void toLanguagePage(context, VoidCallback callbackFunc) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LanguagePage(
                  callbackfunc: callbackFunc,
                )));
  }

  void toThemePage(context, VoidCallback refreshCallBackFunc) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ThemePage(
                  callbackfunc: refreshCallBackFunc,
                )));
  }

  void toFontPage(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FontPage()));
  }

  void toSelectAccountPage(
      context,
      List<DuplicateAccountsModel> duplicateAccountsList,
      String phone,
      ReqOtpModel reqOtpModel,
      String supType) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SelectAccountPage(
                  duplicateAccountsList: duplicateAccountsList,
                  phoneNumber: phone,
                  reqOtpModel: reqOtpModel,
                  supType: supType,
                )));
  }

  void toEditProfilePage(context, VoidCallback refreshCallBackFunc) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProfilePage(
                  callBackFunc: refreshCallBackFunc,
                )));
  }

  void toConsentHTMLPage(context, String title,ConsentAppModel consentModel) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            ConsentHTMLPage(title: title, consentModel: consentModel,)));
  }

  void toBizNameLoginWebView(context, urlString, Function(String) callBack) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BizNameLoginWebViewPage(
              urlString: urlString,
              callBack: callBack,
            )));
  }

  //หน้าสมัครสมาชิก
  void toRegisterPage(context, VoidCallback refreshCallBackFunc) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RegisterPage(
                  callbackfunc: refreshCallBackFunc,
                )));
  }

  void toRegisterCompletePage(context) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => RegisterCompletePage()));
  }

  //หน้าเข้าสู่ระบบสมัครสมาชิก
  void toAuthenticationPage(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }


  void toBlankPage(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BlankPage()));
  }

  void toSendOtpPage(
      context,
      String typeOtp,
      String phone,
      String idCard,
      ReqOtpModel reqOtpModel,
      ReqCidPhoneModel reqCidPhoneModel,
      String supTypeOtp) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SendOtpPage(
                  typeOtp: typeOtp,
                  phoneNumber: phone,
                  idCard: idCard,
                  reqOtpModel: reqOtpModel,
                  reqCidPhoneModel: reqCidPhoneModel,
                  supTypeOtp: supTypeOtp,
                )));
  }


  void showInputFirstnameLastnameDialog(
      context,
      CheckHaveFirstnameAndLastnameModel userData,
      VoidCallback callbackFunc,
      VoidCallback cancelCallbackFunc) {
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
        builder: (context) => InputFirstnameLastnameDialog(
              callbackFunc: callbackFunc,
              cancelCallbackFunc: cancelCallbackFunc,
              userData: userData,
            )));
  }

  void toExamplePage(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ExamplePage()));
  }
}
