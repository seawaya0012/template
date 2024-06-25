class RenewAccessTokenRequest {
  String accessToken = "";
  String refreshToken = "";

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data["access_token"] = accessToken;
    data["refresh_token"] = refreshToken;

    return data;
  }

  RenewAccessTokenRequest();

  factory RenewAccessTokenRequest.fromJson(Map<dynamic, dynamic> json) {
    RenewAccessTokenRequest model = RenewAccessTokenRequest();

    model.accessToken = json["access_token"];
    model.refreshToken = json["refresh_token"];

    return model;
  }
}
