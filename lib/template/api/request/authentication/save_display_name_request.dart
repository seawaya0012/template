class NameProfileRequest {
  String displayName = "";

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data["display_name"] = displayName;

    return data;
  }
}