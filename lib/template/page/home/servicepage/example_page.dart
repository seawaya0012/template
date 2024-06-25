import 'package:flutter/material.dart';

import '../../../api/model/serviceApp/oneplatform_app_account_model.dart';
import '../../../api/service/authentication_service.dart';
import '../../../appManager/local_storage_manager.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {

  String oneId = '';
  String accessToken = '';
  List<BusinessProfileModel> privateAccountList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Page'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      getDefaultAccount();
                    });
                  },
                  child: const Text('Get OneID')),
              Text(oneId),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      getAccessToken();
                    });
                  },
                  child: const Text('Get AccessToken')),
              Text(accessToken),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    getAllAccount();
                  });
                },
                child: const Text('Get BusinessService'),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: privateAccountList.length,
                  itemBuilder: (context, int index) {
                    return Center(
                      child:
                          Text(privateAccountList[index].companyNameTh ?? ''),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  getDefaultAccount() async {
    await LocalStorageManager.getDefaultAccount().then((value) {
      oneId = value?.oneId ?? '';
      print('oneId : ${oneId}');
    });
  }

  getAccessToken() async {
    await LocalStorageManager.getAccessToken().then((value) async => {
          accessToken = '${value?.accessToken.toString()}',
        });
  }

  getAllAccount() async {
    await AuthenticationService.getAllAccount().then((value) => {
          setState(() {
            privateAccountList = value.privateAccountList;
          })
        });
  }
}
