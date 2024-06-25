class AccountSetActiveRequest {
  String oneId = "";
  String removeReason = "";
  bool setActive = false;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["one_id"] = oneId;
    data["remove_reason"] = removeReason;
    data["set_active"] = setActive;

    return data;
  }
}
