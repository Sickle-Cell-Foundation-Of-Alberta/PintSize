import 'package:flutter/material.dart';
import 'package:pintsize/Screens/Donations/homepageDonation.dart';
import 'package:pintsize/Widgets/bottomNav/bottomBar.dart';

class HomeAwarenessSubPage extends StatelessWidget {
  final documentTitle, documentDescription, documentSubtitle;

  HomeAwarenessSubPage(
      {this.documentTitle, this.documentDescription, this.documentSubtitle});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Awareness",
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFFFCFAF8))),
      ),
      body: ListView(children: [
        SizedBox(height: 45.0),
        Center(
          child: Text(documentSubtitle,
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF17532))),
        ),
        SizedBox(height: 15.0),
        Center(
            child: Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Text(documentDescription,
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Varela', fontSize: 24.0)),
        )),
        SizedBox(height: 20.0),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DonationScreen()));
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.bloodtype_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
