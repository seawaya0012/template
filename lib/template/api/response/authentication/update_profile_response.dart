import '../base_response.dart';

class UpdateProfileResponse extends BaseResponse {
  String profilePicture = "";
  String displayName = "";
  String statusProfile = "";

  UpdateProfileResponse({dynamic json}) : super(json);

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    UpdateProfileResponse response = UpdateProfileResponse(json: json);
    if (json["data"]["profile_picture"] != null) {
      response.profilePicture = json["data"]["profile_picture"];
    }
    if (json["data"]["display_name"] != null) {
      response.displayName = json["data"]["display_name"];
    }
    if (json["data"]["status"] != null) {
      response.statusProfile = json["data"]["status"];
    }
    return response;
  }
}
