import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseConfirmAlertDialog extends StatelessWidget {
  final String title;
  final String description;
  final String alertImage;
  final BuildContext mainContext;
  final VoidCallback callbackFunc;
  BaseConfirmAlertDialog({
    required this.mainContext,
    required this.title,
    required this.callbackFunc,
    required this.description,
    required this.alertImage,
  });

  @override
  Widget build(BuildContext context) {
//    Future.delayed(Duration(seconds: 2), () {
//      Navigator.of(context).pop(true);
//    });
    return Dialog(
//      shape: RoundedRectangleBorder(
//        borderRadius: BorderRadius.circular(Consts.padding),
//      ),
      insetPadding: EdgeInsets.all(0),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 320,
        width: 320,
//            padding: EdgeInsets.all(16),
//            margin: EdgeInsets.symmetric(horizontal: 64),
        decoration: new BoxDecoration(
          color: Theme.of(context).cardColor,
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
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
              alignment: Alignment.topCenter,
              child: Image.asset(
                alertImage,
                height: 88,
                width: 88,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              // width: 120,
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 6,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: new Text(description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        // color: Theme.of(context).disabledColor,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
            ),
            Container(
                height: 64,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        // margin: EdgeInsets.only(left: 16),
                        // height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).errorColor),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Cancel'.tr,
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        // margin: EdgeInsets.only(right: 16),
                        // height: 40,
                        width: 100,
                        child:
                        // ButtonLoading()
                        ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                            callbackFunc();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Confirm'.tr,
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
