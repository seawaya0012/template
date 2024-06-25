import '../../model/business/is_have_business_model.dart';
import '../base_response.dart';

class IsHaveBusinessResponse extends BaseResponse {
  late IsHaveBusinessModel? data;

  IsHaveBusinessResponse({dynamic json}) : super(json);
  factory IsHaveBusinessResponse.fromJson(
      Map<String, dynamic> json) {
    IsHaveBusinessResponse response =
    IsHaveBusinessResponse(json: json);
    if (json["data"] != null) {
      response.data =
          IsHaveBusinessModel.fromJson(json["data"]);
    }

    return response;
  }
}
