import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../navigation.dart';
import '../appManager/local_storage_manager.dart';
import '../appManager/enum.dart';
import 'package:http/http.dart' as Http;

import '../widget/alertpopupDialog/alert_popup.dart';
import '../widget/alertpopupDialog/session_expired_dialog.dart';

class ApiManager {

  ApplicationEnv applicationEnv = ApplicationEnv.production;

  String get domainManageV1 {
    if (applicationEnv == ApplicationEnv.production) {
      return "https://one-platform.one.th/manage/api/v1/";
    } else if (applicationEnv == ApplicationEnv.uat) {
      return "https://oneplatform-uat.one.th/manage/api/v1/";
    } else if (applicationEnv == ApplicationEnv.dev) {
      return "https://oneplatform.korkla.in/manage/api/v1/";
    } else {
      return "";
    }
  }

  String get domainManageV2 {
    if (applicationEnv == ApplicationEnv.production) {
      return "https://one-platform.one.th/manage/api/v2/";
    } else if (applicationEnv == ApplicationEnv.uat) {
      return "https://oneplatform-uat.one.th/manage/api/v2/";
    } else if (applicationEnv == ApplicationEnv.dev) {
      return "https://oneplatform.korkla.in/manage/api/v2/";
    } else {
      return "";
    }
  }

  String get domainManageV1AppV2 {
    if (applicationEnv == ApplicationEnv.production) {
      return "https://one-platform.one.th/manage/api/v1/app-v2/";
    } else if (applicationEnv == ApplicationEnv.uat) {
      return "https://oneplatform-uat.one.th/manage/api/v1/app-v2/";
    } else if (applicationEnv == ApplicationEnv.dev) {
      return "https://oneplatform.korkla.in/manage/api/v1/app-v2/";
    } else {
      return "";
    }
  }

  String get centrifugeClient {
    if (applicationEnv == ApplicationEnv.production) {
      return "wss://one-platform.one.th/connection/websocket?format=protobuf";
    } else if (applicationEnv == ApplicationEnv.uat) {
      return "wss://oneplatform-uat.one.th/connection/websocket?format=protobuf";
    } else if (applicationEnv == ApplicationEnv.dev) {
      return "wss://oneplatform.korkla.in/connection/websocket?format=protobuf";
    } else {
      return "";
    }
  }

  String get centrifugeToken {
    if (applicationEnv == ApplicationEnv.production) {
      return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhbmRyb2lkIn0.yanfKA-HRl2a5NaVql4ngpTBCV5Pz8uD0E-PGatEaKc";
    } else if (applicationEnv == ApplicationEnv.uat) {
      return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhbmRyb2lkIn0.yanfKA-HRl2a5NaVql4ngpTBCV5Pz8uD0E-PGatEaKc";
    } else if (applicationEnv == ApplicationEnv.dev) {
      return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhbmRyb2lkIn0.yanfKA-HRl2a5NaVql4ngpTBCV5Pz8uD0E-PGatEaKc";
    } else {
      return "";
    }
  }

  String get dynamicLinkQrCode {
    if (applicationEnv == ApplicationEnv.production) {
      return 'oneplatformapp.page.link';
    } else if (applicationEnv == ApplicationEnv.uat) {
      return 'oneplatformapp.page.link';
    } else if (applicationEnv == ApplicationEnv.dev) {
      return 'oneplatformapp.page.link';
    } else {
      return "";
    }
  }

  String get dynamicLinkDomain {
    if (applicationEnv == ApplicationEnv.production) {
      return 'one-platform.one.th';
    } else if (applicationEnv == ApplicationEnv.uat) {
      return 'oneplatform-uat.one.th';
    } else if (applicationEnv == ApplicationEnv.dev) {
      return 'oneplatform.korkla.in';
    } else {
      return "";
    }
  }


