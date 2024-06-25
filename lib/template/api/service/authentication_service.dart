import '../../appManager/local_storage_manager.dart';
import '../api_manager.dart';
import '../request/authentication/account_set_active_request.dart';
import '../request/authentication/azure_login_with_code_request.dart';
import '../request/authentication/bms_qrcode_login_request.dart';
import '../request/authentication/device_token_request.dart';
import '../request/authentication/login_cid_and_phone_request.dart';
import '../request/authentication/login_register_cid_and_phone_request.dart';
import '../request/authentication/login_service_qrcode_request.dart';
import '../request/authentication/otp_login_regis_request.dart';
import '../request/authentication/register_by_qrcode_key_request.dart';
import '../request/authentication/register_username_request.dart';
import '../request/authentication/renew_access_token_request.dart';
import '../request/authentication/save_display_name_request.dart';
import '../request/authentication/save_status_request.dart';
import '../request/authentication/send_otp_request.dart';
import '../request/authentication/username_login_request.dart';
import '../response/authentication/azure_check_is_login_response.dart';
import '../response/authentication/azure_login_by_biz_name_response.dart';
import '../response/authentication/cid_phonnumber_response.dart';
import '../response/authentication/login_response.dart';
import '../response/authentication/login_service_qrcode_response.dart';
import '../response/authentication/otp_login_regis_response.dart';
import '../response/base_response.dart';
import '../response/serviceApp/oneplatform_app_account_response.dart';

class AuthenticationService {
  static Future<LoginResponse> postLogin(UsernameLoginRequest request) async {
    dynamic response = await ApiManager().requestPost(
        ApiManager().domainManageV1, ApiManager.postLogin, request.toJson());

    if (response["message"] == "success") {
      print("response.runtimeType");
      print(response);
      await LocalStorageManager.saveAccount(response);
      RenewAccessTokenRequest accessTokenRequest = RenewAccessTokenRequest();
      accessTokenRequest.accessToken =
          response["data"]["account"]["access_token"];
      accessTokenRequest.refreshToken =
          response["data"]["account"]["refresh_token"];
      await LocalStorageManager.saveAccessToken(accessTokenRequest);
    }
    return LoginResponse.fromJson(response);
  }

  static Future<LoginResponse> postRegisterByQrcodeKey(RegisterByQrcodeKeyRequest request) async {
    dynamic response = await ApiManager().requestPost(
        ApiManager().domainManageV2, ApiManager.postRegisterByQrcodeBMS, request.toJson());

    if (response["message"] == "success") {
      print("response.runtimeType");
      print(response);
      await LocalStorageManager.saveAccount(response);
      RenewAccessTokenRequest accessTokenRequest = RenewAccessTokenRequest();
      accessTokenRequest.accessToken =
      response["data"]["account"]["access_token"];
      accessTokenRequest.refreshToken =
      response["data"]["account"]["refresh_token"];
      await LocalStorageManager.saveAccessToken(accessTokenRequest);
    }
    return LoginResponse.fromJson(response);
  }

  static Future<LoginResponse> postRegisterByQrcodeBMS(RegisterByQrcodeBMSRequest request) async {
    dynamic response = await ApiManager().requestPost(
        ApiManager().domainManageV1, ApiManager.postRegisterByQrcodeBMS, request.toJson());

    if (response["message"] == "success") {
      print("response.runtimeType");
      print(response);
      await LocalStorageManager.saveAccount(response);
      RenewAccessTokenRequest accessTokenRequest = RenewAccessTokenRequest();
      accessTokenRequest.accessToken =
      response["data"]["account"]["access_token"];
      accessTokenRequest.refreshToken =
      response["data"]["account"]["refresh_token"];
      await LocalStorageManager.saveAccessToken(accessTokenRequest);
    }
    return LoginResponse.fromJson(response);
  }

  static Future<LoginResponse> getAccountDataAccount() async {
    dynamic response = await ApiManager().requestGet(
      ApiManager().domainManageV1,
      ApiManager.getAccountDataAccount,
    );
    if (response["message"] == "success") {
      print("response.runtimeType");
      print(response.runtimeType);
      await LocalStorageManager.saveAccount(response);
      RenewAccessTokenRequest accessTokenRequest = RenewAccessTokenRequest();
      accessTokenRequest.accessToken =
          response["data"]["account"]["access_token"];
      accessTokenRequest.refreshToken =
          response["data"]["account"]["refresh_token"];
      await LocalStorageManager.saveAccessToken(accessTokenRequest);
    }
    return LoginResponse.fromJson(response);
  }

  static Future<AllAccountResponse> getAllAccount() async {
    dynamic response = await ApiManager()
        .requestGet(ApiManager().domainManageV1, ApiManager.getAllAccount);
    await LocalStorageManager.saveAllAccountList(response);
    return AllAccountResponse.fromJson(response);
  }

