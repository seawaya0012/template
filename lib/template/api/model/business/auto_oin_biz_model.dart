class AutoJoinBizModel{
  String? bizId = "";
  bool? goToBiz = false;

  AutoJoinBizModel();
  factory AutoJoinBizModel.fromJson(Map<dynamic, dynamic> json){
    AutoJoinBizModel model = AutoJoinBizModel();
    model.bizId = json['business_id'];
    model.goToBiz = json['go_to_biz'];
    return model;
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = Map<String, dynamic>();

    data["business_id"] = bizId ?? "";
    data["go_to_biz"] = goToBiz ?? false;
    return data;
  }
}