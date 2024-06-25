import '../../model/authentication/url_shared_token_model.dart';
import '../base_response.dart';

class UrlSharedTokenResponse extends BaseResponse {

  late UrlSharedTokenModel model;

  UrlSharedTokenResponse({dynamic json}) : super(json);

  factory UrlSharedTokenResponse.fromJson(Map<String, dynamic> json){
    UrlSharedTokenResponse response = UrlSharedTokenResponse(json: json);
  if (json["data"] != null) {
  response.model = UrlSharedTokenModel.fromJson(json["data"]);
  }

  return response;
  }
  }
