import 'package:flutter/material.dart';
import 'package:pintsize/Components/SliverHeader.dart';
import 'package:pintsize/Components/silverappBarDonation.dart';
import 'package:pintsize/Screens/Donations/subPage/bloodDonation.dart';
import 'package:tuple/tuple.dart';
import 'package:pintsize/Widgets/bottomNav/bottomBar.dart';
import 'package:flutter/cupertino.dart';
import 'donationTabs/homepageDonateBlood.dart';
import 'donationTabs/homepageDonateMoney.dart';

class DonationScreen extends StatefulWidget {
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tuple2> _pages = [
    Tuple2('Donate Blood', BloodDonationSubPage()),
    Tuple2('Donate Money', DonateMoney()),
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
                      isScrollable: false,
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
                  children: [DonateBlood(), DonateMoney()],
                ))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DonationScreen()));
          },
          backgroundColor: Colors.red,
          child: Icon(Icons.bloodtype_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomBar());
  }
}
