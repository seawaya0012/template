import '../api_manager.dart';
import '../response/notification/sub_topic_list_response.dart';


class NotificationService {

  static Future<GetSubTopicListResponse> getSubTopic() async {
    dynamic response = await ApiManager().requestGet(
      ApiManager().domainManageV1,
      ApiManager.getSubTopic,);
    return GetSubTopicListResponse.fromJson(response);
  }


}
