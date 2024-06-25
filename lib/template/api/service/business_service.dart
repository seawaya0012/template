import '../api_manager.dart';
import '../request/authentication/register_by_qrcode_key_request.dart';
import '../request/business/auto_join_biz_request.dart';
import '../request/bisiness_id_request.dart';
import '../request/business/firstname_and_lastname_th_request.dart';
import '../request/business/join_biz_request.dart';
import '../response/base_response.dart';
import '../response/business/auto_join_biz_response.dart';
import '../response/business/check_have_firstname_and_lastname_response.dart';
import '../response/business/is_have_business_response.dart';

class BusinessService {
  static Future<BaseResponse> postAddFirstnameAndLastnameTh(
      FirstnameAndLastnameThRequest request) async {
    dynamic response = await ApiManager().requestPost(
        ApiManager().domainManageV1,
        ApiManager.postAddFirstnameAndLastnameTh,
        request.toJson());
    return BaseResponse.fromJson(response);
  }

  static Future<BaseResponse> postRequestJoinBiz(JoinBizRequest request) async {
    dynamic response = await ApiManager().requestPost(
        ApiManager().domainManageV1,
        ApiManager.postRequestJoinBiz,
        request.toJson());
    return BaseResponse.fromJson(response);
  }

  static Future<IsHaveBusinessResponse> postIsHaveBusiness(BusinessIdRequest request) async {
    dynamic response = await ApiManager().requestPost(
        ApiManager().domainManageV1,
        ApiManager.postIsHaveBusiness,
        request.toJson());
    return IsHaveBusinessResponse.fromJson(response);
  }

  static Future<AutoJoinBizResponse> postAutoJoinBiz(AutoJoinBizRequest request) async {
    dynamic response = await ApiManager().requestPost(
        ApiManager().domainManageV1,
        ApiManager.postAutoJoinBiz,
        request.toJson());
    return AutoJoinBizResponse.fromJson(response);
  }

  static Future<CheckHaveFirstnameAndLastnameResponse>
      postCheckHaveFirstnameAndLastname() async {
    dynamic response = await ApiManager().requestGet(
        ApiManager().domainManageV1,
        ApiManager.postCheckHaveFirstnameAndLastname);
    return CheckHaveFirstnameAndLastnameResponse.fromJson(response);

  }

  static Future<AutoJoinBizResponse> postAddToBizByQrcodeBms(RegisterByQrcodeKeyRequest request) async {
    dynamic response = await ApiManager().requestPost(
        ApiManager().domainManageV1,
        ApiManager.postAddToBizByQrcodeBms,
        request.toJson());
    return AutoJoinBizResponse.fromJson(response);
  }
}
