import 'package:flutter/material.dart';
import '../loading/button_loading.dart';

import '../loading/button_loading.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final bool isEnable;
  final bool isBtnLoading;
  final VoidCallback callBack;

  const GradientButton(
      {Key? key,
      required this.title,
      required this.isEnable,
      required this.callBack,
      required this.isBtnLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnable
          ? () {
              // print('onPressed');
              callBack();
            }
          : null,
      // onPressed: null,
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        padding: EdgeInsets.all(0.0),
      ),
      child: Ink(
        decoration: BoxDecoration(
            gradient: isEnable
                ? LinearGradient(
                    colors: [Theme.of(context).primaryColor, Theme.of(context).secondaryHeaderColor],
                    // begin: Alignment.topLeft,
                    // end: Alignment.,
                  )
                : LinearGradient(
                    colors: [Color(0xffF5F5F5), Color(0xffF5F5F5)]),
            borderRadius: BorderRadius.circular(24.0)),
        child: Container(
          // constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: isBtnLoading
              ? ButtonLoading()
              : Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.w700,
                        color: isEnable ? Colors.white : Color(0xffCCCCCC)),
                  ),
                ),
        ),
      ),
    );
  }
}
