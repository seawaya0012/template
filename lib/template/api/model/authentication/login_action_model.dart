class LoginActionModel {
  String? actionType = "";
  String? businessId = "";
  String? message = "";
  bool? isLockBiz = false;

  LoginActionModel();

  factory LoginActionModel.fromJson(Map<dynamic, dynamic> json) {
    LoginActionModel model = LoginActionModel();

    model.actionType = json["action_type"];
    model.businessId = json["business_id"];
    model.message = json["message"];
    model.isLockBiz = json["is_lock_biz"];

    return model;
  }
}
