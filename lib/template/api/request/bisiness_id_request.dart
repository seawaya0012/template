class BusinessIdRequest {

  String businessId = "";

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data["business_id"] = businessId;
    return data;
  }
}