  static Future<LoginResponse> postRegisterUsername(
      RegisterUsernameRequest request) async {
    dynamic response = await ApiManager().requestPostWithoutAccessToken(
        ApiManager().domainManageV1,
        ApiManager.postRegisterUsername,
        request.toJson());
    if (response["message"] == "success") {
      await LocalStorageManager.saveAccount(response);
      RenewAccessTokenRequest accessTokenRequest = RenewAccessTokenRequest();
      accessTokenRequest.accessToken =
          response["data"]["account"]["access_token"];
      accessTokenRequest.refreshToken =
          response["data"]["account"]["refresh_token"];
      await LocalStorageManager.saveAccessToken(accessTokenRequest);
    }
    return LoginResponse.fromJson(response);
  }

  static Future<LoginResponse> postLoginRegisterPhone(
      SendOtpRequest request) async {
    dynamic response = await ApiManager().requestPostWithoutAccessToken(
        ApiManager().domainManageV1,
        ApiManager.postLoginRegisterPhone,
        request.toJson());
    if (response["message"] == "success") {
      if (response["data"]["account"] != null){
        await LocalStorageManager.saveAccount(response);
        RenewAccessTokenRequest accessTokenRequest = RenewAccessTokenRequest();
        accessTokenRequest.accessToken =
        response["data"]["account"]["access_token"];
        accessTokenRequest.refreshToken =
        response["data"]["account"]["refresh_token"];
        await LocalStorageManager.saveAccessToken(accessTokenRequest);
      }
    }
    return LoginResponse.fromJson(response);
  }

  static Future<OtpLoginRegisResponse> postReqOTPLoginRegis(
      OtpLoginRegisRequest request) async {
    dynamic response = await ApiManager().requestPostWithoutAccessToken(
        ApiManager().domainManageV2,
        ApiManager.postReqOTPLoginRegis,
        request.toJson());

    return OtpLoginRegisResponse.fromJson(response);
  }

  static Future<OtpLoginRegisResponse> postReqOTPLoginRegisV2(
      OtpLoginRegisRequest request) async {
    dynamic response = await ApiManager().requestPostWithoutAccessToken(
        ApiManager().domainManageV2,
        ApiManager.postReqOTPLoginRegis,
        request.toJson());

    return OtpLoginRegisResponse.fromJson(response);
  }

  static Future<void> postRenewAccessToken(
      RenewAccessTokenRequest request, Function(String) redoFunction) async {
    dynamic response = await ApiManager().requestPostWithoutAccessToken(
        ApiManager().domainManageV1,
        ApiManager.postRenewAccessToken,
        request.toJson());
    if (response["message"] == "success") {
      await LocalStorageManager.saveAccessToken(response["data"])
          .then((value) => {
                redoFunction(response["data"]["access_token"]),
              });
    }
  }

  static Future<BaseResponse> putStatus(StatusProfileRequest request) async {
    dynamic response = await ApiManager().requestPut(
        ApiManager().domainManageV1, ApiManager.putStatus, request.toJson());
    if (response["status"] == 200) {
      AuthenticationService.getAccountDataAccount();
    }
    return BaseResponse.fromJson(response);
  }

  static Future<BaseResponse> putProfileName(NameProfileRequest request) async {
    dynamic response = await ApiManager().requestPut(
        ApiManager().domainManageV1,
        ApiManager.putDisplayName,
        request.toJson());
    if (response["status"] == 200) {
      AuthenticationService.getAccountDataAccount();
    }
    return BaseResponse.fromJson(response);
  }

  static Future<BaseResponse> postAccountSetActive(
      AccountSetActiveRequest request) async {
    dynamic response = await ApiManager().requestPost(
        ApiManager().domainManageV2,
        ApiManager.postAccountSetActive,
        request.toJson());

    return OtpLoginRegisResponse.fromJson(response);
  }

  static Future<BaseResponse> postAccountLogout(
      DeviceTokenRequest request) async {
    dynamic response = await ApiManager().requestPost(
        ApiManager().domainManageV2,
        ApiManager.postAccountLogout,
        request.toJson());

    return OtpLoginRegisResponse.fromJson(response);
  }

  static Future<BaseResponse> postLogoutForExpiredToken(
      DeviceTokenRequest request) async {
    dynamic response = await ApiManager().requestPostWithoutAccessToken(
        ApiManager().domainManageV2,
        ApiManager.postAccountLogout,
        request.toJson());

    return OtpLoginRegisResponse.fromJson(response);
  }

