import '../../model/authentication/req_otp_model.dart';
import '../base_response.dart';

class OtpLoginRegisResponse extends BaseResponse {
  late ReqOtpModel? reqOtpModel;

  OtpLoginRegisResponse({dynamic json}) : super(json);

  factory OtpLoginRegisResponse.fromJson(Map<String, dynamic> json) {
    OtpLoginRegisResponse response = OtpLoginRegisResponse(json: json);
    if (json["data"] != null) {
      response.reqOtpModel = ReqOtpModel.fromJson(json["data"]);
    }else{
      response.reqOtpModel = ReqOtpModel();
    }

    return response;
  }
}
