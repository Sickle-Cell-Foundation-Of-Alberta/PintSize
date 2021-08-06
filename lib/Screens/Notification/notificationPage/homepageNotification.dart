import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pintsize/Screens/Notification/subPage/notification.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: new Container(
        child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('Awareness').snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) return const SizedBox.shrink();
            return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 5)),
                itemBuilder: (BuildContext context, int index) {
                  final databaseQuery = snapshot.data!.docs[index].data();
                  return _buildCard(databaseQuery['Title'],
                      databaseQuery['Description'], context);
                });
          },
        ),
      ),
    );
  }
}

Widget _buildCard(String title, String description, context) {
  return Padding(
      padding:
          EdgeInsets.only(top: 10.0, bottom: 15.0, left: 10.0, right: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NotificationSubPage(
                  documentTitle: title, documentDescription: description)));
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3.0,
                      blurRadius: 5.0)
                ],
                color: Colors.white),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.center,
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFCC8053),
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
              ),
              /*Center(
                child: Text(description,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Varela',
                        fontSize: 15.0)),
              ),*/
            ])),
      ));
}
