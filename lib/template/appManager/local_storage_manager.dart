import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import '../api/model/authentication/account_model.dart';
import '../api/model/business/business_model.dart';
import '../api/model/notification/sub_topic_list_model.dart';
import '../api/model/serviceApp/oneplatform_new_model.dart';
import '../api/model/serviceApp/oneplatform_app_account_model.dart';
import '../api/request/authentication/renew_access_token_request.dart';
import '../api/request/serviceApp/save_default_app_requast.dart';
import '../api/response/authentication/login_response.dart';
import '../api/response/serviceApp/oneplatform_app_account_response.dart';
import '../api/service/authentication_service.dart';
import '../widget/alertpopupDialog/session_expired_dialog.dart';

class LocalStorageManager {
  static final LocalStorage storage = new LocalStorage('MyApp');

  static final String ACCOUNT = 'ACCOUNT';
  static final String DEFAULTAPP = 'DEFAULTAPP';
  static final String ISONDEFAULTAPP = 'ISONDEFAULTAPP';
  static final String ISONORGANIZETHEME = 'ISONORGANIZETHEME';
  static final String SUBSCRTBRTOPIC = 'SUBSCRTBRTOPIC';
  static final String DEFAULTACCOUNT = 'DEFAULTACCOUNT';
  static final String ACCESSTOKEN = 'ACCESSTOKEN';
  static final String DEEPLINK = 'DEEPLINK';
  static final String ACCESSTOKENPRIVATECHAT = 'ACCESSTOKENPRIVATECHAT';
  static final String PROFILE = 'PROFILE';
  static final String CHATSERVICEDATA = 'CHATSERVICEDATA';
  static final String ALLACCOUNT = 'ALLACCOUNT';
  static final String BIOMETRIC = 'BIOMETRIC';
  static final String SERVICE = 'SERVICE';
  static final String BOTUSERPROFILE = 'BOTUSERPROFILE';

  static final String CURRENTBIS  = 'CURRENTBIS';
  static final String LOCKBIZ  = 'LOCKBIZ';

  //
  static final String BUSINESSID  = 'BUSINESSID';
  static final String URLDOWNLOAD = 'URLDOWNLOAD';


  static Future<void> saveAccount(dynamic value) async {
    await storage.ready;
    return storage.setItem(ACCOUNT, value);
  }

  static Future<AccountModel?> getAccount() async {
    await storage.ready;
    var getAcc = storage.getItem(ACCOUNT);
    if (getAcc == null) {
      var response = AccountModel();
      return response;
    }
    Map<String, dynamic> storageData = Map<String, dynamic>.from(getAcc);
    var response = LoginResponse.fromJson(storageData);

    return response.accountModel ?? AccountModel();
  }

  static Future<List<BusinessModel>> getBusinessList() async {
    await storage.ready;
    var getAcc = storage.getItem(ACCOUNT);
    if (getAcc == null) {
      return [];
    }
    Map<String, dynamic> storageData = Map<String, dynamic>.from(getAcc);
    var response = LoginResponse.fromJson(storageData);
    print('response getBusinessList');
    print(getAcc);
    return response.businessList;
  }

  static Future<void> saveAllAccountList(dynamic value) async {
    await storage.ready;
    return storage.setItem(ALLACCOUNT, value);
  }

  static Future<List<BusinessProfileModel>> getAllAccountList() async {
    await storage.ready;
    var getAcc = storage.getItem(ALLACCOUNT);
    if (getAcc == null) {
      return [];
    }
    List<BusinessProfileModel> allAccountList = [];
    Map<String, dynamic> storageData = Map<String, dynamic>.from(getAcc);
    var response = AllAccountResponse.fromJson(storageData);
    allAccountList.addAll(response.privateAccountList);
    allAccountList.addAll(response.privateWaitApproveAccountList);
    return allAccountList;
  }

