class DeviceTokenRequest {
  String deviceToken = "";
  String accessToken = "";

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["device_token"] = deviceToken;
    data["access_token"] = accessToken;

    return data;
  }
}