  static Future<LoginServiceQrcodeResponse> postLoginServiceQrcode(
      LoginServiceQrcodeRequest request) async {
    dynamic response = await ApiManager().requestPost(
        ApiManager().domainManageV1,
        ApiManager.postLoginServiceQrcode,
        request.toJson());
    if (response["message"] == "success") {
      print("response.runtimeType");
      print(response);
      await LocalStorageManager.saveAccount(response);
      RenewAccessTokenRequest accessTokenRequest = RenewAccessTokenRequest();
      accessTokenRequest.accessToken =
      response["data"]["account"]["access_token"];
      accessTokenRequest.refreshToken =
      response["data"]["account"]["refresh_token"];
      await LocalStorageManager.saveAccessToken(accessTokenRequest);
    }
    return LoginServiceQrcodeResponse.fromJson(response);
  }

  //cid
  static Future<CidPhoneNumberResponse> postLoginRegisterCidAndPhoneNumber(
      LoginCidAndPhoneRequest request) async {
    dynamic response = await ApiManager().requestPostWithoutAccessToken(
        ApiManager().domainManageV1,
        ApiManager.postLoginRegisterCid,
        request.toJson());

    return CidPhoneNumberResponse.fromJson(response);
  }

  static Future<LoginResponse> postLoginRegisterCidAndPhone(
      LoginRegisterCidAndPhoneRequest request) async {
    dynamic response = await ApiManager().requestPostWithoutAccessToken(
        ApiManager().domainManageV1,
        ApiManager.postLoginByCidAndPhone,
        request.toJson());
    if (response["message"] == "success") {
      if (response["data"]["account"] != null){
        await LocalStorageManager.saveAccount(response);
        RenewAccessTokenRequest accessTokenRequest = RenewAccessTokenRequest();
        accessTokenRequest.accessToken =
        response["data"]["account"]["access_token"];
        accessTokenRequest.refreshToken =
        response["data"]["account"]["refresh_token"];
        await LocalStorageManager.saveAccessToken(accessTokenRequest);
      }
    }
    return LoginResponse.fromJson(response);
  }

  static Future<AzureLoginByBizNameResponse> getAzureLoginByBizName(
     String bizName) async {
    dynamic response = await ApiManager().requestGet(
        ApiManager().domainManageV1,
        '${ApiManager.getAzureLoginByBizName}?biz_name=$bizName');
    return AzureLoginByBizNameResponse.fromJson(response);
  }

  static Future<AzureCheckIsLoginResponse> getAzureCheckIsLogin(
     String code) async {
    dynamic response = await ApiManager().requestGet(
        ApiManager().domainManageV1,
        '${ApiManager.getAzureCheckIsLogin}?code=$code');
    return AzureCheckIsLoginResponse.fromJson(response);
  }

  static Future<OtpLoginRegisResponse> postAzureReqOtpLoginRegister(
      OtpLoginRegisRequest request) async {
    dynamic response = await ApiManager().requestPostWithoutAccessToken(
        ApiManager().domainManageV1,
        ApiManager.postAzureReqOtpLoginRegister,
        request.toJson());

    return OtpLoginRegisResponse.fromJson(response);
  }

  static Future<LoginResponse> postAzureLoginRegisterPhone(
      SendOtpRequest request) async {
    dynamic response = await ApiManager().requestPostWithoutAccessToken(
        ApiManager().domainManageV1,
        ApiManager.postAzureLoginRegisterPhone,
        request.toJson());

    if (response["message"] == "success") {
      print("response.runtimeType");
      print(response);
      await LocalStorageManager.saveAccount(response);
      RenewAccessTokenRequest accessTokenRequest = RenewAccessTokenRequest();

      if (response["data"]["account"] != null) {
        accessTokenRequest.accessToken =
            response["data"]["account"]["access_token"] ?? '';
        accessTokenRequest.refreshToken =
            response["data"]["account"]["refresh_token"] ?? '';
        await LocalStorageManager.saveAccessToken(accessTokenRequest);
      }

    }

    return LoginResponse.fromJson(response);
  }

  static Future<LoginResponse> postAzureLoginWithCodeAzure(
      AzureLoginWithCodeRequest request) async {
    dynamic response = await ApiManager().requestPostWithoutAccessToken(
        ApiManager().domainManageV1,
        ApiManager.postAzureLoginWithCodeAzure,
        request.toJson());

    if (response["message"] == "success") {
      print("response.runtimeType");
      print(response);
      await LocalStorageManager.saveAccount(response);
      RenewAccessTokenRequest accessTokenRequest = RenewAccessTokenRequest();

      if (response["data"]["account"] != null) {
        accessTokenRequest.accessToken =
            response["data"]["account"]["access_token"] ?? '';
        accessTokenRequest.refreshToken =
            response["data"]["account"]["refresh_token"] ?? '';
        await LocalStorageManager.saveAccessToken(accessTokenRequest);
      }

    }

    return LoginResponse.fromJson(response);
  }

}
