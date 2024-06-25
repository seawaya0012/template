class DuplicateAccountsModel {

  String? oneId = "";
  String? email = "";

  DuplicateAccountsModel();
  factory DuplicateAccountsModel.fromJson(Map<dynamic, dynamic> json) {
    DuplicateAccountsModel model = DuplicateAccountsModel();

  model.oneId = json["one_id"];
  model.email = json["email"];

  return model;
  }
  }
