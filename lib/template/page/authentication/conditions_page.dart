import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/appbar/base_appbar.dart';
import '../../widget/button/gradient_button.dart';

class ConditionsPage extends StatefulWidget {
  const ConditionsPage({Key? key}) : super(key: key);

  @override
  State<ConditionsPage> createState() => _ConditionsPageState();
}

class _ConditionsPageState extends State<ConditionsPage> {
  ScrollController checkMaxScroll = ScrollController();
  bool checkBottom = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollToEnd();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(appbarTitle: 'Terms and Conditions of Use',),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Theme(
                data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Theme.of(context).primaryColor)
                ),
                child: SingleChildScrollView(
                  controller: checkMaxScroll,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: Column(
                      children: [
                        Text(
                          'Conditions of Use'.tr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            // color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                            "The objectives of ONE ID account terms of use (called “Terms”) are set to declare terms and conditions for the use of all services related to ONE ID account (called “Central Account”)  , provided by Thai Identities Co., Ltd. and the affiliated companies (called “Company”) \n A customer must use the central account conforming to this term, including terms and conditions. The customer must take responsibilities for following all related laws and rules when using the central account."),
                        Text(
                          '1  Registration, Declination of Authentication, and Cancellation of Authentication',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Theme.of(context).primaryColor),
                        ),
                        Text(
                            "1.1 Either the customer is an ordinary or a juristic person, the customer will receive an account (called “Central Account”) for using the central account through registration by any methods set by company. \n1.2 When the customer registers for the central account by any methods set by company, and the registration is approved, the company may confirm the central account (called “Confirmed Central Account”)\n1.3 In case the company views that one of the following issues happens to the customer, the company can decline the request for confirmed the central account or cancel the authorization of confirmed the central account."),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(32, 8, 16, 16),
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.width*0.5,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      side: BorderSide(
                        color: Colors.red,
                        // style: BorderStyle.solid,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:Text('Decline'.tr,style: TextStyle(color: Colors.red,fontSize: 16),),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 8, 32, 16),
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.width*0.5,
                  child: GradientButton(
                    title: 'Accept'.tr,
                    isEnable: checkBottom ? true : false,
                    callBack: () {
                      print('object');
                    },
                    isBtnLoading: false,
                  ),
                ),
                // Expanded(
                //   child: Container(
                //     margin: EdgeInsets.fromLTRB(32, 8, 32, 16),
                //     height: 48,
                //     child: GradientButton(
                //       title: 'Accept'.tr,
                //       isEnable: true,
                //       callBack: () {
                //         print('object');
                //       },
                //       isBtnLoading: false,
                //     ),
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _scrollToEnd() {
    checkMaxScroll.addListener(() {
      if (checkMaxScroll.position.pixels == checkMaxScroll.position.maxScrollExtent) {
        setState(() {
          checkBottom = true;
        });
      }
    });
  }
}
