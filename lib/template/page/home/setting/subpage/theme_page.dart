import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../widget/background_screen/background_color_screen.dart';
import '../../../../widget/image_alert/image_alert.dart';

class ThemePage extends StatefulWidget {
  final VoidCallback callbackfunc;

  const ThemePage({Key? key, required this.callbackfunc}) : super(key: key);

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  final List darkModeList = [
    {'name': 'On'.tr, 'value': 'dark', 'onCheck': false},
    {'name': 'Off'.tr, 'value': 'light', 'onCheck': false},
    {'name': 'System'.tr, 'value': 'system', 'onCheck': false},
  ];

  bool isDarkMode = false;
  bool isOnOrganizeTheme = false;

  final CarouselController _controller = CarouselController();
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.callbackfunc();
  }

  @override
  Widget build(BuildContext context) {
    final double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // 1
        elevation: 0,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            // textAlign: TextAlign.center,
            'Theme'.tr,
            style: TextStyle(
                color:  Colors.white ,fontWeight: FontWeight.w700, fontSize: 18
            ),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              // if(key.currentState?.editMode == true) {
              //   beforeExitEdit();
              // }
              // if(isMoveList == false){
                Navigator.pop(context);
              // }
              // print('keyState ${key.currentState?.editMode}');
              // widget.callBack();
            },
            icon: Icon(Icons.arrow_back_ios_new)
        ),
      ),
      body: Stack(
        children: [
          BackgroundColorScreen(haveNavigationBar: false, haveMainApp: false,),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.02)),
            ),
          ),
          // bgBlur(context),
          SafeArea(
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: CarouselSlider(
                      carouselController: _controller,
                      options: CarouselOptions(
                          initialPage: 0,
                          height: MediaQuery.of(context).size.height * 0.7,
                          aspectRatio: 1.0,
                          enlargeCenterPage: false,
                          enableInfiniteScroll: false,
                          viewportFraction: 0.8,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          }),
                      items: [
                        //blue
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          // width: 280,
                          // padding: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: useMobileLayout
                              ? Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xff5B8FB9),
                                          Color(0xff3D3B93),
                                          Color(0xff3D3B93)
                                        ],
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        tileMode: TileMode.repeated)
                                ),
                              ),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.13,
                                  right: -36,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.17,
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.4,
                                    child: Image.asset(
                                      ImagesAssetsPath.imageLogoMini,
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.001,
                                  left: -25,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(56),
                                    child: SizedBox.fromSize(
                                      size: Size.fromRadius(108),
                                      child: Image.asset(
                                        ImagesAssetsPath.imageLogoBig,
                                        height: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.3,
                                        width: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.4,
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.454,
                                  right: 0,
                                  child: Container(
                                    child: Image.asset(
                                      ImagesAssetsPath.imageLineTop,
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.3,
                                      width: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.4,
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.48,
                                  right: 0,
                                  child: Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.3,
                                      width: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.4,
                                      child: Image.asset(
                                        ImagesAssetsPath.imageLineBottom,
                                      ))),
                            ],
                          )
                              : Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xff5B8FB9),
                                          Color(0xff3D3B93),
                                          Color(0xff3D3B93)
                                        ],
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        tileMode: TileMode.repeated)),
                              ),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.13,
                                  right: -102,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.17,
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.4,
                                    child: Image.asset(
                                      ImagesAssetsPath.imageLogoMini,
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.002,
                                  left: -95,
                                  child: Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.2,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.5,
                                      child: Image.asset(
                                        ImagesAssetsPath.imageLogoTop,
                                      ))),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.69,
                                  right: 0,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.3,
                                    width:
                                    MediaQuery.of(context).size.height *
                                        0.4,
                                    child: Image.asset(
                                      ImagesAssetsPath.imageLineTop,
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.72,
                                  right: 0,
                                  child: Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.3,
                                      width: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.4,
                                      child: Image.asset(
                                        ImagesAssetsPath.imageLineBottom,
                                      ))),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.18,
                                  left: -150,
                                  child: Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.2,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.5,
                                      child: Image.asset(
                                        ImagesAssetsPath.imageCircleLeft,
                                      ))),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.0015,
                                  right: -102,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.12,
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.4,
                                    child: Image.asset(
                                      ImagesAssetsPath.imageCircleTop,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        //green
                        Container(
                          margin: EdgeInsets.only(left: 10,right: 10),
                          // width: 280,
                          // padding: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: useMobileLayout
                              ? Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xffF5EFE6),
                                          Color(0xff628E90),
                                          Color(0xff628E90),
                                          Color(0xff628E90),
                                          Color(0xff628E90),
                                        ],
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        tileMode: TileMode.repeated)
                                ),
                              ),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.13,
                                  right: -36,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.17,
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.4,
                                    child: Image.asset(
                                      ImagesAssetsPath.imageLogoMini,
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.001,
                                  left: -25,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(56),
                                    child: SizedBox.fromSize(
                                      size: Size.fromRadius(108),
                                      child: Image.asset(
                                        ImagesAssetsPath.imageLogoBig,
                                        height: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.3,
                                        width: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.4,
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.454,
                                  right: 0,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.3,
                                    width:
                                    MediaQuery.of(context).size.height *
                                        0.4,
                                    child: Image.asset(
                                      ImagesAssetsPath.imageLineTop,
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.48,
                                  right: 0,
                                  child: Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.3,
                                      width: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.4,
                                      child: Image.asset(
                                        ImagesAssetsPath.imageLineBottom,
                                      ))),
                            ],
                          )
                              : Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xffF5EFE6),
                                          Color(0xff628E90),
                                          Color(0xff628E90),
                                          Color(0xff628E90),
                                          Color(0xff628E90),
                                        ],
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        tileMode: TileMode.repeated)),
                              ),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.13,
                                  right: -102,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.17,
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.4,
                                    child: Image.asset(
                                      ImagesAssetsPath.imageLogoMini,
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.002,
                                  left: -95,
                                  child: Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.2,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.5,
                                      child: Image.asset(
                                        ImagesAssetsPath.imageLogoTop,
                                      ))),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.69,
                                  right: 0,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.3,
                                    width:
                                    MediaQuery.of(context).size.height *
                                        0.4,
                                    child: Image.asset(
                                      ImagesAssetsPath.imageLineTop,
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.72,
                                  right: 0,
                                  child: Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.3,
                                      width: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.4,
                                      child: Image.asset(
                                        ImagesAssetsPath.imageLineBottom,
                                      ))),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.18,
                                  left: -150,
                                  child: Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.2,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.5,
                                      child: Image.asset(
                                        ImagesAssetsPath.imageCircleLeft,
                                      ))),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.0015,
                                  right: -102,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.12,
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.4,
                                    child: Image.asset(
                                      ImagesAssetsPath.imageCircleTop,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        //brown
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          // width: 280,
                          // padding: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: useMobileLayout
                              ? Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xffF6F3E2),
                                          Color(0xff865846)
                                        ],
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        tileMode: TileMode.repeated)
                                ),
                              ),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.13,
                                  right: -36,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.17,
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.4,
                                    child: Image.asset(
                                      ImagesAssetsPath.imageLogoMini,
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.001,
                                  left: -25,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(56),
                                    child: SizedBox.fromSize(
                                      size: Size.fromRadius(108),
                                      child: Image.asset(
                                        ImagesAssetsPath.imageLogoBig,
                                        height: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.3,
                                        width: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.4,
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.454,
                                  right: 0,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.3,
                                    width:
                                    MediaQuery.of(context).size.height *
                                        0.4,
                                    child: Image.asset(
                                      ImagesAssetsPath.imageLineTop,
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.48,
                                  right: 0,
                                  child: Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.3,
                                      width: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.4,
                                      child: Image.asset(
                                        ImagesAssetsPath.imageLineBottom,
                                      ))),
                            ],
                          )
                              : Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xffF6F3E2),
                                          Color(0xff865846)
                                        ],
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        tileMode: TileMode.repeated)),
                              ),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.13,
                                  right: -102,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.17,
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.4,
                                    child: Image.asset(
                                      ImagesAssetsPath.imageLogoMini,
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.002,
                                  left: -95,
                                  child: Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.2,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.5,
                                      child: Image.asset(
                                        ImagesAssetsPath.imageLogoTop,
                                      ))),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.69,
                                  right: 0,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.3,
                                    width:
                                    MediaQuery.of(context).size.height *
                                        0.4,
                                    child: Image.asset(
                                      ImagesAssetsPath.imageLineTop,
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.72,
                                  right: 0,
                                  child: Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.3,
                                      width: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.4,
                                      child: Image.asset(
                                        ImagesAssetsPath.imageLineBottom,
                                      ))),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.18,
                                  left: -150,
                                  child: Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.2,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.5,
                                      child: Image.asset(
                                        ImagesAssetsPath.imageCircleLeft,
                                      ))),
                              Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.0015,
                                  right: -102,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.12,
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.4,
                                    child: Image.asset(
                                      ImagesAssetsPath.imageCircleTop,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10,bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(24)
                        ),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.040,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _controller.animateToPage(index);
                                    currentIndex = index;
                                  });
                                  print('index ${index}');
                                },
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                    // color: Colors.red,
                                    width: 8.0,
                                    height: 8.0,
                                    // padding: EdgeInsets.fromLTRB(left, 0, right, 0),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 6.0, horizontal: 3.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (currentIndex == index
                                            ? Theme.of(context).primaryColor
                                            : Colors.white)),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        )
                      ]
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          showAlertConfirm(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white.withOpacity(0.3)
                          ),
                            elevation: MaterialStateProperty.all(0),
                            fixedSize:
                            MaterialStateProperty.all(Size(200, 50)),
                            // backgroundColor: MaterialStateProperty.all(
                            //     Colors.grey.withOpacity(0.5)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10)))),
                        child: Text("save".tr)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  setCustomTheme(){}

  initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? currentTheme = prefs.getString('theme');
    final darkModeListLength = darkModeList.length;
    if (currentTheme != null && darkModeListLength > 0) {
      for (int i = 0; i < darkModeListLength; i++) {
        setState(() {
          if (darkModeList[i]['value'] == currentTheme) {
            darkModeList[i]['onCheck'] = true;
          } else {
            darkModeList[i]['onCheck'] = false;
          }
        });
      }
    } else {
      setState(() {
        darkModeList.last["onCheck"] = true;
      });
    }
    // print(currentTheme);
  }

  void showAlertConfirm(BuildContext context) {
    showDialog(
        context: context, builder:(BuildContext context){
      return Dialog(
        insetPadding: EdgeInsets.all(0),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: 280,
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
                Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    ImagesAssetsPath.imageAlertQuestion,
                    height: 88,
                    width: 88,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 40,right: 40,top: 24),
                  child: Text(
                      '${'You want to change theme'.tr} ?',
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
                                updateTheme();
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




  updateTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (currentIndex == 0){
      prefs.setString('theme','TypeA' );
    }else  if (currentIndex == 1){
      prefs.setString('theme', 'TypeB');
    }else  if (currentIndex == 2){
      prefs.setString('theme', 'TypeC');
    }else{
      prefs.setString('theme', 'TypeA');
    }

    // initialize();
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
}
