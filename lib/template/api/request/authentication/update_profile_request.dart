class UpdateProfileRequest {
  String profilePicturePath = "";
  String businessId = "";

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data["file"] = profilePicturePath;
    data["business_id"] = businessId;

    return data;
  }
}
