import 'package:flutter/material.dart';
import 'package:pintsize/Components/SliverHeader.dart';
import 'package:pintsize/Components/silverappBarDonation.dart';
import 'package:pintsize/Screens/Home/homeTabs/donationCards.dart';
import 'package:pintsize/Screens/Home/homeTabs/homepageDailyTips.dart';
import 'package:pintsize/Screens/Home/subPages/donateBlood.dart';
import 'package:pintsize/Screens/Home/subPages/donateMoney.dart';
import 'package:tuple/tuple.dart';
import 'package:pintsize/Widgets/bottomNav/bottomBar.dart';
import 'package:flutter/cupertino.dart';

import 'homepageAwareness.dart';
class DonationScreen extends StatefulWidget {
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tuple2> _pages = [
    Tuple2('Donate blood', DonateBlood()),
    Tuple2('Donate money', DonateMoney()),
  
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                PortfolioSliverAppBar(_pages[_tabController.index].item1),
                SliverPersistentHeader(
                    pinned: true,
                    floating: false,
                    delegate: SliverPresistentHeader(
                        tabBar: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Color(0xFFC88D67),
                      indicatorColor: Color(0xFFC88D67),
                      unselectedLabelColor: Color(0xFFCDCDCD),
                      tabs: _pages
                          .map<Tab>((Tuple2 page) => Tab(text: page.item1))
                          .toList(),
                    )))
              ];
            },
   
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                   DonationCard(),
                   DonateMoney()
                  ],
                ))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.red,
          child: Icon(Icons.bloodtype_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        
        bottomNavigationBar: BottomBar());
  }
}