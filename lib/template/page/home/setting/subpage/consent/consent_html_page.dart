import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../../api/model/consent/consent_app_model.dart';
import '../../../../../widget/background_screen/background_color_screen.dart';

class ConsentHTMLPage extends StatefulWidget {

  final String title;
  final ConsentAppModel consentModel;

  const ConsentHTMLPage({Key? key, required this.consentModel, required this.title}) : super(key: key);

  @override
  State<ConsentHTMLPage> createState() => _ConsentHTMLPageState();
}

class _ConsentHTMLPageState extends State<ConsentHTMLPage> {
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
              widget.title,
              style: const TextStyle(
                  color:  Colors.white ,fontWeight: FontWeight.w700, fontSize: 18
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            const BackgroundColorScreen(haveNavigationBar: true,haveMainApp: false,),
            SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.all(10),
                  child: Html(
                    data: widget.consentModel.detail.toString(),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
