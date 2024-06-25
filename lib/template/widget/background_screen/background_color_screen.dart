import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../image_alert/image_alert.dart';

class BackgroundColorScreen extends StatefulWidget {
  final bool haveNavigationBar;
  final bool haveMainApp;

  const BackgroundColorScreen(
      {Key? key, required this.haveNavigationBar, required this.haveMainApp,})
      : super(key: key);

  @override
  State<BackgroundColorScreen> createState() => _BackgroundColorScreenState();
}

class _BackgroundColorScreenState extends State<BackgroundColorScreen> {
  List<Color> bgColorList = [
    Colors.transparent,
    Colors.transparent,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setBgColorList();
  }

  @override
  Widget build(BuildContext context) {
    final double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: widget.haveNavigationBar
            ? null
            : SizedBox(
                height: 0,
              ),
        // backgroundColor: Color(0xff5B8FB9),
        body: useMobileLayout
            ? Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: bgColorList,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      tileMode: TileMode.clamp,
                    )),
                  ),
                  widget.haveMainApp
                      ? Positioned(
                          top: MediaQuery.of(context).size.height * 0.13,
                          right: -36,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.17,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset(
                              ImagesAssetsPath.imageLogoMini,
                              opacity: AlwaysStoppedAnimation(0.2),
                            ),
                          ))
                      : Container(),
                  widget.haveMainApp
                      ? Positioned(
                          top: MediaQuery.of(context).size.height * 0.002,
                          left: -80,
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.height * 0.4,
                              child: Image.asset(
                                ImagesAssetsPath.imageLogoBig,
                                opacity: AlwaysStoppedAnimation(0.2),
                              )))
                      : Container(),
                  SafeArea(
                      child: Stack(
                    children: [
                      widget.haveMainApp ?
                      Positioned(
                          bottom: -16,
                          right: 0,
                          child: Container(
                            // height: MediaQuery.of(context).size.height *0.3,
                            // width: MediaQuery.of(context).size.height *0.4,
                            child: Image.asset(
                              ImagesAssetsPath.imageLineTop,
                            ),
                          )) : Container(),
                      widget.haveMainApp ?
                      Positioned(
                          bottom: -16,
                          right: 0,
                          child: Container(
                              // height: MediaQuery.of(context).size.height *0.3,
                              // width: MediaQuery.of(context).size.height *0.4,
                              child: Image.asset(
                            ImagesAssetsPath.imageLineBottom,
                          ))) : Container(),
                    ],
                  ))
                ],
              )
            : Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: bgColorList,
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              tileMode: TileMode.clamp)),
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.13,
                        right: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.17,
                          // width: MediaQuery.of(context).size.width *0.4,
                          child: Image.asset(
                            ImagesAssetsPath.imageLogoMini,
                          ),
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.002,
                        left: 0,
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            // width: MediaQuery.of(context).size.width *0.5,
                            child: Image.asset(
                              ImagesAssetsPath.imageLogoTop,
                            ))),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.18,
                        // left: -150,
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            // width: MediaQuery.of(context).size.width *0.5,
                            child: Image.asset(
                              ImagesAssetsPath.imageCircleLeft,
                            ))),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.0015,
                        right: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          // width: MediaQuery.of(context).size.width *0.4,
                          child: Image.asset(
                            ImagesAssetsPath.imageCircleTop,
                          ),
                        )),
                    Positioned(
                        bottom: -16,
                        right: 0,
                        child: Container(
                          // height: MediaQuery.of(context).size.height *0.3,
                          // width: MediaQuery.of(context).size.width,
                          child: Image.asset(ImagesAssetsPath.imageLineTop,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill),
                        )),
                    Positioned(
                        bottom: -16,
                        right: 0,
                        child: Container(
                            // height: MediaQuery.of(context).size.height *0.3,
                            // width: MediaQuery.of(context).size.width,
                            child: Image.asset(ImagesAssetsPath.imageLineBottom,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fill))),
                  ],
                ),
              ));
  }

  Future<void> setBgColorList() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var currentTheme = _prefs.getString('theme') ?? 'TypeA';
    print('currentThemecurrentThemes# $currentTheme ');
    if (currentTheme == 'TypeA') {
      setState(() => bgColorList = [
            Color(0xff5B8FB9),
            Color(0xff3D3B93),
            Color(0xff3D3B93)
          ]);
    } else if (currentTheme == 'TypeB') {
      setState(() => bgColorList = [
            Color(0xffF5EFE6),
            Color(0xff628E90),
            Color(0xff628E90),
            Color(0xff628E90),
            Color(0xff628E90),
          ]);
    } else if (currentTheme == 'TypeC') {
      setState(() => bgColorList = [
            Color(0xffF6F3E2),
            Color(0xff865846),
          ]);
    } else {
      setState(() => bgColorList = [
            Color(0xff5B8FB9),
            Color(0xff3D3B93),
            Color(0xff3D3B93)
          ]);
    }
  }
}
