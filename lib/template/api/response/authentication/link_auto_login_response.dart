
import '../../model/authentication/link_auto_login_model.dart';
import '../base_response.dart';

class LinkAutoLoginResponse extends BaseResponse {
  late LinkAutoLoginModel? model;

  LinkAutoLoginResponse({dynamic json}) : super(json);

  factory LinkAutoLoginResponse.fromJson(Map<String, dynamic> json) {
    LinkAutoLoginResponse response = LinkAutoLoginResponse(json: json);
    if (json["data"] != null) {
      response.model =
          LinkAutoLoginModel.fromJson(json["data"]);
    }
    return response;
  }
}
