class BranchByBusinessIdModel{
  String? companyPicture = "";
  String? nameEng = "";
  String? nameTh = "";
  String? taxId = "";
  String? branchNo = "";
  String? branchName = "";


  BranchByBusinessIdModel();
  factory BranchByBusinessIdModel.fromJson(Map<dynamic, dynamic> json){
    BranchByBusinessIdModel model = BranchByBusinessIdModel();

    model.companyPicture = json['company_picture'];
    model.nameEng = json['name_eng'];
    model.nameTh = json['name_th'];
    model.taxId = json['tax_id'];
    model.branchNo = json['branch_no'];
    model.branchName = json['branch_name'];

    return model;
  }
}