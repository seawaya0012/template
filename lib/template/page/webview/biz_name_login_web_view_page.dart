import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
// import 'package:record/record.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../api/model/serviceApp/oneplatform_app_account_model.dart';
import '../../appManager/local_storage_manager.dart';
import '../../widget/loading/base_loading_animation.dart';
import 'package:permission_handler/permission_handler.dart';

class BizNameLoginWebViewPage extends StatefulWidget {
  final String urlString;
  final Function(String) callBack;
  const BizNameLoginWebViewPage({Key? key, required this.urlString, required this.callBack}) : super(key: key);

  @override
  State<BizNameLoginWebViewPage> createState() => _BizNameLoginWebViewPageState();
}

class _BizNameLoginWebViewPageState extends State<BizNameLoginWebViewPage> {
  bool isLoading = true;
  late InAppWebViewController _webViewController;

  String appBarBgColorHex = '#000000';
  BusinessProfileModel defaultAccountModel = BusinessProfileModel();
  bool isPrivate = false;
  bool isOnOrganizeTheme = false;
  bool isManageai = false;
  // webview download file
  String dummyLoadUrlString = '';
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions initialOptions = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        supportZoom: false,
        mediaPlaybackRequiresUserGesture: false,
        // useOnDownloadStart: false,
        useOnDownloadStart: true,
        useOnLoadResource: true,
        // useShouldOverrideUrlLoading: true,
        useShouldOverrideUrlLoading: true,
        javaScriptCanOpenWindowsAutomatically: true,
        javaScriptEnabled: true,
        allowFileAccessFromFileURLs: true,
        allowUniversalAccessFromFileURLs: true,
        userAgent:
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width > 600.0 ?
        Platform.isIOS ?
        "Mozilla/5.0 (iPad; CPU OS 15_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Safari/604.1":"Mozilla/5.0 (Linux; Android 9; LG-H870 Build/PKQ1.190522.001) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/1.0.9 Mobile Safari/604.1" :
        Platform.isIOS ?
        "Mozilla/5.0 (iPhone; CPU iPhone OS 15_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.5 Mobile/15E148 Safari/604.1":
        "Mozilla/5.0 (Linux; Android 9; LG-H870 Build/PKQ1.190522.001) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/1.0.9 Mobile Safari/604.1",
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
        supportMultipleWindows: false,
        geolocationEnabled: true,
        allowFileAccess: true,
        domStorageEnabled: true,
        safeBrowsingEnabled: true,
        databaseEnabled: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  List<String> customUrlWeb = [
    'https://mail.one.th',
  ];

  final CookieManager cookieManager = CookieManager.instance();

