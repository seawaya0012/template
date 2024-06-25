class LoginCidAndPhoneRequest {
  String idCard = "";
  String phone = "";

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data["cid"] = idCard;
    data["phone"] = phone;

    return data;
  }
}
