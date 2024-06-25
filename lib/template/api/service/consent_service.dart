
import '../api_manager.dart';
import '../request/consent/set_onsent_user_request.dart';
import '../response/base_response.dart';
import '../response/consent/consent_app_response.dart';
import '../response/consent/consent_service_reponse.dart';

class ConsentService {

  static Future<ConsentAppResponse> getConsentOnePlatform() async {
    dynamic response = await ApiManager().requestGet(ApiManager().domainManageV1, ApiManager.getConsentOnePlatform);
    return ConsentAppResponse.fromJson(response);
  }

  static Future<ConsentAppResponse> getConsentOnePlatformUser() async {
    dynamic response = await ApiManager().requestGet(ApiManager().domainManageV1, ApiManager.getConsentOnePlatformUser);
    return ConsentAppResponse.fromJson(response);
  }

  static Future<ConsentServiceResponse> getConsentService(String serviceName) async {
    dynamic response = await ApiManager().requestGet(ApiManager().domainManageV1, '${ApiManager.getConsentService}?service_name=$serviceName');
    return ConsentServiceResponse.fromJson(response);
  }


  static Future<BaseResponse> postSetConsentUser(
      SetConsentUserRequest request) async {
    dynamic response = await ApiManager().requestPost(
        ApiManager().domainManageV1,
        ApiManager.postSetConsentUser,
        request.toJson());
    return BaseResponse.fromJson(response);
  }

}