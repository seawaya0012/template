import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widget/alertpopupDialog/base_confirm_alert_dialog.dart';
import '../../../../widget/appbar/base_appbar.dart';
import '../../../../widget/background_screen/background_color_screen.dart';
import '../../../../widget/image_alert/image_alert.dart';

class FontPage extends StatefulWidget {
  const FontPage({Key? key}) : super(key: key);

  @override
  State<FontPage> createState() => _FontPageState();
}

class _FontPageState extends State<FontPage> {
  final List chooseList = [
    {'name': 'Small', 'size': 1.0, 'value': '1', 'onCheck': false},
    {'name': 'Medium', 'size': 1.2, 'value': '2', 'onCheck': false},
    {'name': 'Large', 'size': 1.4, 'value': '3', 'onCheck': false},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // 1
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_outlined)),
        titleSpacing: 0.0,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            // textAlign: TextAlign.center,
            'Search General'.tr,
            style: TextStyle(
                color:  Colors.white ,fontWeight: FontWeight.w700, fontSize: 18
            ),
          ),
        ),
      ),
      body: _buildFontSizeList(),
    );
  }

  _buildFontSizeList() {
    return Stack(
      children: [
        BackgroundColorScreen(haveNavigationBar: true,haveMainApp: false,),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: chooseList.length,
              itemBuilder: (context, index) {
                return _buildFontSizeItem(chooseList[index]['name'], index);
              },
            ),
          ),
        ),
      ],
    );
  }

  _buildFontSizeItem(String showText, int index) {
    return InkWell(
      onTap: () {
        showAlertLogOutDialog(
            context, chooseList[index]['size'], chooseList[index]['value']);
        print(chooseList[index]['value']);
      },
      child: Column(
        children: [
          Container(
            height: 48,
            decoration: index == 0
                ? BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0),
                    ))
                : index == chooseList.length - 1
                    ? BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(15.0),
                          bottomRight: const Radius.circular(15.0),
                        ))
                    : BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Text(
                        showText.tr,
                        textAlign: TextAlign.left,
                        textScaleFactor: chooseList[index]['size'],
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: chooseList[index]['onCheck']
                        ? Icon(
                            Icons.radio_button_checked,
                            color: Theme.of(context).primaryColor,
                          )
                        : Icon(
                            Icons.radio_button_unchecked,
                            color: Theme.of(context).primaryColor,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showAlertLogOutDialog(BuildContext context, double size, String value) {
    double textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context, builder:(BuildContext context){
      return Dialog(
        insetPadding: EdgeInsets.all(0),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: textScale == 1.3 ? 340 : 280,
            width: 313,
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Container(
                //     padding: EdgeInsets.all(4),
                //     alignment: Alignment.topRight,
                //     child: IconButton(
                //         constraints: BoxConstraints(),
                //         onPressed: (){
                //           Navigator.pop(context);
                //         }, icon: Icon(Icons.clear,color: Color(0xff083E5E),))
                // ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    ImagesAssetsPath.imageAlertQuestion,
                    height: 88,
                    width: 88,
                    // color: Theme.of(context).primaryColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 40,right: 40,top: 24),
                  child: Text(
                    '${'You want to change font size'.tr} ?',
                    // maxLines: 6,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 32,right: 32,top: 16),
                  child: Text(
                    'Application will close'.tr,
                    // maxLines: 6,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16,32,16,16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                        width: 110,
                        child: OutlinedButton(
                            child: Text(
                                'Cancel'.tr,
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor)
                            ),
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              side: BorderSide(width: 1, color: Theme.of(context).primaryColor),
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            }
                        ),
                      ),
                      Container(
                        width: 110,
                        child: ElevatedButton(
                            child: Text(
                                'Confirm'.tr,
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
                            ),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(color: Theme.of(context).primaryColor)
                                )
                            )
                            ),
                            onPressed: () {
                              setState(() {
                                updateFontSize(size, value);
                              });
                            }
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  // void showAlertLogOutDialog(BuildContext context, double size, String value) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => BaseConfirmAlertDialog(
  //       title: '${'You want to change font size'.tr} ?',
  //       mainContext: context,
  //       callbackFunc: () {
  //         updateFontSize(size, value);
  //       },
  //       alertImage: 'assets/icon/icon_error.png',
  //       description: 'Application will close'.tr,
  //     ),
  //   );
  // }

  updateFontSize(double size, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('font_size', size.toString());
    prefs.setString('font_size_val', value);
    print("object $size , $value");
    initialize();
    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        // if (Platform.isIOS) {
          exit(0);
        // } else {
        //   SystemNavigator.pop();
        // }
      });
    });
  }

  initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final String? fontSize = prefs.getString('font_size');
    print("fontSize : " + fontSize.toString());
    final chooseListLength = chooseList.length;
    if (fontSize != null && chooseListLength > 0) {
      for (int i = 0; i < chooseListLength; i++) {
        setState(() {
          if (chooseList[i]['size'] == double.parse(fontSize.toString())) {
            chooseList[i]['onCheck'] = true;
          } else {
            chooseList[i]['onCheck'] = false;
          }
        });
        print(chooseList[i]['onCheck']);
      }
    } else {
      setState(() {
        chooseList[0]['onCheck'] = true;
        prefs.setString('font_size', 1.0.toString());
      });
      print(chooseList[0]['onCheck']);
    }
  }
}
