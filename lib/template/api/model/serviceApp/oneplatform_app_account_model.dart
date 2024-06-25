import 'dart:convert';

import '../business/business_role_model.dart';

class BusinessProfileModel {
  String? businessId = "";
  String? companyNameEng = "";
  String? companyFullNameEng = "";
  String? companyNameTh = "";
  String? companyFullNameTh = "";
  String? companyPicture = "";
  String? displayName = "";
  String? profilePicture = "";
  String? typeAccount = "";
  String? businessColor = "";

  String? approveStatus = "";
  String? oneId = "";
  String? status = "";
  List<BusinessRoleModel>? roleList = [];

  String? branchName = "";
  String? branchNo = "";
  String? taxId = "";
  String? businessEmail = "";

  BusinessProfileModel();
  factory BusinessProfileModel.fromJson(Map<dynamic, dynamic> json) {
    BusinessProfileModel model = BusinessProfileModel();

    model.businessId = json["business_id"];
    model.companyNameEng = json["company_name_eng"];
    model.companyFullNameEng = json["company_full_name_eng"];
    model.companyNameTh = json["company_name_th"];
    model.companyFullNameTh = json["company_full_name_th"];
    model.companyPicture = json["company_picture"];
    model.businessColor = json["business_color"];
    model.branchName = json["branch_name"];
    model.branchNo = json["branch_no"];
    model.taxId = json['tax_id'];

    model.oneId = json["one_id"];
    model.status = json["status"];
    model.approveStatus = json["approve_status"];
    if (json["role"] != null) {
      var list = json["role"] as List;
      List<BusinessRoleModel> typeList =
          list.map((data) => BusinessRoleModel.fromJson(data)).toList();
      model.roleList = typeList;
    }

    model.displayName = json["display_name"];
    model.profilePicture = json["profile_picture"];
    model.typeAccount = json["type_account"];
    model.businessEmail = json["business_email"];
    return model;
  }

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();

    data["business_id"] = businessId ?? "";
    data["company_name_eng"] = companyNameEng ?? "";
    data["company_full_name_eng"] = companyFullNameEng ?? "";
    data["company_name_th"] = companyNameTh ?? "";
    data["company_full_name_th"] = companyFullNameTh ?? "";
    data["company_picture"] = companyPicture ?? "";
    data["display_name"] = displayName ?? "";
    data["profile_picture"] = profilePicture ?? "";
    data["type_account"] = typeAccount ?? "";
    data["business_color"] = businessColor ?? "";
    data['tax_id'] = taxId ??'';

    data["one_id"] = oneId ?? "";
    data["status"] = status ?? "";
    // List<String> stringList =
    //     (jsonDecode(roleList.toString()) as List<dynamic>).cast<String>();
    // data["role"] = stringList.toString();
    data["branch_name"] = branchName ?? "";
    data["branch_no"] = branchNo ?? "";

    return data;
  }
}
