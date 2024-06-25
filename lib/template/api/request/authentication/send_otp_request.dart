class SendOtpRequest {
  String phone = "";
  String consentStatus = "";
  String mobileRefId = "";
  String otp = "";
  String typeOtp = "";
  String oneId = "";
  String typeApp = "";
  String versionApp = "";
  String otpUid = "";

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data["phone"] = phone;
    data["consent_status"] = consentStatus;
    data["mobile_ref_id"] = mobileRefId;
    data["otp"] = otp;
    data["type_otp"] = typeOtp;
    data["one_id"] = oneId;
    data["type_app"] = typeApp;
    data["version_app"] = versionApp;
    data["otp_uid"] = otpUid;

    return data;
  }
}
