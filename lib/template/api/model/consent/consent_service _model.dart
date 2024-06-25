class ConsentServiceModel{

  String?  appId = '';
  String?  businessId = '';
  String?  comment = '';
  String?  createdAt = '';
  String?  deletedAt = '';
  String?  detail = '';
  int? seq = 0;
  String? type = '';
  String? uid = '';
  String? updatedAt = '';
  String? version = '';


  ConsentServiceModel();
  factory ConsentServiceModel.fromJson(Map<dynamic, dynamic> json){
    ConsentServiceModel model = ConsentServiceModel();

    model.appId = json['app_id'];
    model.businessId = json['business_id'];
    model.comment = json['comment'];
    model.createdAt = json['created_at'];
    model.deletedAt = json['deleted_at'];
    model.detail = json['detail'];
    model.seq = json['seq'];
    model.type = json['type'];
    model.uid = json['uid'];
    model.updatedAt = json['updated_at'];
    model.version = json['version'];

    return model;
  }

}