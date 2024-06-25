
import '../../model/serviceApp/oneplatform_app_account_model.dart';
import '../base_response.dart';

class ProfileBusinessResponse extends BaseResponse {
  late BusinessProfileModel profileBusiness;

  ProfileBusinessResponse({dynamic json}) : super(json);

  factory ProfileBusinessResponse.fromJson(Map<String,dynamic> json) {
    ProfileBusinessResponse response = ProfileBusinessResponse(json : json);
    if(json["data"] != null){
      response.profileBusiness = BusinessProfileModel.fromJson(json["data"]);
    }
    return response;
  }
}