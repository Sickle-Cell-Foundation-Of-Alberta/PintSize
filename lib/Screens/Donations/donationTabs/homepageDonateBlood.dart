import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pintsize/Screens/Donations/subPage/bloodDonation.dart';
import 'package:pintsize/Screens/Donations/subPage/campaign.dart';

class DonateBlood extends StatelessWidget {
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      BloodDonationSubPage(documentTitle: title)));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CampaignSubPage(documentTitle: title)));
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
}
