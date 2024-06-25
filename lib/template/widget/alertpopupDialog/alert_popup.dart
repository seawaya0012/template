import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertPopup extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback callBack;

  const AlertPopup(
      {Key? key,
      required this.title,
      required this.description,
      required this.icon,
      required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.only(left: 0.0, right: 0.0),
        child: Stack(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 13.0, right: 8.0),
            decoration: BoxDecoration(
                color: Theme.of(context).dialogBackgroundColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).dividerColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      )),
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    title.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                    child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 32, 0, 24),
                        child: Icon(
                          icon,
                          color: Theme.of(context).primaryColor,
                          size: 80,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 24),
                        child: new Text(
                          description,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Theme.of(context).disabledColor,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ) //
                    ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 16.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                callBack();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
