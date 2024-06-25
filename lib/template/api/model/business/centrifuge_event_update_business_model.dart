class CentrifugeEventUpdateBusinessModel {

  String eventName = 'นาย';
  String action = '';
  String businessId = '';

  CentrifugeEventUpdateBusinessModel();
  factory CentrifugeEventUpdateBusinessModel.fromJson(
      Map<dynamic, dynamic> json) {
    CentrifugeEventUpdateBusinessModel model =
    CentrifugeEventUpdateBusinessModel();


    model.eventName = json["event_name"];
    model.action = json["action"];
    model.businessId = json["business_id"];

    return model;
  }
}
