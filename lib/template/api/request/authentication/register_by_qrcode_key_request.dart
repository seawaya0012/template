class RegisterByQrcodeKeyRequest {
  String key = "";

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["key"] = key;

    return data;
  }

  RegisterByQrcodeKeyRequest();

  factory RegisterByQrcodeKeyRequest.fromJson(Map<dynamic, dynamic> json) {
    RegisterByQrcodeKeyRequest model = RegisterByQrcodeKeyRequest();

    model.key = json["key"];

    return model;
  }

}
