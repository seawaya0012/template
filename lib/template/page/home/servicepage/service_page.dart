import 'dart:async';
import 'dart:convert';
import 'package:centrifuge/centrifuge.dart' as centrifuge;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../main.dart';
import '../../../../../../navigation.dart';
import '../../../api/api_manager.dart';
import '../../../api/model/authentication/account_model.dart';
import '../../../api/model/business/centrifuge_event_update_business_model.dart';
import '../../../api/model/serviceApp/oneplatform_app_account_model.dart';
import 'dart:io';
import '../../../api/service/authentication_service.dart';
import '../../../appManager/local_storage_manager.dart';
import '../../../widget/alertpopupDialog/custom_snackbar.dart';
import '../../../widget/background_screen/background_color_screen.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  File? profileImage;

  String actionType = '';
  String jumpBusinessId = '';

  bool isDarkMode = false;
  bool isLoading = true;

  double textScale = 1.0;

  int countDataNotificationAllBusiness = 0;

  List<BusinessProfileModel> privateAccountList = [];

  AccountModel accountModelData = AccountModel();
  BusinessProfileModel dataAllAccount = BusinessProfileModel();

  late centrifuge.Client client = centrifuge.createClient(ApiManager().centrifugeClient)
    ..setToken(ApiManager().centrifugeToken);
  late centrifuge.Subscription subscriptionUser;
  late centrifuge.Subscription subscriptionServicePublic;
  late centrifuge.Subscription subscriptionServicePublicUser;
  late centrifuge.Subscription subscriptionServicePrivate;
  late centrifuge.Subscription subscriptionServicePrivateUser;
  late centrifuge.Subscription subscriptionBellNoti;
  late centrifuge.Subscription subscriptionBusiness;
  StreamSubscription<centrifuge.ConnectedEvent>? _connSub;
  StreamSubscription<centrifuge.DisconnectedEvent>? _disconnSub;
  StreamSubscription<centrifuge.ErrorEvent>? _errorSub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      setState(() {
        isLoading = true;
      });
      getAccountData();
      getAccountDataAccount();
      getAllAccount();

      LocalStorageManager.clearBusinessId();
    });
  }

  // Centrifuge
  Future<void> connectServer(String userId) async {
    _connSub = client.connected.listen((event) {
      print("Connected to server ");
      // fetchSeviceData();
      subscribeUpdateUser(ApiManager.eventUser + userId);
      subscribeUpdateBusiness(ApiManager.eventBusiness + userId);
    });
    _disconnSub = client.disconnected.listen((event) {
      print("Disconnected from server ");
    });
    _errorSub = client.error.listen((event) {
      print(event.error);
    });
    await client.connect();
  }

  Future<void> subscribeUpdateUser(String channel) async {
    print("Subscribing $channel");
    final subscriptionUser = client.getSubscription(channel);
    subscriptionUser?.error.listen(print);
    subscriptionUser?.subscribed.listen(print);
    subscriptionUser?.unsubscribed.listen(print);
    subscriptionUser?.join.listen(print);
    subscriptionUser?.leave.listen(print);
    subscriptionUser?.publication
        .map<String>((e) => utf8.decode(e.data))
        .listen((data) {});
    this.subscriptionUser = subscriptionUser!;
    await subscriptionUser.subscribe();
  }


  Future<void> subscribeUpdateBusiness(String channel) async {
    print("Subscribing $channel");
    final subscriptionBusiness = client.getSubscription(channel);
    subscriptionBusiness?.error.listen(print);
    subscriptionBusiness?.subscribed.listen(print);
    subscriptionBusiness?.unsubscribed.listen(print);
    subscriptionBusiness?.join.listen(print);
    subscriptionBusiness?.leave.listen(print);;
    subscriptionBusiness?.publication
        .map<String>((e) => utf8.decode(e.data))
        .listen((data) {
      final dataTest = json.decode(data) as Map<String, dynamic>;
      // eventUpdateBusiness("$dataTest");
      eventUpdateBusiness(data);
    });
    this.subscriptionBusiness = subscriptionBusiness!;
    await subscriptionBusiness.subscribe();
  }

  Future<void> subscribeServicePublic(String channel) async {
    print("Subscribing $channel");
    final subscriptionServicePublic = client.getSubscription(channel);
    subscriptionServicePublic?.error.listen(print);
    subscriptionServicePublic?.subscribed.listen(print);
    subscriptionServicePublic?.unsubscribed.listen(print);
    subscriptionServicePublic?.join.listen(print);
    subscriptionServicePublic?.leave.listen(print);
    subscriptionServicePublic?.publication
        .map<String>((e) => utf8.decode(e.data))
        .listen((data) {
      final dataTest = json.decode(data) as Map<String, dynamic>;
    });
    this.subscriptionServicePublic = subscriptionServicePublic!;
    await subscriptionServicePublic.subscribe();
  }

  Future<void> subscribeServicePublicUser(String channel) async {
    print("Subscribing $channel");
    final subscriptionServicePublicUser = client.getSubscription(channel);
    subscriptionServicePublicUser?.error.listen(print);
    subscriptionServicePublicUser?.subscribed.listen(print);
    subscriptionServicePublicUser?.unsubscribed.listen(print);
    subscriptionServicePublicUser?.join.listen(print);
    subscriptionServicePublicUser?.leave.listen(print);
    subscriptionServicePublicUser?.publication
        .map<String>((e) => utf8.decode(e.data))
        .listen((data) {});
    this.subscriptionServicePublicUser = subscriptionServicePublicUser!;
    await subscriptionServicePublicUser.subscribe();
  }

  Future<void> subscribeServicePrivate(String channel) async {
    print("Subscribing $channel");
    final subscriptionServicePrivate = client.getSubscription(channel);
    subscriptionServicePrivate?.error.listen(print);
    subscriptionServicePrivate?.subscribed.listen(print);
    subscriptionServicePrivate?.unsubscribed.listen(print);
    subscriptionServicePrivate?.join.listen(print);
    subscriptionServicePrivate?.leave.listen(print);
    subscriptionServicePrivate?.publication
        .map<String>((e) => utf8.decode(e.data))
        .listen((data) {});
    this.subscriptionServicePrivate = subscriptionServicePrivate!;
    await subscriptionServicePrivate.subscribe();
  }

  Future<void> subscribeServicePrivateUser(String channel) async {
    print("Subscribing $channel");
    final subscriptionServicePrivateUser = client.getSubscription(channel);
    subscriptionServicePrivateUser?.error.listen(print);
    subscriptionServicePrivateUser?.subscribed.listen(print);
    subscriptionServicePrivateUser?.unsubscribed.listen(print);
    subscriptionServicePrivateUser?.join.listen(print);
    subscriptionServicePrivateUser?.leave.listen(print);
    subscriptionServicePrivateUser?.publication
        .map<String>((e) => utf8.decode(e.data))
        .listen((data) {});
    this.subscriptionServicePrivateUser = subscriptionServicePrivateUser!;
    await subscriptionServicePrivateUser.subscribe();
  }

  eventUpdateBusiness(String data) async {
    print('eventUpdateBusiness data $data ss $jumpBusinessId');
    CentrifugeEventUpdateBusinessModel model =
        CentrifugeEventUpdateBusinessModel.fromJson(jsonDecode(data));

    if (model.action == 'go_to_biz') {
      await LocalStorageManager.saveCurrentBis(model.businessId).then((value) {
        setState(() {
          actionType = model.action;
          jumpBusinessId = model.businessId;
          Navigation.shared.toMyHomePageWithActionJumpToBis(
              GlobalVariable.navState.currentContext!,
              actionType,
              jumpBusinessId);
          CustomSnack.show(context, 'Verified Organization'.tr);
        });
      });
    }
  }

  showCustomSnackBar(String showText) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      elevation: 2.0,
      backgroundColor: Theme.of(context).backgroundColor,
      content: Text(
        showText.tr,
        style: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: EdgeInsets.only(
          bottom: 24,
          right: MediaQuery.of(context).size.width * 0.2,
          left: MediaQuery.of(context).size.width * 0.2),
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    client.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            const BackgroundColorScreen(
              haveNavigationBar: true,
              haveMainApp: true,
            ),
            SafeArea(
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.23,
                      child: buildShowAccountMiddle(context)),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 17),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                Navigation.shared.toExamplePage(
                                    GlobalVariable.navState.currentContext);
                                // Navigation.shared
                                //     .toExamplePage(context);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(16.0),
                                      child: Image.asset(
                                        "assets/icon/app_new_icon_android.png",
                                        fit: BoxFit.fill,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return const Icon(
                                            Icons.apps_outlined,
                                            color: Colors.grey,
                                          );
                                        },
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.2,
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.1,
                                      )),
                                  Container(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Text('Example'))
                                ],
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShowAccountMiddle(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigation.shared.toEditProfilePage(context, () {
                    setState(() {
                      // updateAccountData();
                      getAllAccount();
                    });
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 36,
                  child: ClipOval(
                      child: Image.network(
                    '${accountModelData.profilePicture}',
                    scale: 1,
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.person,
                          size: 56,
                          color: Colors.black38,
                        ),
                      );
                    },
                  )),
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Text(
                    '${accountModelData.displayName}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _searchServiceView() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [],
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(30),
      ),
      child: GestureDetector(
        onTap: () {},
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child:
                    Icon(Icons.search, color: Theme.of(context).primaryColor),
              ),
              Expanded(
                  child: Text(
                'Search'.tr,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              )),
              const VerticalDivider(
                width: 8,
                thickness: 1,
                indent: 8,
                endIndent: 8,
                color: Color(0xff999999),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                  child: Icon(Icons.qr_code,
                      color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getAllAccount() async {
    await AuthenticationService.getAllAccount().then((value) => {
          setState(() {
            dataAllAccount = value.publicAccountModel!;
            privateAccountList = value.privateAccountList;
            dataAllAccount.typeAccount = 'public';
            LocalStorageManager.clearDefaultAccount();
            LocalStorageManager.saveDefaultAccount(dataAllAccount);
          })
        });
  }

  getAccountData() async {
    await LocalStorageManager.getAccount().then((value) => {
          setState(() {
            accountModelData = value!;
            connectServer(accountModelData.userId ?? '');
          })
        });
  }

  getAccountDataAccount() {
    AuthenticationService.getAccountDataAccount().then((value) => {
          setState(() {
            this.accountModelData = value.accountModel!;
          })
        });
  }
}
