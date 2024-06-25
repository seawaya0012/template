import '../../model/business/auto_oin_biz_model.dart';
import '../base_response.dart';

class AutoJoinBizResponse extends BaseResponse {
  late AutoJoinBizModel? autoJoinBizModel;

  AutoJoinBizResponse({dynamic json}) : super(json);
  factory AutoJoinBizResponse.fromJson(Map<String, dynamic> json) {
    AutoJoinBizResponse response =
    AutoJoinBizResponse(json: json);
    if (json["data"] != null) {
      response.autoJoinBizModel =
          AutoJoinBizModel.fromJson(json["data"]);
    }

    return response;
  }
}