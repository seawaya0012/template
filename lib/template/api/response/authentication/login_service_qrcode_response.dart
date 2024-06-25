import '../../model/authentication/account_model.dart';
import '../../model/authentication/duplicate_accounts_model.dart';
import '../../model/authentication/login_action_model.dart';
import '../../model/business/business_login_service_model.dart';
import '../../model/business/business_model.dart';
import '../base_response.dart';

class LoginServiceQrcodeResponse extends BaseResponse {
  late AccountModel? accountModel;
  late List<BusinessLoginServiceModel> businessList;
  // late List<DuplicateAccountsModel> duplicateAccountsList;
  late LoginActionModel? loginActionModel;

  LoginServiceQrcodeResponse({dynamic json}) : super(json);

  factory LoginServiceQrcodeResponse.fromJson(Map<String, dynamic> json) {
    LoginServiceQrcodeResponse response = LoginServiceQrcodeResponse(json: json);
    if (json["data"] != null) {
      if (json["data"]["account"] != null){
        response.accountModel = AccountModel.fromJson(json["data"]["account"]);
      }

      if (json["data"]["action"] != null){
        response.loginActionModel = LoginActionModel.fromJson(json["data"]["action"]);
      }

      if (json["data"]["business"] != null){
        var list = json["data"]["business"] as List;
        List<BusinessLoginServiceModel> typeList =
        list.map((data) => BusinessLoginServiceModel.fromJson(data)).toList();
        response.businessList = typeList;
      }
    }

    return response;
  }

}
