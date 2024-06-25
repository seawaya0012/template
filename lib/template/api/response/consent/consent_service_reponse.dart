
import '../../model/consent/consent_service _model.dart';
import '../base_response.dart';

class ConsentServiceResponse extends BaseResponse {
  late ConsentServiceModel? model;

  ConsentServiceResponse({dynamic json}) : super(json);

  factory ConsentServiceResponse.fromJson(Map<String, dynamic> json) {
    ConsentServiceResponse response = ConsentServiceResponse(json: json);
    if (json["data"] != null) {
      response.model =
          ConsentServiceModel.fromJson(json["data"]);
    }
    return response;
  }
}
