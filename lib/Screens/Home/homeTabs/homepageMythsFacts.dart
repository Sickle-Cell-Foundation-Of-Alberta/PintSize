import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pintsize/Screens/Home/subPages/mythsFacts.dart';

class MythFactsPage extends StatelessWidget {
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
          stream: FirebaseFirestore.instance
              .collection('MythsFacts')
              .orderBy('id')
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) return const SizedBox.shrink();
            return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 2)),
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
          EdgeInsets.only(top: 10.0, bottom: 15.0, left: 25.0, right: 25.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomeMythsnFactsSubPage(
                  documentTitle: title, documentDescription: description)));
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3.0,
                      blurRadius: 5.0)
                ],
                color: Colors.white),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 1.0),
              Align(
                alignment: Alignment.center,
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFba5249),
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
              ),
            ])),
      ));
}
