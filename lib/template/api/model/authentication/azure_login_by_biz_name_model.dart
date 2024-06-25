class AzureLoginByBizNameModel {

  String? idpName = '';
  String? link = '';

  AzureLoginByBizNameModel();
  factory AzureLoginByBizNameModel.fromJson(Map<dynamic, dynamic> json){
    AzureLoginByBizNameModel model = AzureLoginByBizNameModel();

    model.idpName = json['idp_name'];
    model.link = json['link'];

    return model;
  }
}