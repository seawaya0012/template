import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/model/authentication/req_otp_model.dart';
import '../../api/request/authentication/otp_login_regis_request.dart';
import '../../api/service/authentication_service.dart';

class SendMessagePage extends StatefulWidget {
  const SendMessagePage(
      {Key? key,
      required this.path,
      required this.otpDetail,
      required this.callBack,
      required this.backToEdit,
      required this.phoneNumber})
      : super(key: key);
  final String path;
  final String phoneNumber;
  final ReqOtpModel otpDetail;
  final Function(String) callBack;
  final VoidCallback backToEdit;

  @override
  State<SendMessagePage> createState() => _SendMessagePageState();
}

class _SendMessagePageState extends State<SendMessagePage> {
  bool isOnResend = false;
  var OTPTrxtFocusNode = FocusNode();

  late Timer _timer;
  final _maxSeconds = 300;
  int _currentSecond = 0;
  bool isBtnLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
    //
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();

  }

  @override
  TextEditingController otpInputTextEditingController = TextEditingController();
  bool statusbutton = false;
  // String refcode = 'testdata';
  String numberphoneInput = '0123456789';

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.fromLTRB(16, 0, 16, 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text('Mobile Verification'.tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              Container(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                  child: Text('We have sent the 6-digit code to'.tr +
                      ' ${widget.phoneNumber}')),
              // Text('Phone Number'.tr+' : '+ widget.phonenumber),
              // Text('RefCode'.tr+' : '+refcode),
            ],
          ),
        ),
        // Container(
        //   margin: EdgeInsets.fromLTRB(16, 8, 16, 16),
        //   child: OTPTextField(
        //     length: 6,
        //     width: MediaQuery.of(context).size.width,
        //     // fieldWidth: 80,
        //     style: TextStyle(fontSize: 17),
        //     textFieldAlignment: MainAxisAlignment.spaceAround,
        //     fieldStyle: FieldStyle.underline,
        //     onCompleted: (pin) {
        //       otpInputTextEditingController.text = pin;
        //       print(otpInputTextEditingController.text);
        //       widget.callBack(pin);
        //     },
        //     onChanged: (type) {
        //       // otpInputTextEditingController.text = text;
        //       setState(
        //         () {
        //           if (otpInputTextEditingController.text.length == 6) {
        //             statusbutton = true;
        //             otpInputTextEditingController.text = type;
        //             // otpInputTextEditingController.text = text;
        //           } else {
        //             statusbutton = false;
        //           }
        //         },
        //       );
        //     },
        //   ),
        // ),
        Container(
          padding: EdgeInsets.fromLTRB(32, 0, 16, 8),
          child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 6,
            focusNode: OTPTrxtFocusNode,
            style: TextStyle(
              fontSize: 14,
            ),
            controller: otpInputTextEditingController,
            onChanged: (text) {
              // otpInputTextEditingController.text = text;
              setState(() {
                if (otpInputTextEditingController.text.length == 6) {
                  statusbutton = true;
                  OTPTrxtFocusNode.unfocus();
                  // otpInputTextEditingController.text = text;
                  // otpInputTextEditingController.text = text;
                } else {
                  statusbutton = false;
                }
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0, color: Colors.transparent),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(16, 16, 8, 8),
          child: Row(
            children: [
              TextButton(
                  onPressed: () {
                    widget.backToEdit();
                    _timer.cancel();
                  },
                  child: Text(
                    'Edit Phone Number'.tr,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )),
              Expanded(child: Container()),
              TextButton(
                  onPressed: isOnResend
                      ? () {
                          // onSendReqOPT(widget.phoneNumber);
                        }
                      : null,
                  child: Text(
                    ' Resend OTP in'.tr + ' ${_timerText}',
                    style: TextStyle(
                        // color: Theme.of(context).primaryColor,
                        ),
                  )),
              // Container(
              //   padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
              //   child: TweenAnimationBuilder<Duration>(
              //       duration: Duration(minutes: 5),
              //       tween:
              //           Tween(begin: Duration(minutes: 5), end: Duration.zero),
              //       onEnd: () {
              //         setState(() {
              //           isOnResend = true;
              //           print('Timer ended');
              //           print(isOnResend);
              //         });
              //         // Navigator.pop(context);
              //       },
              //       builder:
              //           (BuildContext context, Duration value, Widget? child) {
              //         final minutes = value.inMinutes;
              //         final seconds = value.inSeconds % 60;
              //         return Padding(
              //           padding: const EdgeInsets.symmetric(vertical: 5),
              //           child: Text(
              //             '$_timerText',
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 color: Theme.of(context).primaryColor,
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 14),
              //           ),
              //         );
              //       }),
              // ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: ElevatedButton(
            onPressed: statusbutton
                ? () {
                    widget.callBack(otpInputTextEditingController.text);
                    _timer.cancel();
                  }
                : null,
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Text('Verify'.tr),
                  )
                ],
              ),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                )),
                backgroundColor: MaterialStateProperty.all(statusbutton
                    ? Theme.of(context).primaryColor
                    : Colors.grey)),
          ),
        ),
      ],
    );
  }

  onSendReqOTP(phoneNumber) async {
    setState(() {
      isBtnLoading = true;
    });
    var request = OtpLoginRegisRequest();
    request.phone = phoneNumber;
    request.typeOtp = widget.otpDetail.typeOtp.toString();

    await AuthenticationService.postReqOTPLoginRegis(request).then((result) => {
          if (result.status == 200)
            {
              setState(() {
                _startTimer();
                // isOnResend = false;
              }),
            }
          else
            {}
        });
  }

  void _startTimer() {
    final duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (Timer timer) {
      setState(() {
        _currentSecond = timer.tick;
        if (timer.tick >= _maxSeconds) {
          timer.cancel();
          onSendReqOTP(widget.phoneNumber);
        }
        ;
      });
    });
  }

  String get _timerText {
    final secondsPerMinute = 60;
    final secondsLeft = _maxSeconds - _currentSecond;
    final formattedMinutesLeft =
        (secondsLeft ~/ secondsPerMinute).toString().padLeft(2, '0');
    final formattedSecondsLeft =
        (secondsLeft % secondsPerMinute).toString().padLeft(2, '0');
    return '$formattedMinutesLeft : $formattedSecondsLeft';
  }
}
