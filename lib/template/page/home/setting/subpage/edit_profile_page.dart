import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import '../../../../api/model/authentication/account_model.dart';
import '../../../../api/model/business/business_model.dart';
import '../../../../api/model/business/business_role_model.dart';
import '../../../../api/model/serviceApp/oneplatform_app_account_model.dart';
import '../../../../api/request/authentication/save_display_name_request.dart';
import '../../../../api/request/authentication/save_status_request.dart';
import '../../../../api/service/authentication_service.dart';
import '../../../../appManager/app_theme.dart';
import '../../../../appManager/local_storage_manager.dart';
import '../../../../widget/alertpopupDialog/custom_snackbar.dart';
import '../../../../widget/background_screen/background_color_screen.dart';
import '../../../../widget/button/gradient_button.dart';

class ProfilePage extends StatefulWidget {
  final VoidCallback callBackFunc;

  const ProfilePage({Key? key, required this.callBackFunc}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isShowSaveBtn = false;
  bool isEditName = false;
  bool isEditStatus = false;
  bool isEditPicture = false;
  bool isEnable = false;
  String statusProfile = '';
  String nameProfile = '';
  String typeAccount = '';
  String tel = '';
  String email = '';
  File? profileImage;
  bool isDarkMode = false;
  bool isBtnLoading = false;
  bool isEnabled = false;
  bool isHaveChange = false;
  bool isShowEkyc = false;
  bool isLockBiz = false;
  bool isLoading = true;
  String businessIdLocale = "";
  String businessEmail = "";

  late TextEditingController? _controllerStatus;
  late TextEditingController? _controllerName;

  Locale locale = Locale('en', 'US');

  AccountModel accountModel = AccountModel();
  BusinessProfileModel businessProfileModel = BusinessProfileModel();
  List<BusinessModel> businessList = [];
  List<BusinessRoleModel> roleList = [];

  @override
  void initState() {
    super.initState();
    getDefaultAccount();
    _controllerName = TextEditingController();
    _controllerStatus = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    LocalStorageManager.clearDefaultAccount();
    widget.callBackFunc();
  }

  setStatusBar() async {
    ThemeProvider().isDarkMode.then((value) => {
          setState(() {
            isDarkMode = value;
          })
        });
  }

  getAccount() async {
    await LocalStorageManager.getAccount().then((value) => {
          setState(() {
            accountModel = value!;
            if (typeAccount == 'private') {
              // this.locale.languageCode == 'th'
              //     ? _controllerStatus = TextEditingController(
              //         text: allAccountModel.companyFullNameTh)
              //     : _controllerStatus = TextEditingController(
              //         text: allAccountModel.companyFullNameEng);
              if (this.locale.languageCode == 'th') {
                _controllerStatus = TextEditingController(
                    text: businessProfileModel.companyFullNameTh);
              } else {
                _controllerStatus = TextEditingController(
                    text: businessProfileModel.companyFullNameEng);
              }

              _controllerName =
                  TextEditingController(text: businessProfileModel.displayName);
            } else {
              _controllerStatus =
                  TextEditingController(text: accountModel.status);
              _controllerName = TextEditingController(text: accountModel.displayName);
            }

          })
        });
  }

  getDefaultAccount() async {
    await LocalStorageManager.getDefaultAccount().then((value) {
            typeAccount = '${value?.typeAccount.toString()}';
            businessProfileModel = value!;
            getAccount();
        });
  }

  editStatus(String status) async {
    setState(() {
      isBtnLoading = true;
      isEnable = false;
      isEnabled = false;
    });
    var request = StatusProfileRequest();
    request.status = status;
    await AuthenticationService.putStatus(request).then((value) => {
          setState(() {
            isEditStatus = false;
            isBtnLoading = false;
            showSuccesses();
          })
        });
  }

  editName(String name) async {
    setState(() {
      isBtnLoading = true;
      isEnable = false;
      isEnabled = false;
    });
    var request = NameProfileRequest();
    request.displayName = name;
    await Future.delayed(Duration(seconds: 2));
    await AuthenticationService.putProfileName(request).then((value) => {
          setState(() {
            isEditName = false;
            isBtnLoading = false;
            showSuccesses();
            // getAccount();
          })
        });
  }


  showSuccesses() async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      elevation: 2.0,
      // width: MediaQuery.of(context).size.width*0.4,
      backgroundColor: Theme.of(context).colorScheme.background,
      content: Text(
        'Save Success.'.tr,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
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
        // bottom: (MediaQuery.of(context).size.height - 120) - MediaQuery.of(context).padding.top,
          bottom: 56,
          right: MediaQuery.of(context).size.width * 0.2,
          left: MediaQuery.of(context).size.width * 0.2),
    ));
  }

  setLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString('language_code');
    final String? countryCode = prefs.getString('country_code');
    setState(() {
      if (languageCode != null && countryCode != null) {
        this.locale = Locale(languageCode.toString(), countryCode.toString());
      } else {
        this.locale = Locale('th', 'TH');
        prefs.setString('language_code', 'th');
        prefs.setString('country_code', 'TH');
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent, // 1
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                widget.callBackFunc();
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_outlined)),
          titleSpacing: 0.0,
          title: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              // textAlign: TextAlign.center,
              'Personal Profile'.tr,
              style: TextStyle(
                  color:  Colors.white ,fontWeight: FontWeight.w700, fontSize: 18
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            BackgroundColorScreen(haveNavigationBar: true,haveMainApp: false,),
            SafeArea(
              child: Container(
                // color: Colors.red,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Center(
                             child: Container(
                                margin: EdgeInsets.symmetric(vertical: 24),
                                width: 90,
                                height: 90,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        child: profileImage?.path != null
                                            ? Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                              radius: 90,
                                              backgroundColor: Colors.white,
                                              backgroundImage: FileImage(
                                                File('${profileImage?.path}'),
                                              )),
                                        )
                                            : typeAccount != 'private'
                                            ? Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: accountModel
                                              .profilePicture
                                              .toString() !=
                                              ""
                                              ? CircleAvatar(
                                            radius: 90,
                                            backgroundColor:
                                            Colors.white,
                                            child: ClipOval(
                                              child: Image.network(
                                                accountModel
                                                    .profilePicture
                                                    .toString(),
                                                scale: 1,
                                                width: 90,
                                                height: 90,
                                                fit: BoxFit.cover,
                                                errorBuilder:
                                                    (context, error,
                                                    stackTrace) {
                                                  return Container(
                                                    // color: Theme.of(
                                                    //         context)
                                                    //     .scaffoldBackgroundColor,
                                                    alignment:
                                                    Alignment
                                                        .center,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 56,
                                                      color: Colors
                                                          .black38,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            // backgroundImage:
                                            //     NetworkImage(
                                            //   accountModel
                                            //       .profilePicture
                                            //       .toString(),
                                            // ),
                                          )
                                              : CircleAvatar(
                                            radius: 90,
                                            backgroundColor:
                                            Colors.white,
                                            child: Icon(
                                              Icons.person,
                                              size: 80,
                                            ),
                                          ),
                                        )
                                            : Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: businessProfileModel
                                              .profilePicture
                                              .toString() !=
                                              ""
                                              ? CircleAvatar(
                                            radius: 90,
                                            backgroundColor:
                                            Colors.white,
                                            child: ClipOval(
                                              child: Image.network(
                                                businessProfileModel
                                                    .profilePicture
                                                    .toString(),
                                                scale: 1,
                                                width: 90,
                                                height: 90,
                                                fit: BoxFit.cover,
                                                errorBuilder:
                                                    (context, error,
                                                    stackTrace) {
                                                  return Container(
                                                    // color: Theme.of(
                                                    //         context)
                                                    //     .scaffoldBackgroundColor,
                                                    alignment:
                                                    Alignment
                                                        .center,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 56,
                                                      color: Colors
                                                          .black38,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            // backgroundImage:
                                            //     NetworkImage(
                                            //   allAccountModel
                                            //       .profilePicture
                                            //       .toString(),
                                            // ),
                                          )
                                              : CircleAvatar(
                                            radius: 90,
                                            backgroundColor:
                                            Colors.white,
                                            child: Icon(
                                              Icons.person,
                                              size: 80,
                                            ),
                                          ),
                                        )),
                                    Positioned(
                                      top: 65,
                                      left: 65,
                                      child: Container(
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xffCDEFFE),
                                          radius: 12,
                                          child: ClipOval(
                                            child: Icon(
                                              Icons.camera_alt_outlined,
                                              size: 16,
                                              color: Color(0xff026A97),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(8)),
                              margin: EdgeInsets.fromLTRB(16, 0, 16, 16),

                              child: Column(children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(32, 16, 32, 8),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'User name'.tr,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(32, 0, 16, 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          key: ValueKey('editUser'),
                                          maxLines: null,
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                          controller: _controllerName,
                                          enabled: isEditName,
                                          onChanged: (text) {
                                            setState(() {
                                              nameProfile = text;
                                              if (nameProfile.isNotEmpty) {
                                                isEnable = true;
                                              } else {
                                                isEnable = false;
                                              }
                                            });
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 0, color: Colors.transparent),
                                            ),
                                          ),
                                        ),
                                      ),
                                      typeAccount != 'private'
                                          ? IconButton(
                                          key: ValueKey('editUserBtn'),
                                          onPressed: () {
                                            setState(() {
                                              isEditName = !isEditName;
                                              isEditStatus = false;
                                              isEditPicture = false;
                                              if (!isEditName) {
                                                isEnable = false;
                                                _controllerName =
                                                    TextEditingController(
                                                        text: businessProfileModel
                                                            .displayName);
                                              }
                                            });
                                          },
                                          icon: Icon(
                                            isEditName ? Icons.close : Icons.edit,
                                            size: 16,
                                          ))
                                          : Container()
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(32, 0, 32, 8),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    typeAccount != 'private'
                                        ? 'Status'.tr
                                        : 'Company Name'.tr,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(32, 0, 16, 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          maxLines: null,
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                          controller: _controllerStatus,
                                          enabled: isEditStatus,
                                          onChanged: (text) {
                                            setState(() {

                                              statusProfile = text;

                                              if (statusProfile.isNotEmpty) {
                                                isEnable = true;
                                              } else {
                                                isEnable = false;
                                              }
                                            });
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 0, color: Colors.transparent),
                                            ),
                                          ),
                                        ),
                                      ),
                                      typeAccount != 'private'
                                          ? IconButton(
                                          onPressed: () {
                                            setState(() {

                                              isEditStatus = !isEditStatus;
                                              isEditPicture = false;
                                              isEditName = false;
                                              if (!isEditStatus) {
                                                isEnable = false;
                                                _controllerStatus =
                                                    TextEditingController(
                                                        text: accountModel.status);
                                              }

                                            });
                                          },
                                          icon: Icon(
                                            isEditStatus ? Icons.close : Icons.edit,
                                            size: 16,
                                          ))
                                          : Container()
                                    ],
                                  ),
                                ),
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.fromLTRB(32, 0, 32, 8),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Telephone number'.tr,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                                Container(
                                  padding: EdgeInsets.fromLTRB(48, 12, 48, 12),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    accountModel.mobileNo.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                if (isLockBiz == true) ...[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(32, 12, 32, 8),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Business Email'.tr,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(48, 12, 48, 12),
                                          alignment: Alignment.topLeft,
                                          child: businessEmail.isNotEmpty ? Text(
                                            businessEmail.toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ) : Text(
                                            '-',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        businessEmail.isNotEmpty ? Padding(
                                          padding: const EdgeInsets.only(right: 16),
                                          child: IconButton(
                                              onPressed: () async {
                                                await Clipboard.setData(ClipboardData(
                                                  text: businessEmail.toString(),
                                                ));
                                                CustomSnack.show(context, 'Code Copied'.tr);
                                              },
                                              icon: Icon(
                                                Icons.copy,
                                                size: 20,
                                              )),
                                        ) : Container()
                                      ],
                                    ),
                                  ),
                                ] else ...[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(32, 12, 32, 8),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Email'.tr,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(48, 12, 48, 12),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      accountModel.email.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  if (businessEmail != '') ...[
                                    Container(
                                      padding: EdgeInsets.fromLTRB(32, 12, 32, 8),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Business Email'.tr,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(48, 12, 48, 12),
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              businessEmail.toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 16),
                                            child: IconButton(
                                                onPressed: () async {
                                                  await Clipboard.setData(ClipboardData(
                                                    text: businessEmail.toString(),
                                                  ));
                                                  CustomSnack.show(context, 'Code Copied'.tr);
                                                },
                                                icon: Icon(
                                                  Icons.copy,
                                                  size: 20,
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ] else ...[
                                    Container()
                                  ],
                                ],
                                Container(
                                  padding: EdgeInsets.fromLTRB(32, 12, 32, 8),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'One ID'.tr,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.fromLTRB(48, 12, 48, 12),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          accountModel.oneId.toString(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 16),
                                        child: IconButton(
                                            onPressed: () async {
                                              await Clipboard.setData(ClipboardData(
                                                text: accountModel.oneId.toString(),
                                              ));
                                              CustomSnack.show(context, 'Code Copied'.tr);
                                            },
                                            icon: const Icon(
                                              Icons.copy,
                                              size: 20,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                if (businessProfileModel.businessId != '') ...[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(32, 12, 32, 8),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Business ID'.tr,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(48, 12, 48, 12),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            businessProfileModel.businessId.toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 16),
                                          child: IconButton(
                                              onPressed: () async {
                                                await Clipboard.setData(ClipboardData(
                                                  text: businessProfileModel.businessId.toString(),
                                                ));
                                                CustomSnack.show(context, 'Code Copied'.tr);
                                              },
                                              icon: Icon(
                                                Icons.copy,
                                                size: 20,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ] else ...[
                                  Container()
                                ],
                                if (businessProfileModel.taxId != '') ...[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(32, 12, 32, 8),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Tax ID'.tr,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(48, 12, 48, 12),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            businessProfileModel.taxId.toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 16),
                                          child: IconButton(
                                              onPressed: () async {
                                                await Clipboard.setData(ClipboardData(
                                                  text:  businessProfileModel.taxId.toString(),
                                                ));
                                                CustomSnack.show(context, 'Code Copied'.tr);
                                              },
                                              icon: Icon(
                                                Icons.copy,
                                                size: 20,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ] else ...[
                                  Container(),
                                ],
                                businessProfileModel.branchName != ''
                                    ? Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(32, 12, 32, 8),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Branch'.tr,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(48, 12, 48, 12),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        businessProfileModel.branchName.toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                    : Container(),
                                typeAccount != 'private'
                                    ? Container()
                                    : roleList.isEmpty
                                    ? Container()
                                    : Container(
                                  padding: EdgeInsets.fromLTRB(32, 12, 32, 8),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Job Position'.tr,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                typeAccount != 'private'
                                    ? Container()
                                    : roleList.isEmpty
                                    ? Container()
                                    : Container(
                                    padding: EdgeInsets.fromLTRB(48, 12, 48, 12),
                                    alignment: Alignment.topLeft,
                                    child: MediaQuery.removePadding(
                                      removeTop: true,
                                      context: context,
                                      child: ListView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: roleList.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                                margin:
                                                EdgeInsets.only(bottom: 10),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Text(
                                                  " - " +
                                                      roleList[index]
                                                          .roleName
                                                          .toString() +
                                                      " " +
                                                      roleList[index]
                                                          .deptName
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w400),
                                                ));
                                          }),
                                    )),
                              ],),
                            )
                          ],
                        ),
                      ),
                    ),
                    isEditStatus || isEditPicture || isEditName
                        ? Container(
                            height: 48,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.fromLTRB(32, 8, 32, 32),
                            child: GradientButton(
                                key: ValueKey('saveBtn'),
                                title: 'Save'.tr,
                                isEnable: isEnable,
                                isBtnLoading: isBtnLoading,
                                callBack: () {

                                  if (isEditName == true) {
                                    editName(nameProfile);
                                    setState(() {
                                      isEnable = false;
                                    });
                                  }

                                  if (isEditStatus == true) {
                                    editStatus(statusProfile);
                                    setState(() {
                                      isEnable = false;
                                    });
                                  }

                                  if (isEditPicture == true) {
                                    setState(() {
                                      isEnable = false;
                                    });
                                  }
                                }),

                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
