class IsOnDefaultAppRequest {
  String status = "";
  String message = "";

  factory IsOnDefaultAppRequest.fromJson(Map<String, dynamic> json) {
    return IsOnDefaultAppRequest(json);
  }
  IsOnDefaultAppRequest(Map<String, dynamic> json) {
    status = json["status"] as String;
    message = json["message"] as String;
  }

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data["status"] = status;
    data["message"] = message;

    return data;
  }
}
