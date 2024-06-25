class AccountGetRoleModel{
  String? id = "";
  String? roleName = "";
  String? roleLevel = "";
  String? createdAt = "";
  String? createdBy = "";
  String? updatedAt = "";
  String? updatedBy = "";

  AccountGetRoleModel();
  factory AccountGetRoleModel.fromJson(Map<dynamic, dynamic> json){
    AccountGetRoleModel model = AccountGetRoleModel();
    model.id = json['id'];
    model.roleName = json['role_name'];
    model.roleLevel = json['role_level'];
    model.createdAt = json['created_at'];
    model.createdBy = json['created_by'];
    model.updatedAt = json['updated_at'];
    model.updatedBy = json['updated_by'];

    return model;
  }
  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = Map<String, dynamic>();

    data["id"] = id ?? "";
    data["role_name"] = roleName ?? "";
    data["role_level"] = roleLevel ?? "";
    data["created_at"] = createdAt ?? "";
    data["createdBy"] = createdBy ?? "";
    data["updated_at"] = updatedAt ?? "";
    data["updated_by"] = updatedBy ?? "";

    return data;
  }
}