import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/model/business/check_have_firstname_and_lastname_model.dart';
import '../../api/request/business/firstname_and_lastname_th_request.dart';
import '../../api/service/business_service.dart';
import '../../appManager/app_theme.dart';
import '../background_screen/background_color_screen.dart';
import '../base_dropdown.dart';
import '../button/gradient_button.dart';
import 'custom_snackbar.dart';

class InputFirstnameLastnameDialog extends StatefulWidget {
  final VoidCallback callbackFunc;
  final VoidCallback cancelCallbackFunc;
  final CheckHaveFirstnameAndLastnameModel userData;
  const InputFirstnameLastnameDialog(
      {Key? key, required this.callbackFunc, required this.cancelCallbackFunc, required this.userData})
      : super(key: key);

  @override
  State<InputFirstnameLastnameDialog> createState() =>
      _InputFirstnameLastnameDialog();
}

class _InputFirstnameLastnameDialog
    extends State<InputFirstnameLastnameDialog> {
  bool isEnable = false,
      isBtnLoading = false,
      isDarkMode = false,
      firstNameIsThai = true,
      lastNameIsThai = true;
  String selectNameTitle = 'นาย';

  TextEditingController firstnameTextEditingController =
          TextEditingController(),
      lastnameTextEditingController = TextEditingController();

  final listSelectNameTitle = [
    'นาย',
    'นาง',
    'นางสาว',
    'เด็กชาย',
    'เด็กหญิง',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setStatusBar();
    setState(() {
      firstnameTextEditingController.text = widget.userData.firstnameTh ?? '';
      lastnameTextEditingController.text = widget.userData.lastnameTh ?? '';
      if (widget.userData.titleNameTh != '' && listSelectNameTitle.contains(widget.userData.titleNameTh)){
        selectNameTitle = widget.userData.titleNameTh ?? 'นาย';
      }
      checkInput();
    });
    // checkInput();
  }

  setStatusBar() async {
    ThemeProvider().isDarkMode.then((value) => {
          setState(() {
            isDarkMode = value;
          })
        });
  }

  checkInput() {
    final thaiRegEx = RegExp(r'^[ก-๛]+$');
    setState(() {
      firstNameIsThai =
          thaiRegEx.hasMatch(firstnameTextEditingController.text.trim());
      lastNameIsThai =
          thaiRegEx.hasMatch(lastnameTextEditingController.text.trim());
    });
    if (firstnameTextEditingController.text.isNotEmpty &&
        lastnameTextEditingController.text.isNotEmpty &&
        firstNameIsThai &&
        lastNameIsThai) {
      setState(() {
        isEnable = true;
      });
    } else {
      setState(() {
        isEnable = false;
      });
    }
  }

  postRequestJoinBiz() async {
    setState(() {
      isBtnLoading = true;
      isEnable = false;
    });

    var request = FirstnameAndLastnameThRequest();
    request.titleNameTh = selectNameTitle;
    request.firstnameTh = firstnameTextEditingController.text.tr;
    request.lastnameTh = lastnameTextEditingController.text.tr;
    await BusinessService.postAddFirstnameAndLastnameTh(request)
        .then((value) => {
              if (value.status == 200)
                {

                  // if(){
                    CustomSnack.show(context, 'Save Success.'.tr),
                    Navigator.pop(context),
                    // Navigation.shared.toMyHomePage(context),
                    // Navigation.shared.ToAddBusinessPage(context),
                    widget.callbackFunc(),

                  // }else {
                  //   Navigation.shared.ToAddBusinessPage(context),
                  //
                  // }

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => BusinessAddPage()),
                  // );
                },
              setState((){
                isBtnLoading = false;
                isEnable = true;
              })

            });
  }

  @override
  Widget build(BuildContext context) {
    return
      // WillPopScope(
      // onWillPop: () async {
      //   if (Navigator.of(context).userGestureInProgress)
      //     return false;
      //   else
      //     return true;
      // },
      // child:
      Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent, // 1
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  widget.cancelCallbackFunc;
                },
                icon: Icon(Icons.arrow_back_ios_outlined)),
            titleSpacing: 0.0,
            title: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                // textAlign: TextAlign.center,
                'User Information'.tr,
                style: TextStyle(
                  color:  Colors.white ,fontWeight: FontWeight.w700, fontSize: 18
                ),
              ),
            ),
          ),
        body: Stack(children: [
          BackgroundColorScreen(haveNavigationBar: false,haveMainApp: false,),

          SafeArea(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(

                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                        'Please enter user information. for the system to be used to authenticate access access to corporate accounts'.tr),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.8)),
                    child: Column(
                      children: [
                        Container(
                            // width: MediaQuery.of(context).size.width,
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                            child: Text(
                              'Title name'.tr,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              maxLines: 1,
                            )),
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: BaseDropdown(
                            dropdownValue: selectNameTitle,
                            callBackText: (String text) {
                              setState(() {
                                selectNameTitle = text;
                              });
                            },
                            items: listSelectNameTitle,
                            isEdit: true,
                            title: 'Select title name'.tr,
                            text: '',
                            isDarkMode: isDarkMode,
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            // alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text(
                              'Firstname'.tr,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            )),
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: firstnameTextEditingController,
                            decoration: InputDecoration(
                              filled: true,

                              fillColor: Colors.white,
                              contentPadding:
                              EdgeInsets.fromLTRB(16.0, 15.0, 20.0, 14.0),
                              hintText: 'Fill in Firstname'.tr,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xffE6E6E6).withOpacity(0.9)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              // errorText: userInput.text.isEmpty?"Error":null,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              hintStyle: TextStyle(
                                // color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffC4C4C4)),
                              labelStyle: TextStyle(
                                // color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onChanged: (text) {
                              checkInput();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Fill Data'.tr;
                              }
                              return null;
                            },
                          ),
                        ),
                        firstNameIsThai
                            ? Container()
                            : Container(
                            width: MediaQuery.of(context).size.width,
                            // alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                            child: Text(
                              'Please fill information in Thai.'.tr,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).errorColor),
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            // alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text(
                              'Lastname'.tr,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            )),
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: lastnameTextEditingController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                              EdgeInsets.fromLTRB(16.0, 15.0, 20.0, 14.0),
                              hintText: 'Fill in Lastname'.tr,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xffE6E6E6).withOpacity(0.9)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              // errorText: userInput.text.isEmpty?"Error":null,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              hintStyle: TextStyle(
                                // color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffC4C4C4)),
                              labelStyle: TextStyle(
                                // color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onChanged: (text) {
                              checkInput();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Fill Data'.tr;
                              }
                              return null;
                            },
                          ),
                        ),
                        lastNameIsThai
                            ? Container(
                          padding: EdgeInsets.only(bottom: 16),
                        )
                            : Container(
                            width: MediaQuery.of(context).size.width,
                            // alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Text(
                              'Please fill information in Thai.'.tr,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).errorColor),
                            )),

                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 80, 0, 8),
                    // padding: EdgeInsets.fromLTRB(16, 50, 16, 0),
                    height: 48,
                    child: GradientButton(
                      title: 'Confirm'.tr,
                      isEnable: isEnable,
                      callBack: () {

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => BusinessAddPage()),
                        // );
                        postRequestJoinBiz();
                      },
                      isBtnLoading: isBtnLoading,
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    // margin: EdgeInsets.only(left: 16),
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              side: BorderSide(
                                width: 1,
                                color: Theme.of(context).errorColor,
                              )),
                          padding: EdgeInsets.all(0.0),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      // style: ButtonStyle(
                      //   shape: RoundedRectangleBorder(),
                      //   foregroundColor:
                      //       MaterialStateProperty.all<Color>(Colors.white),
                      //   backgroundColor: MaterialStateProperty.all<Color>(
                      //       Theme.of(context).errorColor),
                      // ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                        widget.cancelCallbackFunc();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Cancel'.tr,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).errorColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],)

      );
  }
}
