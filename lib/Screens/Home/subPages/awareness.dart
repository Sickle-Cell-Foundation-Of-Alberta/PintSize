import 'package:flutter/material.dart';
import 'package:pintsize/Widgets/bottomNav/bottomBar.dart';

class HomeAwarenessSubPage extends StatelessWidget {
  final documentTitle, documentDescription;

  HomeAwarenessSubPage({this.documentTitle, this.documentDescription});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(documentTitle,
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFFFCFAF8))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: [
        SizedBox(height: 15.0),
        SizedBox(height: 20.0),
       // Center(
        //  child: Text(documentTitle,
         //     style: TextStyle(
          //        fontFamily: 'Varela',
           //       fontSize: 22.0,
           //       fontWeight: FontWeight.bold,
            //      color: Color(0xFFF17532))),
       // ),
        SizedBox(height: 10.0),
        Center(
          child: Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Text(documentDescription,
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Varela', fontSize: 24.0)),
        )),
        SizedBox(height: 20.0),
      ]),
      backgroundColor: Color(0xFFFCFAF8),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: Icon(Icons.bloodtype_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
