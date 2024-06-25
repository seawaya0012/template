class LoginServiceQrcodeRequest {
  String serviceData = "";
  String serviceName = "";

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["data"] = serviceData;
    data["service_name"] = serviceName;

    return data;
  }
}
