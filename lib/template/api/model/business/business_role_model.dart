class BusinessRoleModel {
  String? roleId = "";
  String? roleName = "";
  String? roleLevel = "";
  String? deptName = "";
  String? deptId = "";
  String? deptPosition = "";

  BusinessRoleModel();
  factory BusinessRoleModel.fromJson(Map<dynamic, dynamic> json) {
    BusinessRoleModel model = BusinessRoleModel();

    model.roleId = json["role_id"];
    model.roleName = json["role_name"];
    model.roleLevel = json["role_level"];
    model.deptName = json["dept_name"];
    model.deptId = json["dept_id"];
    model.deptPosition = json["dept_position"];

    return model;
  }
}
