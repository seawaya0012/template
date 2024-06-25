
class NewServiceModel {
  String? appId = "";
  String? appName = "";
  String? appPicture = "";
  String? appType = "";
  String? appUrl = "";
  String? notification = "";
  String? createdAt = "";
  String? isInGroup = "";
  String? isPublic = "";
  bool? isFavorite = false;
  String? isNotify = "";
  String? isShowAppDetail = "";
  String? rule = "";
  String? ruleData = "";
  String? isLock = "";
  String? isConsent = "";
  String? checkConsent = "";
  String? sortTime = "";
  String? businessId = "";
  String? companyPicture = "";
  String? businessNameTh = "";
  String? businessNameEng = "";
  String? homePin = "";
  String? isDefaultApp = "";
  String? isPinSet = "";
  bool? isCloseLoadingButton = true;

  String? isDefaultAppPrivate = "";

  NewServiceModel();
  factory NewServiceModel.fromJson(Map<dynamic, dynamic> json) {
    NewServiceModel model = NewServiceModel();
    model.appId = json["app_id"];
    model.appName = json["app_name"];
    model.appPicture = json["app_picture"];
    model.appType = json["app_type"];
    model.appUrl = json["app_url"];
    model.notification = json["notification"].toString();
    model.createdAt = json["created_at"];
    model.isInGroup = json["is_in_group"].toString();
    model.isPublic = json["is_public"].toString();
    model.isFavorite = json["is_favorite"].toString() == 'true' ? true : false;
    model.isNotify = json["is_notify"].toString();
    model.isShowAppDetail = json["is_show_app_detail"].toString();
    model.rule = json["rule"];
    model.ruleData = json["rule_data"];
    model.isLock = json["is_lock"].toString();
    model.isConsent = json["is_consent"].toString();
    model.checkConsent = json["check_consent"].toString();
    model.sortTime = json["sort_time"];
    model.businessId = json["business_id"];
    model.companyPicture = json["company_picture"];
    model.businessNameTh = json["business_name_th"];
    model.businessNameEng = json["business_name_eng"];
    model.homePin = json["home_pin"].toString();
    model.isDefaultApp = json["isDefaultApp"].toString();
    model.isPinSet = json["isPinSet"].toString() == 'true' ? 'true' : 'false';

    model.isDefaultAppPrivate = json["isDefaultAppPrivate"].toString();

    return model;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["app_id"] = appId ?? "";
    data["app_name"] = appName ?? "";
    data["app_picture"] = appPicture ?? "";
    data["app_type"] = appType ?? "";
    data["app_url"] = appUrl ?? "";
    data["notification"] = notification ?? "";
    data["created_at"] = createdAt ?? "";
    data["is_in_group"] = isInGroup ?? "";
    data["is_public"] = isPublic ?? "";
    data["is_favorite"] = isFavorite == 'true' ? true : false;
    data["is_notify"] = isNotify ?? "";
    data["is_show_app_detail"] = isShowAppDetail ?? "";
    data["rule"] = rule ?? "";
    data["rule_data"] = ruleData ?? "";
    data["is_lock"] = isLock ?? "";
    data["is_consent"] = isConsent ?? "";
    data["check_consent"] = checkConsent ?? "";
    data["sort_time"] = sortTime ?? "";
    data["business_id"] = businessId ?? "";
    data["company_picture"] = companyPicture ?? "";
    data["business_name_th"] = businessNameTh ?? "";
    data["business_name_eng"] = businessNameEng ?? "";
    data["home_pin"] = homePin ?? "";
    data["isDefaultApp"] = isDefaultApp ?? "";
    data["isPinSet"] = isPinSet == 'true' ? 'true' : 'false';

    data["isDefaultAppPrivate"] = isDefaultAppPrivate ?? "";

    return data;
  }

}