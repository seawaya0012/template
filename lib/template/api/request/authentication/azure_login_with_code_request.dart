class AzureLoginWithCodeRequest {
  String code = "";
  String typeApp = "";
  String versionApp = "";

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["code"] = code;
    data["type_app"] = typeApp;
    data["version_app"] = versionApp;

    return data;
  }
}
