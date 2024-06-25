class AccountModel {
  String? userId = "";
  String? oneId = "";
  String? accountTitleTh = "";
  String? firstNameTh = "";
  String? lastNameTh = "";
  String? accountTitleEng = "";
  String? firstNameEng = "";
  String? lastNameEng = "";
  String? idCardType = "";
  String? idCardNum = "";
  String? nickname = "";
  String? username = "";
  String? profilePicture = "";
  String? tokenUser = "";
  String? accessToken = "";
  String? refreshToken = "";
  String? type = "";
  String? displayName = "";
  String? status = "";
  String? mobileNo = "";
  String? email = "";
  String? email2 = "";

  AccountModel();
  factory AccountModel.fromJson(Map<dynamic, dynamic> json) {
    AccountModel model = AccountModel();

    model.userId = json["user_id"];
    model.oneId = json["one_id"];
    model.accountTitleTh = json["account_title_th"];
    model.firstNameTh = json["first_name_th"];
    model.lastNameTh = json["last_name_th"];
    model.accountTitleEng = json["account_title_eng"];
    model.firstNameEng = json["first_name_eng"];
    model.lastNameEng = json["last_name_eng"];
    model.idCardType = json["id_card_type"];
    model.idCardNum = json["id_card_num"];
    model.nickname = json["nickname"];
    model.username = json["username"];
    model.profilePicture = json["profile_picture"];
    model.tokenUser = json["token_user"];
    model.accessToken = json["access_token"];
    model.refreshToken = json["refresh_token"];
    model.type = json["type"];
    model.displayName = json["display_name"];
    model.status = json["status"];
    model.mobileNo = json["mobile_no"];
    model.email = json["email"];
    model.email2 = json["email2"];

    return model;
  }

  // Map<String, String> toJson() {
  //   Map<String, String> data = Map<String, String>();
  //
  //   data["account_title_th"] = accountTitleTh ?? "";
  //   data["first_name_th"] = firstNameTh ?? "";
  //   data["account_title_eng"] = lastNameTh ?? "";
  //   data["first_name_eng"] = accountTitleEng ?? "";
  //   data["first_name_eng"] = firstNameEng ?? "";
  //   data["last_name_eng"] = lastNameEng ?? "";
  //   data["id_card_type"] = idCardType ?? "";
  //   data["id_card_num"] = idCardNum ?? "";
  //   data["nickname"] = nickname ?? "";
  //   data["username"] = username ?? "";
  //   data["profile_picture"] = profilePicture ?? "";
  //   data["token_user"] = tokenUser ?? "";
  //   data["access_token"] = accessToken ?? "";
  //   data["refresh_token"] = refreshToken ?? "";
  //   data["type"] = type ?? "";
  //   data["display_name"] = displayName ?? "";
  //   data["status"] = status ?? "";
  //   data["mobile_no"] = mobileNo ?? "";
  //   data["email"] = email ?? "";
  //   data["email2"] = email2 ?? "";
  //
  //   return data;
  // }
}
