class ConsentAppModel{

  bool? isHaveConsent = false;
  bool? accept = false;
  String?  consentId = '';
  String?  detail = '';
  String?  version = '';

  ConsentAppModel();
  factory ConsentAppModel.fromJson(Map<dynamic, dynamic> json){
    ConsentAppModel model = ConsentAppModel();
    model.isHaveConsent = json['is_have_consent'] ?? false;
    model.accept = json['accept'] ?? false;
    model.consentId = json['consent_id'];
    model.detail = json['detail'];
    model.version = json['version'];
    return model;
  }

}