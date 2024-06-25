class FirstnameAndLastnameThRequest {
  String firstnameTh = "";
  String lastnameTh = "";
  String titleNameTh = "";

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data["firstname_th"] = firstnameTh;
    data["lastname_th"] = lastnameTh;
    data["title_name_th"] = titleNameTh;
    return data;
  }
}
