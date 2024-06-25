import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widget/background_screen/background_color_screen.dart';

class LanguagePage extends StatefulWidget {
  final VoidCallback callbackfunc;

  const LanguagePage({Key? key, required this.callbackfunc}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US'), 'onCheck': false},
    {'name': 'ไทย', 'locale': Locale('th', 'TH'), 'onCheck': false},
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
            'Language'.tr,
            style: TextStyle(
                color:  Colors.white ,fontWeight: FontWeight.w700, fontSize: 18
            ),
          ),
        ),
      ),
      body: _buildLanguagesList(),
    );
  }

  _buildLanguagesList() {
    return Stack(
      children: [
        BackgroundColorScreen(haveNavigationBar: true,haveMainApp: false,),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: locale.length,
              itemBuilder: (context, index) {
                return _buildLanguageItem(locale[index]['name'], index);
              },
            ),
          ),
        ),
      ],
    );
  }

  _buildLanguageItem(String language, int index) {
    return InkWell(
      onTap: () {
        updateLanguage(locale[index]['locale']);
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
                : index == locale.length - 1
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
                        language,
                        textAlign: TextAlign.left,
                        // textScaleFactor: locale[index]['name'],
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: locale[index]['onCheck']
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

  updateLanguage(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language_code', '${locale.languageCode}');
    prefs.setString('country_code', '${locale.countryCode}');
    initialize();
    Get.updateLocale(locale);
    Get.back();
    widget.callbackfunc();
  }

  initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString('language_code');
    final String? countryCode = prefs.getString('country_code');
    final localeLength = locale.length;
    if (languageCode != null && countryCode != null) {
      for (int i = 0; i < localeLength; i++) {
        setState(() {
          if (locale[i]['locale'] == Locale(languageCode, countryCode)) {
            locale[i]['onCheck'] = true;
          } else {
            locale[i]['onCheck'] = false;
          }
        });
      }
    } else {
      setState(() {
        locale[1]['onCheck'] = true;
        prefs.setString('language_code', 'th');
        prefs.setString('country_code', 'TH');
      });
    }
  }
}
