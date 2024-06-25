class BranchNoByTexIdModel{
  String? bizId = "";
  String? nameOnDocumentTh = "";
  String? branchNo = "";
  String? branchName = "";

  BranchNoByTexIdModel();
  factory BranchNoByTexIdModel.fromJson(Map<dynamic, dynamic> json){
    BranchNoByTexIdModel model = BranchNoByTexIdModel();
    model.bizId = json['biz_id'];
    model.nameOnDocumentTh = json['name_on_document_th'];
    model.branchNo = json['branch_no'];
    model.branchName = json['branch_name'];

    return model;
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = Map<String, dynamic>();

    data["biz_id"] = bizId ?? "";
    data["name_on_document_th"] = nameOnDocumentTh ?? "";
    data["branch_no"] = branchNo ?? "";
    data["branch_name"] = branchName ?? "";

    return data;
  }
}