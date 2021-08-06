import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pintsize/Screens/Donations/subPage/campaign.dart';

class DonateBlood extends StatelessWidget {
  List<String> events = [
    'Edmonton',
    'Calgary',
    'Red Deer',
    'Beaumont',
    'Airdrie',
    /*'Cochrane',
    'Okotoks',
    'Spruce Grove',
    'Devon',
    'Leduc',
    'Sherwood Park',
    'St. Albert',*/
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                // primary: false,
                // crossAxisSpacing: 10.0,
                // mainAxisSpacing: 15.0,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2),
                children: <Widget>[
                  _buildCard('Blood Donation', 0, context),
                  _buildCard('Campaign', 1, context),
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String title, int cardCheck, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 20.0, right: 5.0),
        child: InkWell(
          onTap: () {
            if (cardCheck == 0) {
              showModalBottomSheet(
                  isDismissible: true,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => buildModalDonation());
            }
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 1.0),
                    Align(
                      alignment: Alignment.center,
                      child: Text(title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFba5249),
                              fontFamily: 'Varela',
                              fontSize: 14.0)),
                    ),
                  ])),
        ));
  }

  Widget removeModal({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        // onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(onTap: () {}, child: child),
      );

  Widget buildModalDonation() => removeModal(
        child: DraggableScrollableSheet(
          initialChildSize: 0.7,
          maxChildSize: 0.7,
          builder: (_, controller) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: EdgeInsets.all(16),
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('BloodDonationData')
                    .where('City', whereIn: events)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView.separated(
                    controller: controller,
                    itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (context, index) =>
                        Divider(color: Colors.black),
                    itemBuilder: (BuildContext context, int index) {
                      final databaseQuery = snapshot.data!.docs[index].data();
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Blood Bank",
                          style: new TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      );
                      Text(
                        "The next available blood drive is: ",
                        style: TextStyle(fontSize: 16),
                      );
                      return Text(databaseQuery['City']);
                    },
                  );
                }),
          ),
        ),
      );
}
