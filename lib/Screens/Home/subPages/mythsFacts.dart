import 'package:flutter/material.dart';
import 'package:pintsize/Screens/Donations/donation.dart';
import 'package:pintsize/Widgets/bottomNav/bottomBar.dart';

class HomeMythsnFactsSubPage extends StatelessWidget {
  final documentTitle, documentDescription;

  HomeMythsnFactsSubPage({this.documentTitle, this.documentDescription});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Myths and Facts",
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFFFCFAF8))),
      ),
      body: ListView(children: [
        SizedBox(height: 60.0),
        Center(
            child: Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Text(documentTitle,
              style: TextStyle(
                  letterSpacing: 1.0,
                  color: Colors.black,
                  fontFamily: 'Varela',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold)),
        )),
        Center(
            child: Padding(
          padding: EdgeInsets.fromLTRB(35, 5, 35, 5),
          child: Text(documentDescription,
              style: TextStyle(
                  height: 1.5,
                  letterSpacing: 1.0,
                  color: Colors.black,
                  fontFamily: 'Varela',
                  fontSize: 24.0)),
        )),
        SizedBox(height: 20.0),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DonationScreen()));
          },
          backgroundColor: Colors.red,
          child: Icon(Icons.bloodtype_outlined)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