  static String postLogin = 'login';
  static String postRegisterByQrcodeBMS = 'register-by-qrcode-bms';
  static String postAccountLogout = 'account/logout';
  static String postLoginRegisterPhone = 'login-register-phone';
  static String postReqOTPLoginRegis = 'req-otp-login-register';
  static String postRegisterUsername = 'register-username';
  static String getAccountDataAccount = 'account/data-account';
  static String postAccountSetActive = 'account/set-active';

  static String getAllAccount = 'all-account';

  static String getAzureLoginByBizName = 'azure/url-login-by-biz-name';
  static String getAzureCheckIsLogin = 'azure/check-is-login';
  static String postAzureReqOtpLoginRegister = 'azure/req-otp-login-register';
  static String postAzureLoginRegisterPhone = 'azure/login-register-phone';
  static String postAzureLoginWithCodeAzure = 'azure/login-with-code-azure';


  static String postRenewAccessToken = 'renew-access-token';
  static String putStatus = 'status';
  static String putDisplayName = 'account/update-display-name';
  static String postProfilePicture = 'profile-picture';

  static String postCheckHaveFirstnameAndLastname =
      'business/check-have-firstname-and-lastname';
  static String postAddFirstnameAndLastnameTh =
      'business/add-firstname-and-lastname-th';
  static String postRequestJoinBiz = 'business/request-join-biz';
  static String postAutoJoinBiz = 'business/auto-join-biz';
  static String postIsHaveBusiness = 'business/is-have-business';
  static String postAddToBizByQrcodeBms = 'add-to-biz-by-qrcode-bms';

  static String eventUser = 'oneplatform-update-user-data-';
  static String eventBusiness = 'oneplatform-update-business-';

  static String eventAzureData = 'azure-data-';

  static String getSubTopic = 'account/get-sub-topic';

  static String getCheckRule = 'app/check-rule';

  static String getConsentOnePlatform = 'consent/get-consent-oneplatform';
  static String getConsentOnePlatformUser = 'consent/get-consent-oneplatform-user';
  static String postSetConsentUser = 'consent/set-consent-user';
  static String getConsentService = 'consent/consent-service';
  static String postLoginRegisterCid = 'req-otp-login-by-cid';
  static String postLoginByCidAndPhone = 'login-register-by-cid-and-phone';
  //
  static String postLoginServiceQrcode = 'login-service-qrcode';

  String accessToken = "";

  Future<dynamic> requestGet(String domain, String apiName) async {
    String accessToken = "";

    await LocalStorageManager.getAccessToken().then((value) => {
      accessToken = value?.accessToken ?? "",
    });

    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: 'Bearer $accessToken'
    };

    Uri domainUri = Uri.parse(domain + apiName);
    Http.Response response = await Http.get(domainUri, headers: header);

