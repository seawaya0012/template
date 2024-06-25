import 'package:flutter/material.dart';
import '../../widget/appbar/base_appbar.dart';

class BlankPage extends StatefulWidget {
  const BlankPage({Key? key}) : super(key: key);

  @override
  State<BlankPage> createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: BaseAppBar(
        appbarTitle: '',
      ),
      body: Center(
        child: Icon(
          Icons.build_circle_outlined,
          size: 150,
          color: Theme.of(context).primaryColorLight,
        ),
      ),
    );
  }
}
