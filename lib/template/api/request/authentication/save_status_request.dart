class StatusProfileRequest {
  String status = "";

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data["status"] = status;

    return data;
  }
}