  static Future<void> saveUrlDownload(dynamic value) async {
    await storage.ready;
    return storage.setItem(URLDOWNLOAD, value);
  }

  static Future<List<String>> getUrlDownload() async {
    await storage.ready;
    var getUrlList = storage.getItem(URLDOWNLOAD);
    if (getUrlList == null) {
      return [];
    }
    List<String> urlList = [];

    getUrlList.map((data) => getUrlList).toList();
    urlList = getUrlList.cast<String>();
    return urlList;
  }

  static Future<List<String>> getAllAccountIDList() async {
    await storage.ready;
    var getAcc = storage.getItem(ALLACCOUNT);
    if (getAcc == null) {
      return [];
    }
    List<BusinessProfileModel> allAccountList = [];
    List<String> accountIDList = [];
    Map<String, dynamic> storageData = Map<String, dynamic>.from(getAcc);
    var response = AllAccountResponse.fromJson(storageData);
    allAccountList.addAll(response.privateAccountList);
    allAccountList.addAll(response.privateWaitApproveAccountList);
    for (var i = 0; i < allAccountList.length; i++) {
      accountIDList.add(allAccountList[i].businessId ?? '');
    }
    return accountIDList;
  }

  static Future<void> saveAccessToken(dynamic value) async {
    await storage.ready;
    return storage.setItem(ACCESSTOKEN, value);
  }

  static Future<RenewAccessTokenRequest?> getAccessToken() async {
    await storage.ready;
    var getToken = storage.getItem(ACCESSTOKEN);
    if (getToken == null) {
      var response = RenewAccessTokenRequest();
      return response;
    }
    Map<String, dynamic> storageData = Map<String, dynamic>.from(getToken);
    var response = RenewAccessTokenRequest.fromJson(storageData);
    bool accessTokenExpired = Jwt.isExpired(response.accessToken);
    bool refreshTokenExpired = Jwt.isExpired(response.refreshToken);

    if (refreshTokenExpired == true) {
      String deviceToken = await FirebaseMessaging.instance.getToken() ?? "";
      return LocalStorageManager()
          .refreshLogin(response.accessToken, deviceToken);
    } else {
      if (accessTokenExpired == true) {
        RenewAccessTokenRequest requestReNew = RenewAccessTokenRequest();
        requestReNew.refreshToken = response.refreshToken;
        requestReNew.accessToken = response.accessToken;
        await AuthenticationService.postRenewAccessToken(requestReNew,
            (reAccessToken) async {
          var getTokenRenew = storage.getItem(ACCESSTOKEN);
          if (getTokenRenew == null) {
            var response = RenewAccessTokenRequest();
            return response;
          }
          return getTokenRenew;
        });
      } else {
        return response;
      }
    }
  }
  //New UI
  ////

  static Future<void> saveDefaultApp(NewServiceModel model) async {
    dynamic value = model.toJson();
    await storage.ready;
    var isOnDefaultAppRequest =
    IsOnDefaultAppRequest({'status': 'save', 'message': 'isOn'});
    await LocalStorageManager.saveIsOnDefaultApp(isOnDefaultAppRequest);
    return storage.setItem(DEFAULTAPP, value);
  }

  static Future<NewServiceModel?> getDefaultApp() async {
    await storage.ready;
    var getApp = storage.getItem(DEFAULTAPP);
    if (getApp == null) {
      var response = NewServiceModel();
      return response;
    }
    Map<String, dynamic> storageData = Map<String, dynamic>.from(getApp);
    var response = NewServiceModel.fromJson(storageData);

    return response;
  }

  static void clearDefaultApp() async {
    await storage.ready;
    await storage.deleteItem(DEFAULTAPP);
    var isOnDefaultAppRequest =
        IsOnDefaultAppRequest({'status': 'unSave', 'message': 'isOff'});
    await LocalStorageManager.saveIsOnDefaultApp(isOnDefaultAppRequest);

  }

