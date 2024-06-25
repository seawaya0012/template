class UrlSharedTokenRequest {
  String oneId = '';
  String url = '';


  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["one_id"] = oneId;
    data["url"] = url;

    return data;
  }
}