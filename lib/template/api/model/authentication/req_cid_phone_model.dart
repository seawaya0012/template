class ReqCidPhoneModel {
  String? typeOtp = "";
  String? mobileRefId = "";
  String? refCode = "";
  String? otpUid = "";


  ReqCidPhoneModel();

  factory ReqCidPhoneModel.fromJson(Map<dynamic, dynamic> json) {
    ReqCidPhoneModel model = ReqCidPhoneModel();

    model.typeOtp = json["type_otp"];
    model.mobileRefId = json["mobile_ref_id"];
    model.refCode = json["refcode"];
    model.otpUid = json["otp_uid"];

    return model;
  }
}
