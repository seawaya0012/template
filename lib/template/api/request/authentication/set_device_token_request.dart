class SetDeviceTokenRequest {
  String deviceToken = "";
  String deviceType = "";

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data["device_token"] = deviceToken;
    data["device_type"] = deviceType;

    return data;
  }
}
