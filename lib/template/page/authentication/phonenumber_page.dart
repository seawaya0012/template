import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:get/get.dart';

import '../../widget/alertpopupDialog/alert_popup.dart';
import '../../widget/button/gradient_button.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({
    Key? key,
    required this.callBack,
    required this.path,
  }) : super(key: key);
  final Function(String) callBack;
  final String path;

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  String userPhoneNumber = "";
  bool isBtnLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  final checkNumberData = GlobalKey<FormState>();
  TextEditingController phonenumberTextEditingController =
      TextEditingController();
  bool isStatusButton = false;
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
              height: 48,
              child: Form(
                key: checkNumberData,
                child: TextFormField(
                  controller: phonenumberTextEditingController,
                  keyboardType: TextInputType.number,
                  cursorHeight: 20,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    //add prefix icon
                    prefixIcon: Icon(
                      Icons.phone,
                      // color: Color(0xffC4C4C4)
                      // color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color(0xffE6E6E6).withOpacity(0.9)),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    // errorText: userInput.text.isEmpty?"Error":null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    // fillColor: Colors.grey,
                    hintText: "Phone Number".tr,
                    //make hint text
                    hintStyle: TextStyle(
                        // color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffC4C4C4)),
                    labelStyle: TextStyle(
                      // color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  inputFormatters: [MaskedInputFormatter('00-0000-0000')],
                  validator: (value) {
                    if (value?.length != 12) {
                      return 'โปรดใส่ข้อมูลให้ครบ 10 ตัว';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    setState(() {
                      userPhoneNumber = phonenumberTextEditingController.text
                          .replaceAll("-", "");
                      if (userPhoneNumber.length == 10) {
                        isStatusButton = true;
                      } else {
                        isStatusButton = false;
                      }
                    });
                  },
                ),
              )),

          // Container(
          //   margin: EdgeInsets.fromLTRB(32, 0, 32, 16),
          //   alignment: Alignment.topRight,
          //   // color: Colors.cyanAccent,
          //   child: Text(
          //     "You'll receive SMS to verify your Identity for registration.".tr,
          //     style: TextStyle(
          //       fontSize: 12,
          //       color: Color(0xff999999),
          //     ),
          //   ),
          // ),
          widget.path != 'RegisterPage'
              ? Container(
                  height: 16,
                  // color: Colors.cyanAccent,
                  // padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  margin: EdgeInsets.fromLTRB(32, 0, 32, 16),
                  alignment: Alignment.topRight,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertPopup(
                                  description:
                                      '''One Centric Co.,Ltd \n 1768 Thai Summit Tower 16th Floor\n New Petchaburi Road \n Bangkapi Huay Kwang \n Bangkok 10310 THAILAND\n Email: onechat@one.th'''
                                          .tr,
                                  icon: Icons.error_outline_outlined,
                                  title: "Contact Us".tr,
                                  callBack: () {
                                    // Navigator.of(context).pop();
                                  },
                                ));
                      },
                      child: Text(
                        'Need help'.tr,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff999999),
                        ),
                      )))
              : Container(
                  height: 16,
                  margin: EdgeInsets.fromLTRB(32, 0, 32, 16),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "You'll receive SMS to verify your Identity for registration."
                        .tr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff999999),
                    ),
                  )),

          Container(
            margin: EdgeInsets.fromLTRB(32, 8, 32, 16),
            height: 48,
            child: GradientButton(
              title: 'Continue'.tr,
              isEnable: isStatusButton,
              callBack: () {
                if (checkNumberData.currentState!.validate()) {
                  widget.callBack(userPhoneNumber);
                }
              },
              isBtnLoading: isBtnLoading,
            ),
          ),
        ],
      ),
    );
  }
}
