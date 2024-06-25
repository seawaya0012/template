class RegisterUsernameRequest {
  String mobileNo = "";
  String password = "";
  String username = "";

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data["mobile_no"] = mobileNo;
    data["password"] = password;
    data["username"] = username;
    return data;
  }
}
