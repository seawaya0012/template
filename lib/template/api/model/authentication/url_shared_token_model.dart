class UrlSharedTokenModel {
  String? url = "";

  UrlSharedTokenModel();

  factory UrlSharedTokenModel.fromJson(Map<dynamic, dynamic> json) {
    UrlSharedTokenModel model = UrlSharedTokenModel();

    model.url = json["url"];


    return model;
  }
}
