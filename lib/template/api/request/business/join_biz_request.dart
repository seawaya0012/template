class JoinBizRequest {
  String businessId = "";
  String roleId = "";
  String employeeID = "";

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data["business_id"] = businessId;
    data["role_id"] = roleId;
    data["employee_id"] = employeeID;

    return data;
  }
}

