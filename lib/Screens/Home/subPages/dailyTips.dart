import 'package:flutter/material.dart';
import 'package:pintsize/Widgets/bottomNav/bottomBar.dart';

class HomeDailyTipsSubPage extends StatelessWidget {
  final documentTitle, documentDescription;

  HomeDailyTipsSubPage({this.documentTitle, this.documentDescription});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Daily Tips',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFFFCFAF8))),
      ),
      body: ListView(children: [
        SizedBox(height: 15.0),
        SizedBox(height: 20.0),
        Center(
          child: Text(documentTitle,
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF17532))),
        ),
        SizedBox(height: 10.0),
        Center(
          child: Text(documentDescription,
              style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 24.0)),
        ),
        SizedBox(height: 20.0),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.red,
          child: Icon(Icons.bloodtype_outlined)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
