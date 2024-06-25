class UsernameLoginRequest {
  String username = "";
  String password = "";
  String typeApp = "";
  String versionApp = "";

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data["username"] = username;
    data["password"] = password;
    data["type_app"] = typeApp;
    data["version_app"] = versionApp;

    return data;
  }
}
