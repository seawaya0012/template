import '../../model/business/branch_no_by_taxid_model.dart';
import '../base_response.dart';

class BranchNoByTaxIdResponse extends BaseResponse {
  late List<BranchNoByTexIdModel> branchNoByTexIdModel;

  BranchNoByTaxIdResponse({dynamic json}) : super(json);

  factory BranchNoByTaxIdResponse.fromJson(Map<String, dynamic> json) {
    BranchNoByTaxIdResponse response = BranchNoByTaxIdResponse(json: json);
    if (json["data"] != null) {
      var list = json["data"] as List;
      List<BranchNoByTexIdModel> appList =
          list.map((data) => BranchNoByTexIdModel.fromJson(data)).toList();
      response.branchNoByTexIdModel = appList;
    }
    return response;
  }
}
