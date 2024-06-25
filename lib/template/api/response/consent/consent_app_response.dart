
import '../../model/consent/consent_app_model.dart';
import '../base_response.dart';

class ConsentAppResponse extends BaseResponse {
  late ConsentAppModel? model;

  ConsentAppResponse({dynamic json}) : super(json);

  factory ConsentAppResponse.fromJson(Map<String, dynamic> json) {
    ConsentAppResponse response = ConsentAppResponse(json: json);
    if (json["data"] != null) {
      response.model =
          ConsentAppModel.fromJson(json["data"]);
    }

    return response;
  }
}
