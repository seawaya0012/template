class IsHaveBusinessModel{

  bool? isHave = false;
  String?  companyPicture = '';

  IsHaveBusinessModel();
  factory IsHaveBusinessModel.fromJson(Map<dynamic, dynamic> json){
    IsHaveBusinessModel model = IsHaveBusinessModel();
    model.isHave = json['is_have'];
    model.companyPicture = json['company_picture'];
    return model;
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = Map<String, dynamic>();
    data["is_have"] = isHave ?? false;
    data["company_picture"] = companyPicture ?? false;
    return data;
  }
}