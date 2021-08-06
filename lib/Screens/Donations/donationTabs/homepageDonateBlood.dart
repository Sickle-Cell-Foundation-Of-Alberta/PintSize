import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pintsize/Screens/Donations/subPage/bloodDonation.dart';
import 'package:pintsize/Database/cbs_data.dart';

class DonateBlood extends StatelessWidget {
  var cbsData = BloodDonationData.getData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
// scrollDirection: Axis.horizontal,
                itemCount: cbsData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: 220,
                    width: double.maxFinite,
                    child: Card(
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(7),
                          child: Stack(children: <Widget>[
                            Align(
                              alignment: Alignment.centerRight,
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 10,
                                              ),
                                              bloodServicesLocation(
                                                  cbsData[index]),
                                              Spacer(),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              bloodDonationDates(cbsData[index])
                                            ],
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    ));
  }

  Widget bloodServicesLocation(data) {
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
          text: '${data['Donor_Centre']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
          children: <TextSpan>[
            TextSpan(
                text: '\n${data['Address']}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: '\n${data['Province_location']}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget bloodDonationDates(data) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
        child: RichText(
          text: TextSpan(
            text: '\nNext Available Appointment',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: '\n${data['Date']}',
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

    // return Align(
    //   alignment: Alignment.topLeft,
    //   child: RichText(
    //     text: TextSpan(
    //       text: '${data['name']}',
    //       style: TextStyle(
    //           fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
    //       children: <TextSpan>[
    //         TextSpan(
    //             text: '\n${data['symbol']}',
    //             style: TextStyle(
    //                 color: Colors.grey,
    //                 fontSize: 15,
    //                 fontWeight: FontWeight.bold)),
    //       ],
    //     ),
    //   ),
    // );