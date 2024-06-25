import '../../model/serviceApp/oneplatform_app_account_model.dart';
import '../base_response.dart';

class AllAccountResponse extends BaseResponse {
  late BusinessProfileModel? publicAccountModel;
  late List<BusinessProfileModel> privateAccountList;
  late List<BusinessProfileModel> privateWaitApproveAccountList;

  AllAccountResponse({dynamic json}) : super(json);

  factory AllAccountResponse.fromJson(Map<String, dynamic> json) {
    AllAccountResponse response = AllAccountResponse(json: json);
    if (json["data"] != null) {
      response.publicAccountModel =
          BusinessProfileModel.fromJson(json["data"]["public_account"]);

      var listAll = json["data"]["private_account"] as List;
      List<BusinessProfileModel> accountList =
          listAll.map((data) => BusinessProfileModel.fromJson(data)).toList();
      response.privateAccountList = accountList;

      var listWaiting = json["data"]["waiting_approve"] as List;
      List<BusinessProfileModel> waitingApproveList =
          listWaiting.map((data) => BusinessProfileModel.fromJson(data)).toList();
      response.privateWaitApproveAccountList = waitingApproveList;

    }

    return response;
  }
}
