import '../../model/authentication/account_get_role_model.dart';
import '../base_response.dart';

class GetAccountRoleResponse extends BaseResponse {
  late List<AccountGetRoleModel> accountGetRoleList;

  GetAccountRoleResponse({dynamic json}) : super(json);

  factory GetAccountRoleResponse.fromJson(Map<String, dynamic> json) {
    GetAccountRoleResponse response = GetAccountRoleResponse(json: json);
    if (json["data"] != null) {
      var list = json["data"] as List;
      List<AccountGetRoleModel> appList =
          list.map((data) => AccountGetRoleModel.fromJson(data)).toList();
      response.accountGetRoleList = appList;
    }
    return response;
  }
}