  static Future<void> saveIsOnDefaultApp(IsOnDefaultAppRequest model) async {
    dynamic value = model.toJson();
    await storage.ready;
    return storage.setItem(ISONDEFAULTAPP, value);
  }

  static Future<String> getIsOnDefaultApp() async {
    await storage.ready;
    var getIsOnDefaultApp = storage.getItem(ISONDEFAULTAPP);
    if (getIsOnDefaultApp == null) {
      return "";
    }
    Map<String, dynamic> storageData =
        Map<String, dynamic>.from(getIsOnDefaultApp);
    var response = IsOnDefaultAppRequest.fromJson(storageData);
    String? isOnDefaultApp = response.message;
    return isOnDefaultApp;
  }

  static Future<void> saveDefaultAccount(BusinessProfileModel model) async {
    dynamic value = model.toJson();
    await storage.ready;
    return storage.setItem(DEFAULTACCOUNT, value);
  }

  static Future<BusinessProfileModel?> getDefaultAccount() async {
    await storage.ready;
    var getAccount = storage.getItem(DEFAULTACCOUNT);
    if (getAccount == null) {
      var response = BusinessProfileModel();
      return response;
    }
    Map<String, dynamic> storageData = Map<String, dynamic>.from(getAccount);
    var response = BusinessProfileModel.fromJson(storageData);

    return response;
  }


  static Future<void> saveFontSize(IsOnDefaultAppRequest model) async {
    dynamic value = model.toJson();
    await storage.ready;
    return storage.setItem(ISONDEFAULTAPP, value);
  }

  static Future<String> getFontAndLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final String fontSize = prefs.getString('font_size_val') ?? '1';
    final String languageCode = prefs.getString('language_code') ?? 'th';
    String? fontSizeAndLanguageCode =
        "app_font=$fontSize&app_lang=$languageCode";

