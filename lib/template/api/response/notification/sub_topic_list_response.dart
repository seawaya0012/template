
import '../../model/notification/sub_topic_list_model.dart';
import '../base_response.dart';

class GetSubTopicListResponse extends BaseResponse{
  SubTopicListModel? data;

  GetSubTopicListResponse({dynamic json}) : super(json);

  factory GetSubTopicListResponse.fromJson(Map<String, dynamic> json) {
    GetSubTopicListResponse response = GetSubTopicListResponse(json : json);
    response.data = SubTopicListModel.fromJson(json["data"]);

    return response;
  }
}
