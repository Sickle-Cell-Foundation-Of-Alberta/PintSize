import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'resources.dart';

class ResourcePage extends StatelessWidget {
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
              FirebaseFirestore.instance.collection('Resources').snapshots(),
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
                  final docData = snapshot.data!.docs[index].data();
                  final docdataa = (docData['Title']);
                  return _buildCard(docdataa, 'Description',
                      'assets/flutter_onboarding_1.png', false, false, context);
                });
          },
        ),
      ),
    );
  }
}

Widget _buildCard(String name, String price, String imgPath, bool added,
    bool isFavorite, context) {
  return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 15.0, left: 45.0, right: 45.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomeResourcesSubPage(
                  assetPath: imgPath, cookieprice: price, cookiename: name)));
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
            child: Column(children: [
              SizedBox(height: 1.0),
              Text(price,
                  style: TextStyle(
                      color: Color(0xFFCC8053),
                      fontFamily: 'Varela',
                      fontSize: 14.0)),
              Text(name,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 14.0)),
            ])),
      ));
}
