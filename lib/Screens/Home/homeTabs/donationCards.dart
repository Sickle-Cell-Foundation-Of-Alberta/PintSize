
import 'package:flutter/material.dart';


class DonationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  //  var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    //final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    //final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body:
  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  SizedBox(height: 1.0),

    Card(
      child: InkWell(
        splashColor: Colors.white,
        onTap: () {
          //print("Got");
        },
        child: Container(
child: Text("Blood Banks", 
textAlign: TextAlign.center,
style: TextStyle(fontWeight: FontWeight.bold,
                        color: Color(0xFFCC8053),
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
                        
          width: 190,
          height: 190,
          color: Colors.white,
           )
        ),
      ),
    
    Card(
      child: InkWell(
        splashColor: Colors.white,
       onTap: () {
        //  print("Got it");
        },
        child: Container(
          child: Text("Campaigns",
    textAlign: TextAlign.center,
           style: TextStyle(fontWeight: FontWeight.bold,
                        color: Color(0xFFCC8053),
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
          width: 190,
          height: 190,
   color: Colors.white,
        ),
      ),
    ),
  ]
  ));}}