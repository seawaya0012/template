class AutoJoinBizRequest {
  String businessId = "";
  String deptId = "";
  bool goToBiz = false;
  String roleId = "";
  String roleName = "";

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["biz_id"] = businessId;
    data["dept_id"] = deptId;
    data["go_to_biz"] = goToBiz;
    data["role_id"] = roleId;
    data["role_name"] = roleName;

    return data;
  }
}
