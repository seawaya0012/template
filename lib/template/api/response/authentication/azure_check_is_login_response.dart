import '../../model/authentication/azure_check_is_login_model.dart';
import '../../model/authentication/azure_login_by_biz_name_model.dart';
import '../base_response.dart';

class AzureCheckIsLoginResponse extends BaseResponse{
  late AzureCheckIsLoginModel? azureCheckIsLoginModel;

  AzureCheckIsLoginResponse({dynamic json}) : super(json);
  factory AzureCheckIsLoginResponse.fromJson(Map<String, dynamic> json) {
    AzureCheckIsLoginResponse response = AzureCheckIsLoginResponse(json: json);
    if (json["data"] != null) {
      response.azureCheckIsLoginModel = AzureCheckIsLoginModel.fromJson(json["data"]);
    }

    return response;
  }
}