import 'dart:io' show Platform, exit;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oneplatformtemplate/template/page/home/setting/setting_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/model/notification/sub_topic_list_model.dart';
import '../../api/request/authentication/set_device_token_request.dart';
import '../../api/request/consent/set_onsent_user_request.dart';
import '../../api/request/serviceApp/save_default_app_requast.dart';
import '../../api/service/authentication_service.dart';
import '../../api/service/consent_service.dart';
import '../../api/service/notification_service.dart';
import '../../appManager/local_storage_manager.dart';
import '../../widget/alertpopupDialog/action_alert_dialog.dart';
import '../../widget/alertpopupDialog/bottomsheet_terms_and_conditions.dart';
import 'servicepage/service_page.dart';

class MyHomePage extends StatefulWidget {
  final int selectPage;
  final String actionType;
  final String businessId;
  final bool isDefaultApp ;

  const MyHomePage({Key? key, required this.selectPage, required this.actionType, required this.businessId, required this.isDefaultApp}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double textScale = 1.0;
  int _selectPage = 1;
  bool isDarkMode = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _selectPage = widget.selectPage;
    });
    checkConsentOnePlatform();

    checkIsOnDefaultApp();
    setFontSize();
    // checkVersionApp();

  }

  final PageRouteBuilder _homeRoute = PageRouteBuilder(
    pageBuilder: (BuildContext context, _, __) {
      return const MyHomePage(selectPage: 0,
          actionType: '',
          businessId: '',
          isDefaultApp: false
      );
    },
  );

  final PageRouteBuilder _chatBotRoute = PageRouteBuilder(
    pageBuilder: (BuildContext context, _, __) {
      return const MyHomePage(selectPage: 1,
          actionType: '',
          businessId: '',
          isDefaultApp: false
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: textScale),
      child: WillPopScope(
        onWillPop: () async => false,
        child: CupertinoTabScaffold(
          // controller: cupertinoTabController,
          tabBar: CupertinoTabBar(
            onTap: (index) async {
              print('index : ${index}');
              if (_selectPage == index) {
                if (index == 0) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    _homeRoute,
                        (Route<dynamic> r) => false,
                  );
                  return; // เพิ่มบรรทัดนี้เพื่อป้องกันการทำงานเพิ่มเติมหลังจากการพาไปยังหน้าอื่น
                }
              }
              setState(() {
                _selectPage = index;
              });
              // if (index == 1) {
              //   setState(() {
              //     chatBotTest().then((value) {
              //       if (businessIdCheckId.isNotEmpty) {
              //         pageOneTabNavKey.currentState?.popUntil((r) => r.isFirst);
              //         Navigation.shared.toMainChatBotWebView(
              //           pageOneTabNavKey.currentContext,
              //           urlChatBot,
              //           false,
              //               () {},
              //           widget.actionType,
              //           widget.businessId,
              //         );
              //         print('urlChatBot have business: $urlChatBot');
              //       }
              //     });
              //   });
              // }


            },
            items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon/icon_house.png',
                    scale: 20,
                    color: _selectPage == 0
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).unselectedWidgetColor,
                  ),
                  label: 'Home'.tr,
                ),
                // BottomNavigationBarItem(
                //   icon: Image.asset(
                //     _selectPage == 1 ? 'assets/icon/icon_chatbot_select_newui.png' : 'assets/icon/icon_chatbot_newui.png',
                //    scale: 20,
                //   ),
                //   label: 'Chat Bot'.tr,
                // ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon/icon_settings.png',
                    scale: 20,
                    color: _selectPage == 1
                    // color: _selectPage == 2
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).unselectedWidgetColor,
                  ),
                  label: 'Setting'.tr,
                ),
        ],),
          tabBuilder: (BuildContext context, int index) {
            _selectPage = index;
            switch(index){
              case 0:return CupertinoTabView(
                builder: (context) =>
                ServicePage(),
              );
              // case 1: return MainChatBotWebView(urlString: urlChatBot,callBack: (){}, isHaveContext: false, actionType: widget.actionType, businessId: widget.businessId,);
              case 1:return SettingPage(callBackFunc: () {},);
              default:return CupertinoTabView(
                builder: (context) =>
                ServicePage(),
              );
            }
          },
        ),
      ),
    );
  }

  // checkVersionApp() async {
  //   var request = CheckVersionAppRequest();
  //   if (Platform.isAndroid) {
  //     request.os = "android";
  //   } else if (Platform.isIOS) {
  //     request.os = "ios";
  //   }
  //   PackageInfo.fromPlatform().then((PackageInfo packageInfo) async {
  //     String version = packageInfo.version;
  //     request.version = version;
  //     await AuthenticationService.postCheckVersionApp(request)
  //         .then((result) => {
  //               if (result.status == 200)
  //                 {
  //                   if (result.checkVersionModel?.forceUpdate == true)
  //                     {
  //                       Navigation.shared.toForceUpdatePage(),
  //                     }
  //                 }
  //               else
  //                 {}
  //             });
  //   });
  // }

  checkIsOnDefaultApp() {
    LocalStorageManager.getIsOnDefaultApp().then((value) {
      setState(() {
        if (value != "") {
          if (value == 'isOn') {
            if(widget.isDefaultApp){
              openDefault();
            }
          } else if (value == 'isOff') {
          } else {}
        } else if (value == "" || value == null) {
          setDefaultAppOff();
        }
      });
    });
  }


  setDefaultAppOff() async {
    var isOnDefaultAppRequest =
        IsOnDefaultAppRequest({'status': 'unSave', 'message': 'isOff'});
    await LocalStorageManager.saveIsOnDefaultApp(isOnDefaultAppRequest);
  }

  openDefault() async {
    LocalStorageManager.getAccessToken().then((accessToken) {
      LocalStorageManager.getDefaultApp().then((value) {
          if (value?.appUrl != "") {
            if (value?.appType == 'webview') {
              String defaultAppUrl =
                  '${value?.appUrl}/${accessToken?.accessToken}';

            } else {
              // Navigation.shared
              //     .toAppServiceMiniappPage(context, value?.appId ?? '', () {});
            }
          } else if (value == "" || value == null) {}

      });
    });
  }

  setFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    final String? fontSize = prefs.getString('font_size');
    setState(() {
      if (fontSize != null) {
        textScale = double.parse(fontSize.toString());
      } else {
        textScale = 1.0;
        prefs.setString('font_size', textScale.toString());
        prefs.setString('font_size_val', '1');
      }
    });
  }


  Future<void> checkConsentOnePlatform() async {
    bool isAccept = false;
    await ConsentService.getConsentOnePlatformUser().then((result) => {
      isAccept = result.model?.accept ?? false,
      if (!isAccept){
        onShowConsent(result.model?.detail ?? '',result.model?.consentId ?? ''),
      }
    });
  }

  void onShowConsent(String consentDetail,String consentId) {
    showModalBottomSheet(
        backgroundColor:
        Theme.of(context).scaffoldBackgroundColor,
        context: context,
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,

        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.0))),
        builder: (BuildContext context) {
          return BottomSheetTermsAndConditions(
            callBack: ((statusAccept) async {
                if (statusAccept){
                  var request = SetConsentUserRequest();
                  request.consentId = consentId;
                  await ConsentService.postSetConsentUser(request);
                }else{
                  showWarningConsent();
                }
            }),
            companyPicture: '', actionInPage: '', businessId: '', roleId: '', deptId: '', roleName: '', goToBiz: '', isDarkMode: isDarkMode, consentType: consentDetail != '' ? 'html': 'text', consentDetail: consentDetail,
          );
        });
  }

  void showWarningConsent() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => ActionAlertDialog(title: '', description:
        'โปรดยอมรับข้อกำหนดการใช้บริการ เพื่อที่ท่านจะสามารถใช้บริการของแอปพลิเคชันได้ท่านต้องการกลับไปแก้ไขความยินยอมหรือไม่?', textLeft: 'ไม่'.tr, textRight: 'กลับไปแก้ไข'.tr, mainContext: context, callbackFunction: (bool callValue){
          if (!callValue){
            checkConsentOnePlatform();
          }else{
            // if (Platform.isIOS) {
              exit(0);
            // } else {
            //   SystemNavigator.pop();
            // }
          }
        })
    );
  }
}
