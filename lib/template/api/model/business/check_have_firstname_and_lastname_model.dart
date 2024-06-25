class CheckHaveFirstnameAndLastnameModel {
  bool isHave = false;
  String titleNameTh = 'นาย';
  String firstnameTh = '';
  String lastnameTh = '';

  CheckHaveFirstnameAndLastnameModel();
  factory CheckHaveFirstnameAndLastnameModel.fromJson(
      Map<dynamic, dynamic> json) {
    CheckHaveFirstnameAndLastnameModel model =
        CheckHaveFirstnameAndLastnameModel();

    model.isHave = json["is_have"];
    model.titleNameTh = json["title_name_th"];
    model.firstnameTh = json["firstname_th"];
    model.lastnameTh = json["lastname_th"];

    return model;
  }
}
