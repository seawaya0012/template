class LinkAutoLoginModel{

  String?  link = '';

  LinkAutoLoginModel();
  factory LinkAutoLoginModel.fromJson(Map<dynamic, dynamic> json){
    LinkAutoLoginModel model = LinkAutoLoginModel();

    model.link = json['link'];

    return model;
  }

}