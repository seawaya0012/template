import 'branch_detail_bybusinessid_model.dart';
import 'business_role_model.dart';

class BusinessLoginServiceModel {
  String? companyFullNameTH = "";
  String? companyFullNameEng = "";
  String? displayName = "";
  String? profilePicture = "";
  String? ownerMappingId = "";
  String? businessId = "";
  String? accountUd = "";
  String? nameTH = "";
  String? nameEng = "";
  String? titleTH = "";
  String? titleEng = "";
  String? taxId = "";
  String? companyPicture = "";
  String? partnerId = "";
  String? uid = "";
  // String? role = "";
  List<BusinessRoleModel>? roleList = [];
  BranchByBusinessIdModel? branch = BranchByBusinessIdModel();

  BusinessLoginServiceModel();
  factory BusinessLoginServiceModel.fromJson(Map<dynamic, dynamic> json) {
    BusinessLoginServiceModel model = BusinessLoginServiceModel();

    model.companyFullNameTH = json["company_full_name_th"];
    model.companyFullNameEng = json["company_full_name_eng"];
    model.displayName = json["display_name"];
    model.profilePicture = json["profile_picture"];
    model.ownerMappingId = json["owner_mapping_id"];
    model.businessId = json["business_id"];
    model.accountUd = json["account_ud"];
    model.nameTH = json["name_th"];
    model.nameEng = json["name_eng"];
    model.titleTH = json["title_th"];
    model.titleEng = json["title_eng"];
    model.taxId = json["tax_id"];
    model.companyPicture = json["company_picture"];
    model.partnerId = json["partner_id"];
    model.uid = json["uid"];
    // model.role = json["role"];

    if (json["role"] != null) {
      // print('json["role"]');
      // print(json["role"]);
      var list = json["role"] as List;
      List<BusinessRoleModel> typeList =
      list.map((data) => BusinessRoleModel.fromJson(data)).toList();
      model.roleList = typeList;
    }

    if (json["branch"] != null) {
      model.branch = BranchByBusinessIdModel.fromJson(json["branch"]);
    }

    return model;
  }
}
