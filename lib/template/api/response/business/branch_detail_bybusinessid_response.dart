import '../../model/business/branch_detail_bybusinessid_model.dart';
import '../base_response.dart';

class BranchByBusinessIdResponse extends BaseResponse {
  late BranchByBusinessIdModel? branchByBusinessModel;

  BranchByBusinessIdResponse({dynamic json}) : super(json);
  factory BranchByBusinessIdResponse.fromJson(Map<String, dynamic> json) {
    BranchByBusinessIdResponse response =
        BranchByBusinessIdResponse(json: json);
    if (json["data"] != null) {
      response.branchByBusinessModel =
          BranchByBusinessIdModel.fromJson(json["data"]);
    }

    return response;
  }
}
