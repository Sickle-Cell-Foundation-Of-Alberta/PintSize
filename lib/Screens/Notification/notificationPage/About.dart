import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pintsize/Screens/Notification/subPage/notification.dart';

void main() { runApp(AboutPage()); }  
  
class AboutPage extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
        theme: ThemeData(  
          primarySwatch: Colors.red,  
        ),  
        home: MyTextPage()  
    );  
  }  
}  
class MyTextPage extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
         
      body: Center(  
          child: Text("The Sickle Cell Foundation of Alberta (SCFA) is a volunteer-based organization dedicated to creating awareness about SCD and providing support services to patients living in Alberta. It was founded in 2001 by Dr. Ekua Yorke and Dr. Jojo Yorke to help patients deal with their condition.The SCFA teaches patients coping skills for pain management, advocates for funding of SCD research and provides its members with access to the most current scientific research and information. It is led by a board of directors, consisting primarily of sickle cell patients, health professionals, patients’ parents and caregivers.",  
     textAlign: TextAlign.left,
     style: TextStyle(color:Colors.black87, fontSize:20),
      )),  
    );  
  }  
}  