    return fontSizeAndLanguageCode;
  }

  static Future<void> saveIsOnOrganizeTheme(IsOnDefaultAppRequest model) async {
    dynamic value = model.toJson();
    await storage.ready;
    print("saveDefaultAPP");
    print(value);
    return storage.setItem(ISONORGANIZETHEME, value);
  }

  static Future<String> getIsOnOrganizeTheme() async {
    await storage.ready;
    var getIsOnDefaultApp = storage.getItem(ISONORGANIZETHEME);
    if (getIsOnDefaultApp == null) {
      return "";
    }
    Map<String, dynamic> storageData =
        Map<String, dynamic>.from(getIsOnDefaultApp);
    var response = IsOnDefaultAppRequest.fromJson(storageData);
    String? isOnDefaultApp = response.message;
    print('isOnDefaultAppSS');
    print(isOnDefaultApp);
    return isOnDefaultApp;
  }

  static Future<void> saveSubscribeTopic(SubTopicListModel model) async {
    dynamic value = model.toJson();
    await storage.ready;
    print("saveDefaultAPP");
    print(value);
    return storage.setItem(SUBSCRTBRTOPIC, value);
  }

  static Future<SubTopicListModel> getSubscribeTopic() async {
    await storage.ready;
    var getSubscribeTopicData = storage.getItem(SUBSCRTBRTOPIC);
    if (getSubscribeTopicData == null) {
      var response = SubTopicListModel();
      return response;
    }
    Map<String, dynamic> storageData =
        Map<String, dynamic>.from(getSubscribeTopicData);
    print("getSubscribeTopic ");
    var response = SubTopicListModel.fromJson(storageData);

    return response;
  }

  static Future<void> saveIsOnBioMetric(bool value) async {
    await storage.ready;
    print('saveBiometric');
    print(value);
    return storage.setItem(BIOMETRIC, value);
  }

  static Future<bool> getIsOnBioMetric() async {
    await storage.ready;
    var getIsBioMetric = storage.getItem(BIOMETRIC);
    return getIsBioMetric?? false;
  }

  static Future<void> saveIsLockBiz(bool value) async {
    await storage.ready;
    print('saveIsLockBiz');
    print(value);
    return storage.setItem(LOCKBIZ, value);
  }

  static Future<bool> getIsLockBiz() async {
    await storage.ready;
    var getIsLockBiz = storage.getItem(LOCKBIZ);
    return getIsLockBiz?? false;
  }

  static void clearDeeplink() async {
    print("clearDefaultAccount ");
    await storage.ready;
    await storage.deleteItem(DEEPLINK);
  }

  static void clearDefaultAccount() async {
    print("clearDefaultAccount xxxxxxxxx");
    await storage.ready;
    await storage.deleteItem(DEFAULTACCOUNT);
  }

  static void clearCurrentBis() async {
    print("clearCurrentBis");
    await storage.ready;
    await storage.deleteItem(CURRENTBIS);
  }

  static void clearStorage() async {
    await storage.ready;
    await storage.clear();
    print("clearedAll");
  }

  refreshLogin(String accessToken, String deviceToken) {
    final cont = GlobalVariable.navState.currentContext!;
    return Navigator.of(GlobalVariable.navState.currentContext ?? cont)
        .pushReplacement(MaterialPageRoute(
            builder: (context) => SessionExpiredDialog(
                  accessToken: accessToken,
                  deviceToken: deviceToken,
                )));
  }

  static Future<void> saveAccessTokenPrivateChat(dynamic value) async {
    await storage.ready;
    print("saveAccessTokenPrivateChat");
    print(value);
    return storage.setItem(ACCESSTOKENPRIVATECHAT, value);
  }

  static Future<void> saveProfile(dynamic value) async {
    await storage.ready;
    print("saveProfile");
    print(value);
    return storage.setItem(PROFILE, value);
  }

  static Future<void> saveBotUserProfile(dynamic value) async {
    await storage.ready;
    print("saveBotUserProfile");
    print(value);
    return storage.setItem(BOTUSERPROFILE, value);
  }

  static Future<void> saveChatServiceData(model) async {
    dynamic value = model.toJson();
    await storage.ready;
    print("saveChatServiceData");
    print(value);
    return storage.setItem(CHATSERVICEDATA, value);
  }

  static  Future<NewServiceModel> getChatServiceData() async {
    await storage.ready;
    var getAcc = storage.getItem(CHATSERVICEDATA);
    if (getAcc == null) {
      var response = NewServiceModel();
      return response;
    }
    Map<String, dynamic> storageData = Map<String, dynamic>.from(getAcc);
    print(getAcc);
    var response = NewServiceModel.fromJson(storageData);

    return response;
  }

  static Future<void> saveBusinessId(String businessId) async {
    dynamic value = businessId;
    await storage.ready;
    print("saveID");
    print(value);
    return storage.setItem(BUSINESSID, value);
  }

  static Future<String> getBusinessId() async {
    await storage.ready;
    var getDeeplink = storage.getItem(BUSINESSID);
    if (getDeeplink == null) {
      return '';
    }
    return getDeeplink.toString();
  }

  static Future<void> saveCurrentBis(String bussinessId) async {
    await storage.ready;
    print("saveCurrentBis");
    print(bussinessId);
    return storage.setItem(CURRENTBIS, bussinessId);
  }

  static Future<String> getCurrentBis() async {
    await storage.ready;
    var getCurrentBis = storage.getItem(CURRENTBIS);
    if (getCurrentBis == null) {
      return "";
    }
    return getCurrentBis;
  }

  static Future<void> saveIsService(bool value) async {
    await storage.ready;
    print('saveService');
    return storage.setItem(SERVICE, value);
  }

  static Future<bool> getIsOnService() async {
    await storage.ready;
    var getIsService = storage.getItem(SERVICE);
    return getIsService ?? true;
  }

  static clearBusinessId() async {
    await storage.ready;
    await storage.deleteItem(BUSINESSID);
    print("clearBusinessId");
  }
}
