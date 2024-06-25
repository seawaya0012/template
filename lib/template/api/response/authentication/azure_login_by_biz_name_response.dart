import '../../model/authentication/azure_login_by_biz_name_model.dart';
import '../base_response.dart';

class AzureLoginByBizNameResponse extends BaseResponse{
  late AzureLoginByBizNameModel? azureLoginByBizNameModel;

  AzureLoginByBizNameResponse({dynamic json}) : super(json);
  factory AzureLoginByBizNameResponse.fromJson(Map<String, dynamic> json) {
    AzureLoginByBizNameResponse response = AzureLoginByBizNameResponse(json: json);
    if (json["data"] != null) {
      response.azureLoginByBizNameModel = AzureLoginByBizNameModel.fromJson(json["data"]);
    }

    return response;
  }
}