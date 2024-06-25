class AzureCheckIsLoginModel {

  bool? isLogin;
  String? firstName = '';
  String? lastName = '';
  String? email = '';
  String? mobileNo = '';

  AzureCheckIsLoginModel();
  factory AzureCheckIsLoginModel.fromJson(Map<dynamic, dynamic> json){
    AzureCheckIsLoginModel model = AzureCheckIsLoginModel();
    model.isLogin = json['is_login'];
    model.firstName = json['first_name'];
    model.lastName = json['last_name'];
    model.email = json['email'];
    model.mobileNo = json['mobile_no'];

    return model;
  }
}