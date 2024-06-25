import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class BottomSheetChatPlugin extends StatefulWidget {
  final String urlString;
  const BottomSheetChatPlugin({Key? key, required this.urlString}) : super(key: key);

  @override
  State<BottomSheetChatPlugin> createState() => _BottomSheetChatPluginState();
}

class _BottomSheetChatPluginState extends State<BottomSheetChatPlugin> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff083E5E), Color(0xff114261)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
        ),
      height: MediaQuery.of(context).size.height*0.95,
      child: Scaffold(
        backgroundColor:Colors.transparent,
        body: Container(
            decoration: const BoxDecoration(
                color:  Color(0xff114261),
                borderRadius: BorderRadius.only(
                    topLeft:  Radius.circular(24.0),
                    topRight: Radius.circular(24.0))
            ),
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 24,),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: Uri.parse(Uri.encodeFull(widget.urlString)),
                    ),
                  ),
                ),
              ],
            )

        ),
      ),
    );
  }
}
