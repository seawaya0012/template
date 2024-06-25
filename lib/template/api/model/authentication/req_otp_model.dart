class ReqOtpModel {
  String? mobileRefId = "";
  String? refcode = "";
  String? typeOtp = "";
  String? otpUid = "";

  ReqOtpModel();

  factory ReqOtpModel.fromJson(Map<dynamic, dynamic> json) {
    ReqOtpModel model = ReqOtpModel();

    model.mobileRefId = json["mobile_ref_id"];
    model.refcode = json["refcode"];
    model.typeOtp = json["type_otp"];
    model.otpUid = json["otp_uid"];

    return model;
  }
}