    if (response.statusCode == 200) {
      var jsonBody = json.decode(utf8.decode(response.bodyBytes));
      return jsonBody;
    } else if (response.statusCode == 401) {
      return SessionExpiredDialog(
        accessToken: accessToken,
        deviceToken: '',
      );
    } else {
      var jsonBody = json.decode(utf8.decode(response.bodyBytes));
      return jsonBody;
    }
  }
  Future<dynamic> requestPost(String domain, String apiName, Map<String, dynamic> body) async {
    Uri domainUri = Uri.parse(domain + apiName);
    await LocalStorageManager.getAccessToken().then((value) => {
      accessToken = 'Bearer ${value?.accessToken ?? ""}',
    });
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: accessToken
    };
    Http.Response response =
    await Http.post(domainUri, headers: headers, body: jsonEncode(body));
    var responseBody = response.body;
    if (response.statusCode == 200) {
      var jsonBody = json.decode(utf8.decode(response.bodyBytes));
      return jsonBody;
    } else if (response.statusCode == 401 && accessToken != "Bearer ") {
      return SessionExpiredDialog(
        accessToken: accessToken,
        deviceToken: '',
      );
    } else {
      var jsonBody = json.decode(utf8.decode(response.bodyBytes));
      return jsonBody;
    }
  }
  Future<dynamic> requestPut(String domain, String apiName, Map<String, dynamic> body) async {
    Uri domainUri = Uri.parse(domain + apiName);
    await LocalStorageManager.getAccessToken().then((value) => {
      accessToken = 'Bearer ${value?.accessToken ?? ""}',
    });
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: accessToken
    };
    Http.Response response =
    await Http.put(domainUri, headers: headers, body: jsonEncode(body));
    var responseBody = response.body;
    if (response.statusCode == 200) {
      var jsonBody = json.decode(utf8.decode(response.bodyBytes));
      return jsonBody;
    } else if (response.statusCode == 401 && accessToken != "Bearer ") {
      return SessionExpiredDialog(
        accessToken: accessToken,
        deviceToken: '',
      );
    } else {
      var jsonBody = json.decode(utf8.decode(response.bodyBytes));
      return jsonBody;
    }
  }
  Future<dynamic> requestDelete(String domain, String apiName) async {
    Uri domainUri = Uri.parse(domain + apiName);

    await LocalStorageManager.getAccessToken().then((value) => {
      accessToken = 'Bearer ${value?.accessToken}',
    });
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: accessToken
    };

    Http.Response response = await Http.delete(domainUri, headers: headers);

    var responseBody = response.body;
    if (response.statusCode == 200) {
      var jsonBody = json.decode(utf8.decode(response.bodyBytes));
      return jsonBody;
    } else if (response.statusCode == 401) {
      return SessionExpiredDialog(
        accessToken: accessToken,
        deviceToken: '',
      );
    } else {
      var jsonBody = json.decode(utf8.decode(response.bodyBytes));
      return jsonBody;
    }
  }
  Future<dynamic> requestGetwithParams(String domain, String apiName, Map<String, String> params) async {
    String accessToken = "";

    await LocalStorageManager.getAccessToken().then((value) => {
      accessToken = value?.accessToken ?? "",
    });

    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: 'Bearer $accessToken'
    };

    Uri domainUri =
    Uri.parse(domain + apiName).replace(queryParameters: params);
    Http.Response response = await Http.get(domainUri, headers: header);

    if (response.statusCode == 200) {
      var jsonBody = json.decode(utf8.decode(response.bodyBytes));
      return jsonBody;
    } else if (response.statusCode == 401) {
      return SessionExpiredDialog(
        accessToken: accessToken,
        deviceToken: '',
      );
    } else {
      throw Exception('Failed to load List');
    }
  }
  Future<dynamic> requestPostWithoutAccessToken(String domain, String apiName, Map<String, dynamic> body) async {
    Uri domainUri = Uri.parse(domain + apiName);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Http.Response response =
    await Http.post(domainUri, headers: headers, body: jsonEncode(body));
    var responseBody = response.body;
    if (response.statusCode == 200) {
      var jsonBody = json.decode(utf8.decode(response.bodyBytes));
      return jsonBody;
    } else if (response.statusCode == 401) {
      return SessionExpiredDialog(
        accessToken: accessToken,
        deviceToken: '',
      );
    } else {
      var jsonBody = json.decode(utf8.decode(response.bodyBytes));
      return jsonBody;
    }
  }
  Future<dynamic> requestDeleteWithBody(String domain, String apiName, Map<String, dynamic> body) async {
    Uri domainUri = Uri.parse(domain + apiName);
    await LocalStorageManager.getAccessToken().then((value) => {
      accessToken = 'Bearer ${value?.accessToken ?? ""}',
    });
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: accessToken
    };
    Http.Response response =
    await Http.delete(domainUri, headers: headers, body: jsonEncode(body));
    var responseBody = response.body;
    if (response.statusCode == 200) {
      var jsonBody = json.decode(utf8.decode(response.bodyBytes));
      return jsonBody;
    } else if (response.statusCode == 401 && accessToken != "Bearer ") {
      return SessionExpiredDialog(
        accessToken: accessToken,
        deviceToken: '',
      );
    } else {
      var jsonBody = json.decode(utf8.decode(response.bodyBytes));
      return jsonBody;
    }
  }

}
