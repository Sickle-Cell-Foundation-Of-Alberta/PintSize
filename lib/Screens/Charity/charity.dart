import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:pintsize/Screens/Home/home.dart';
import 'package:flutter/cupertino.dart';

class CharityScreen extends StatefulWidget {
  CharityScreen({Key? key}) : super(key: key);

  @override
  _CharityScreenState createState() => _CharityScreenState();
}

class _CharityScreenState extends State<CharityScreen> {
  final _flutterwebview = FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: 'https://ourscfa.org/donate-now/',
        appBar: AppBar(
          toolbarHeight: 40,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => goToHome(context),
          ),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text("SCFA"),
          backgroundColor: Color(0xffb8534c),
          centerTitle: true,
          elevation: 0,
        ),
        withZoom: true,
        withLocalStorage: true,
        scrollBar: true,
        withJavascript: true,
        initialChild: Container(
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }

  @override
  void dispose() {
    _flutterwebview.dispose();
    super.dispose();
  }
}

goToHome(context) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
    ModalRoute.withName('/'));
