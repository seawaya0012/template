import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../../../../main.dart';
import '../../../../../../navigation.dart';
import '../../../../../api/request/business/auto_join_biz_request.dart';
import '../../../../../api/service/business_service.dart';

import '../../../../../widget/alertpopupDialog/alert_popup.dart';
import '../../../../../widget/appbar/base_appbar.dart';
import '../../../../../widget/button/gradient_button.dart';

class ConsentLicensesPage extends StatefulWidget {
  const ConsentLicensesPage({Key? key, required this.companyPicture, required this.actionInPage, required this.businessId, required this.roleId, required this.deptId, required this.roleName, required this.goToBiz, required this.consentType, required this.consentDetail, required this.isDarkMode, required this.callBack}) : super(key: key);
  final String companyPicture;
  final String actionInPage;
  final String businessId;
  final String roleId;
  final String deptId;
  final String roleName;
  final String goToBiz;
  final String consentType;
  final String consentDetail;
  final bool isDarkMode;
  final Function(bool) callBack;

  @override
  State<ConsentLicensesPage> createState() => _ConsentLicensesPageState();
}

class _ConsentLicensesPageState extends State<ConsentLicensesPage> {
  bool isBtnLoading = false;
  bool isBtnEnable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appbarTitle: 'test',
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(32, 24, 32, 24),
        // height: MediaQuery.of(context).size.height * 0.45,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                      'Terms and Conditions'.tr,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: widget.isDarkMode ? Colors.white: Colors.black,),
                    )),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Icon(Icons.close))
              ],
            ),
            widget.consentType == 'html' ?  Expanded(
              child: SingleChildScrollView(
                  child: Container(
                    child: Html(
                      data: widget.consentDetail.toString(),
                      // style: {
                      //   "img": Style(
                      //       alignment: Alignment.center,
                      //       padding: EdgeInsets.symmetric(horizontal: 30)),
                      //   "h3": Style(color: Colors.red, alignment: Alignment.center),
                      //   'html':
                      //   Style(textAlign: TextAlign.center, fontSize: FontSize(18))
                      // },
                    ),
                  )
              ),
            ) :     Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   margin: EdgeInsets.symmetric(vertical: 16),
                    //   child: Image.network(
                    //     widget.companyPicture,
                    //     width: 182,
                    //     height: 170,
                    //     errorBuilder: (context, error, stackTrace) {
                    //       return Container(
                    //         // color: Theme.of(context).primaryColor,
                    //         alignment: Alignment.center,
                    //         child: Icon(
                    //           Icons.business_sharp,
                    //           color: Theme.of(context).cardColor,
                    //           size: 80,
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Text(
                        "BusinessUsTerms".tr,
                        style: TextStyle(
                            color: widget.isDarkMode ? Colors.white: Colors.black,
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 48,
              margin: EdgeInsets.fromLTRB(0, 24, 0, 16),
              child: GradientButton(
                title: 'Accept'.tr,
                isEnable: isBtnEnable,
                callBack: () {
                  if( widget.actionInPage == ''){
                    Navigator.pop(context);
                    widget.callBack(true);
                  }else{
                    if( widget.actionInPage == 'onPostAutoJoinBiz'){
                      onPostAutoJoinBiz(widget.businessId, widget.roleId, widget.deptId, widget.roleName, widget.goToBiz);
                    }else if(widget.actionInPage ==  'toRegisterPage'){
                      Navigator.pop(context);
                      widget.callBack(true);
                    }
                  }
                },
                isBtnLoading: isBtnLoading,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                widget.callBack(false);
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.width * 0.13,
                padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                child: Container(
                    padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
                    // width: 96,
                    // width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Not Accept'.tr,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffCCCCCC),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    )),
              ),
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shadowColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      )),
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xffE6E6E6),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  onPostAutoJoinBiz(String businessId,String roleId,String deptId,String roleName,String goToBiz,) async {
    setState(() {
      isBtnLoading = true;
      isBtnEnable = false;
    });
    var request = AutoJoinBizRequest();
    request.businessId = businessId;
    request.roleId = roleId;
    request.deptId = deptId;
    request.roleName = roleName;
    request.goToBiz = (goToBiz == 'true');
    print("onPostAutoJoinBiz: ${request.goToBiz}" );
    await BusinessService.postAutoJoinBiz(request).then((value) => {
      setState(() {
        isBtnLoading = false;
        isBtnEnable = true;
      }),
      if (value.status == 200)
        {
          print('autoJoinBizModel : goToBiz  ${value.autoJoinBizModel?.goToBiz} ${value.autoJoinBizModel?.bizId}'),
          if (value.autoJoinBizModel?.goToBiz ?? false){
            Navigation.shared.toMyHomePageWithActionJumpToBis(GlobalVariable.navState.currentContext, 'go_to_biz', value.autoJoinBizModel?.bizId ?? '')
          }else{
            showDialog(
                context: GlobalVariable.navState.currentContext!,
                builder: (BuildContext context) => AlertPopup(
                  description: '${value.message}'.tr,
                  icon: Icons.check_circle_rounded,
                  title: '',
                  callBack: () {
                    // Navigator.of(context).pop();
                  },
                )),
          }
        }
      else
        {
          showDialog(
              context: GlobalVariable.navState.currentContext!,
              builder: (BuildContext context) => AlertPopup(
                description: '${value.message}'.tr,
                icon: Icons.error_outline_outlined,
                title: '',
                callBack: () {
                  // Navigator.of(context).pop();
                },
              )),
        }
    });
  }

}
