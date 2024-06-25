import '../../model/authentication/req_cid_phone_model.dart';
import '../../model/business/business_model.dart';
import '../base_response.dart';

class CidPhoneNumberResponse extends BaseResponse {
  late ReqCidPhoneModel? reqCidModel;

  CidPhoneNumberResponse({dynamic json}) : super(json);

  factory CidPhoneNumberResponse.fromJson(Map<String, dynamic> json) {
    CidPhoneNumberResponse response = CidPhoneNumberResponse(json: json);
    if (json["data"] != null) {
      response.reqCidModel = ReqCidPhoneModel.fromJson(json["data"]);
    }

    return response;
  }

}
