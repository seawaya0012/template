class RegisterByQrcodeBMSRequest {
  String accountTitleTh = "";
  String firstNameTh = "";
  String lastNameTh = "";
  String idCardNum = "";
  String firstNameEng = "";
  String lastNameEng = "";
  String mobileNo = "";
  String birthDate = "";
  String hospitalCode = "";


  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["account_title_th"] = accountTitleTh;
    data["first_name_th"] = firstNameTh;
    data["last_name_th"] = lastNameTh;
    data["id_card_num"] = idCardNum;
    data["first_name_eng"] = firstNameEng;
    data["last_name_eng"] = lastNameEng;
    data["mobile_no"] = mobileNo;
    data["birth_date"] = birthDate;
    data["hospital_code"] = hospitalCode;

    return data;
  }

  RegisterByQrcodeBMSRequest();

  factory RegisterByQrcodeBMSRequest.fromJson(Map<dynamic, dynamic> json) {
    RegisterByQrcodeBMSRequest model = RegisterByQrcodeBMSRequest();

    model.accountTitleTh = json["account_title_th"];
    model.firstNameTh = json["first_name_th"];
    model.lastNameTh = json["last_name_th"];
    model.idCardNum = json["id_card_num"];
    model.firstNameEng = json["first_name_eng"];
    model.lastNameEng = json["last_name_eng"];
    model.birthDate = json["birth_date"];
    model.mobileNo = json["mobile_no"];
    model.hospitalCode = json["hospital_code"];

    return model;
  }

}
