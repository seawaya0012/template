class OtpLoginRegisRequest {
  String phone = "";
  String typeOtp = "";
  String code = "";

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data["phone"] = phone;
    data["type_otp"] = typeOtp;
    data["code"] = code;

    return data;
  }
}
