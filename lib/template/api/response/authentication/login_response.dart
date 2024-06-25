import '../../model/authentication/account_model.dart';
import '../../model/authentication/duplicate_accounts_model.dart';
import '../../model/authentication/login_action_model.dart';
import '../../model/business/business_model.dart';
import '../base_response.dart';

class LoginResponse extends BaseResponse {
  late AccountModel? accountModel;
  late List<BusinessModel> businessList;
  late List<DuplicateAccountsModel> duplicateAccountsList;
  late LoginActionModel? loginActionModel;

  LoginResponse({dynamic json}) : super(json);

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    LoginResponse response = LoginResponse(json: json);
    if (json["data"] != null) {
      if (json["data"]["account"] != null){
        response.accountModel = AccountModel.fromJson(json["data"]["account"]);
      }

      if (json["data"]["action"] != null){
        response.loginActionModel = LoginActionModel.fromJson(json["data"]["action"]);
      }

      if (json["data"]["business"] != null){
        var list = json["data"]["business"] as List;
        List<BusinessModel> typeList =
        list.map((data) => BusinessModel.fromJson(data)).toList();
        response.businessList = typeList;
      }

      if (json["data"]["list_accounts"] != null){
        var list = json["data"]["list_accounts"] as List;
        List<DuplicateAccountsModel> typeList =
        list.map((data) => DuplicateAccountsModel.fromJson(data)).toList();
        response.duplicateAccountsList = typeList;
      }
    }

    return response;
  }

  // Map<String, dynamic> toJson() {
  //   Map<String, dynamic> data = <String, dynamic>{};
  //   data["date"]["account"] = accountModel;
  //   // data["data"]["business"] = businessList;
  //
  //   return data;
  // }
}
