import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pintsize/Config/backgroundPalette.dart';
import 'package:pintsize/Screens/Donations/donation.dart';
import 'package:pintsize/Widgets/bottomNav/bottomBar.dart';

class OrganizationScreen extends StatefulWidget {
  @override
  _OrganizationScreenState createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  SliverAppBar showSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.red,
      floating: true,
      pinned: true,
      snap: false,
      expandedHeight: 300,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              Container(
                height: 150,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox.shrink(),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/scfa_footer_logo.png',
                      ),
                      fit: BoxFit.scaleDown),
                  color: Palette.moderateRed,
                  //shape: BoxShape.circle
                ),
              ),
              Container(
                  transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    /*image: DecorationImage(
                                        image:
                                            AssetImage('assets/Background.png'),
                                        fit: BoxFit.fitHeight),*/
                                    color: Palette.moderateRed,
                                    shape: BoxShape.circle,
                                  )),
                            ]),
                        SizedBox(height: 10),
                        Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'SCFA',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        SizedBox(height: 10),
                        Text(
                          "The Sickle Cell Foundation of Alberta (SCFA) is a volunteer-based organization dedicated to creating awareness about SCD and providing support services to patients living in Alberta.",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          // child: CupertinoSlidingSegmentedControl(
                          // groupValue: Text(
                          //   "BIO",
                          //   style: TextStyle(
                          //     fontSize: 15,
                          //   ),
                          // ),
                          // groupValue: _profileSegmentedValue,
                          // thumbColor: KTweeterColor,
                          // backgroundColor: Colors.blueGrey,
                          // children: _profileTabs,
                          // onValueChanged: (i) {
                          //   setState(() {
                          //     _profileSegmentedValue = i;
                          //   });
                          // },
                        ),
                      ]))
            ]),
      ),
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