  @override
  void dispose() {
    super.dispose();
    cookieManager.deleteAllCookies();
    webViewController?.clearCache();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Text(''),
          automaticallyImplyLeading: true,
          backgroundColor:
          isPrivate && isOnOrganizeTheme && appBarBgColorHex != ''
              ? hexToColor(appBarBgColorHex)
              : Colors.white,
          iconTheme: IconThemeData(
            color: isPrivate && appBarBgColorHex != ''
                ? appBarBgColorHex == "#FFFFFF"
                ? Colors.black
                : Colors.white
                : Colors.black,
          ),
          // backgroundColor: Colors.red,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            isManageai && Platform.isAndroid ? Container(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(Uri.encodeFull(widget.urlString)),
                ),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    mediaPlaybackRequiresUserGesture: false,
                  ),
                ),
                onWebViewCreated: (InAppWebViewController controller) {
                  _webViewController = controller;
                },
                androidOnPermissionRequest: (InAppWebViewController controller, String origin, List<String> resources) async {
                  return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
                },
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  if (progress == 100) {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
              ),
            ) :InAppWebView(
              key: webViewKey,
              initialUrlRequest: URLRequest(
                url: Uri.parse(Uri.encodeFull(widget.urlString)),
              ),
              initialOptions: initialOptions,
              onWebViewCreated: (webViewController) async {
                setState(() {
                  _webViewController = webViewController;
                });
              },
              onReceivedServerTrustAuthRequest: (controller, challenge) async {
                print(challenge);
                return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
              },
              onCreateWindow:
                  (InAppWebViewController inAppWebViewController, createWindowRequest) async {
                print(
                    'object onCreateWindow ${createWindowRequest.request.url}');
                if (Platform.isIOS){
                  await launchUrl(
                    createWindowRequest.request.url ??
                        Uri.parse(createWindowRequest.request.url.toString()),
                    mode: LaunchMode.platformDefault,
                  );
                  return true;
                }
              },

              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                if (progress == 100) {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              androidOnPermissionRequest: (InAppWebViewController controller,
                  String origin, List<String> resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
              androidOnGeolocationPermissionsShowPrompt:
                  (InAppWebViewController controller, String origin) async {
                return GeolocationPermissionShowPromptResponse(
                    origin: origin, allow: true, retain: true);
              },
              onUpdateVisitedHistory: (InAppWebViewController controller, Uri? url, bool? androidIsReload) async {
                var webUrl = url;
                // print('webUrl $webUrl');
                if (![
                  "https",
                  "file",
                  "chrome",
                  "data",
                  "javascript",
                  "blob",
                  "about"
                ].contains(webUrl?.scheme) && Platform.isAndroid) {
                  // if (await canLaunchUrl(webUrl!)) {
                  print('webUrl onUpdateVisitedHistory $webUrl');
                  // Launch the App
                  controller.goBack().then((value) async => {
                    await launchUrl(
                      webUrl!,
                      mode: LaunchMode.platformDefault,
                    )
                  });

                }
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                var webUrl = navigationAction.request.url;

                print('webUrlshouldOverrideUrlLoading $webUrl');
                print('webUrl?.path $webUrl?.path');
                if(webUrl.toString().contains('azure/redirect') && !webUrl.toString().contains('microsoftonline')){
                  // if (webUrl.toString().contains('oauth.psu.ac.th')){
                  // }else{
                    Navigator.pop(context);
                    widget.callBack(webUrl.toString());
                  // }
                }
                return NavigationActionPolicy.ALLOW;
              },
              onLoadResource: (
                  InAppWebViewController controller,
                  LoadedResource resource
                  ) async {
                var webUrl = resource.url;
              },
            ),
            isLoading
                ? Center(
              child: BaseLoadingAnimation(),
            )
                : Stack(),
          ],
        ),
      ),
    );
  }

  setAppBarBgColor() {
    setState(() {
      appBarBgColorHex = defaultAccountModel.businessColor ?? '#FFFFFF';
    });
  }

  checkIsOnOrganizeTheme() {
    LocalStorageManager.getIsOnOrganizeTheme().then((value) {
      setState(() {
        if (value != "") {
          if (value == 'isOn') {
            isOnOrganizeTheme = true;
          } else if (value == 'isOff') {
            isOnOrganizeTheme = false;
          } else {
            isOnOrganizeTheme = false;
          }
        } else if (value == "" || value == null) {
          isOnOrganizeTheme = true;
          // setOnOrganizeThemeOn();
        }
      });
      setAppBarBgColor();
    });
  }

  getDefaultAccount() async {
    await LocalStorageManager.getDefaultAccount().then((value) => {
      setState(() {
        defaultAccountModel = value ?? BusinessProfileModel();
        setAppBarBgColor();
        if (value?.oneId.toString() != '') {
          this.isPrivate = false;
        } else if (value?.businessId.toString() != '') {
          this.isPrivate = true;
        }
        checkIsOnOrganizeTheme();
      })
    });
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
//    return Theme.of(context).primaryColor;
  }

  Future<void> reSetUpWebView() async {
    await _webViewController.setOptions(options: initialOptions);
    setState(() {});
  }
}
