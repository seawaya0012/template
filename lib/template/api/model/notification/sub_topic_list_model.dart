class SubTopicListModel{
  List<String>? subTopicList = [];

  SubTopicListModel();

  factory SubTopicListModel.fromJson(Map<dynamic, dynamic> json) {
    SubTopicListModel model = SubTopicListModel();

    var list = json["topic"] as List;
    if (list != null) {
      list.map((data) => list).toList();
      model.subTopicList = list.cast<String>();
    }

    return model;
  }

  Map<String, dynamic> toJson(){
    Map<String,dynamic> data = Map<String,  dynamic>();

    data["topic"] = subTopicList ?? "";
    return data;
  }
}
