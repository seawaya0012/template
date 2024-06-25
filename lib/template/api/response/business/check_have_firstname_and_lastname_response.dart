import '../../model/business/check_have_firstname_and_lastname_model.dart';
import '../base_response.dart';

class CheckHaveFirstnameAndLastnameResponse extends BaseResponse {
  late CheckHaveFirstnameAndLastnameModel? branchByBusinessModel;

  CheckHaveFirstnameAndLastnameResponse({dynamic json}) : super(json);
  factory CheckHaveFirstnameAndLastnameResponse.fromJson(
      Map<String, dynamic> json) {
    CheckHaveFirstnameAndLastnameResponse response =
        CheckHaveFirstnameAndLastnameResponse(json: json);
    if (json["data"] != null) {
      response.branchByBusinessModel =
          CheckHaveFirstnameAndLastnameModel.fromJson(json["data"]);
    }

    return response;
  }
}
