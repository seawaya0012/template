import 'business_role_model.dart';

class BusinessModel {
  String? nickname = "";
  String? profilePicture = "";
  String? ownerMappingId = "";
  String businessId = "";
  String? nameTh = "";
  String? nameEng = "";
  String? titleTh = "";
  String? titleEng = "";
  String? taxId = "";
  // String? role = "";
  List<BusinessRoleModel>? roleList = [];

  BusinessModel();
  factory BusinessModel.fromJson(Map<dynamic, dynamic> json) {
    BusinessModel model = BusinessModel();

    model.nickname = json["nickname"];
    model.profilePicture = json["profilepicture"];
    model.ownerMappingId = json["owner_mapping_id"];
    model.businessId = json["business_id"];
    model.nameTh = json["name_th"];
    model.nameEng = json["name_eng"];
    model.titleTh = json["title_th"];
    model.titleEng = json["title_eng"];
    model.taxId = json["tax_id"];
    // model.role = json["role"];

    if (json["role"] != null) {
      // print('json["role"]');
      // print(json["role"]);
      var list = json["role"] as List;
      List<BusinessRoleModel> typeList =
          list.map((data) => BusinessRoleModel.fromJson(data)).toList();
      model.roleList = typeList;
    }

    return model;
  }
}
