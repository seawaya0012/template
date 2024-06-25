class SetConsentUserRequest {
String consentId = '';


Map<String, dynamic> toJson() {
  Map<String, dynamic> data = Map<String, dynamic>();
  data["consent_id"] = consentId;

  return data;
}
}