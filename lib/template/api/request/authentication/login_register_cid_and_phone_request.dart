class LoginRegisterCidAndPhoneRequest {
  String consentStatus = "";
  String mobileRefId = "";
  String oneId = "";
  String otp = "";
  String otpUid = "";
  String phone = "";
  String typeApp = "";
  String typeOtp = "";
  String versionApp = "";

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data["consent_status"] = consentStatus;
    data["mobile_ref_id"] = mobileRefId;
    data["one_id"] = oneId;
    data["otp"] = otp;
    data["otp_uid"] = otpUid;
    data["phone"] = phone;
    data["type_app"] = typeApp;
    data["type_otp"] = typeOtp;
    data["version_app"] = versionApp;

    return data;
  }
}
