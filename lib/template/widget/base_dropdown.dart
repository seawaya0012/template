import 'package:flutter/material.dart';

class BaseDropdown extends StatelessWidget {
  final String? dropdownValue;
  final bool isEdit;
  final Function(String) callBackText;
  final List<String> items;
  final String title;
  final String text;
  final bool isDarkMode;

  const BaseDropdown({
    Key? key,
    required this.dropdownValue,
    required this.isEdit,
    required this.callBackText,
    required this.items,
    required this.title,
    required this.text,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isEdit
        ? Container(
            // alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(16.0, 0, 12, 0),
            // height: 24,
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                    color: const Color(0xffE6E6E6).withOpacity(0.9))),
            child: DropdownButton<String>(
              isExpanded: true,
              dropdownColor: Theme.of(context).scaffoldBackgroundColor,
              underline: Container(),
              hint: Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xffC4C4C4),
                    fontWeight: FontWeight.w400),
              ),
              // isExpanded: true,
              style: TextStyle(
                  fontSize: 16.0,
                  // color:  Color(0xffC4C4C4),
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w400),
              value: dropdownValue != '' ? dropdownValue : '',
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 24,
                color: Color(0xffC4C4C4),
              ),
              onTap: () {
                print('DropdownMenuItem onTap');
              },
              onChanged: !isEdit
                  ? null
                  : (String? newValue) {
                      print('DropdownMenuItem');
                      callBackText(newValue!);
                    },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  // child: Text(value),
                  child: isEdit
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            value,
                            textAlign: TextAlign.start,
                          ),
                        )
                      : Text(
                          dropdownValue ?? '',
                          textAlign: TextAlign.start,
                        ),
                );
              }).toList(),
            ),
          )
        : Container(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              dropdownValue ?? '',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 12.8,
                  fontWeight: FontWeight.w500),
            ),
          );
  }
}
