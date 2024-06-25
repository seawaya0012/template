import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../navigation.dart';
import '../../../api/model/business/check_have_firstname_and_lastname_model.dart';
import '../../../api/service/business_service.dart';
import '../../../widget/button/gradient_button.dart';

class RegisterCompletePage extends StatefulWidget {
  const RegisterCompletePage({Key? key}) : super(key: key);

  @override
  State<RegisterCompletePage> createState() => _RegisterCompletePageState();
}

class _RegisterCompletePageState extends State<RegisterCompletePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: mediaQuery.width,
        height: mediaQuery.height,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: mediaQuery.width * 0.30,
              height: mediaQuery.width * 0.30,
              child: Image.asset('assets/icon/icon_success.png'),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Text(
                'Create Account complete.'.tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              height: 48,
              child: GradientButton(
                title: 'Get Started'.tr,
                isEnable: true,
                callBack: () {
                  Navigation.shared.toMyHomePage(context);
                },
                isBtnLoading: false,
              ),
            ),
            GestureDetector(
              onTap: () async {
                // Navigation.shared.ToAddBusinessPage(context);
                postCheckHaveFirstnameAndLastname();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  'Add Private Account'.tr,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  postCheckHaveFirstnameAndLastname() async {
    await BusinessService.postCheckHaveFirstnameAndLastname().then((value) {
      if (value.branchByBusinessModel?.isHave == false) {
        Navigation.shared.showInputFirstnameLastnameDialog(context,
            value.branchByBusinessModel ?? CheckHaveFirstnameAndLastnameModel(),
                () {
              postCheckHaveFirstnameAndLastname();
            }, () {
              Navigator.of(context).pop(true);
            });
      } else {
        // Navigation.shared.ToAddBusinessPage(context);
      }
    });
  }
}
