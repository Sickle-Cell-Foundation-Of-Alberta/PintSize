import 'package:flutter/material.dart';
import 'package:pintsize/Components/SliverHeader.dart';
import 'package:pintsize/Components/sliverappBar.dart';
import 'package:pintsize/Screens/Home/subPages/awareness.dart';
import 'package:pintsize/Screens/Home/subPages/dailyTips.dart';
import 'package:pintsize/Screens/Home/subPages/mythsFacts.dart';
import 'package:pintsize/Screens/Home/subPages/resources.dart';
import 'package:pintsize/Widgets/bottomNav/bottomBar.dart';
import 'package:tuple/tuple.dart';

import 'homeTabs/homepageAwareness.dart';
import 'homeTabs/homepageDailyTips.dart';
import 'homeTabs/homepageMythsFacts.dart';
import 'homeTabs/homepageResources.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tuple2> _pages = [
    Tuple2('Awareness', HomeAwarenessSubPage()),
    Tuple2('Daily Tips', HomeDailyTipsSubPage()),
    Tuple2('Resources', HomeResourcesSubPage()),
    Tuple2('Myths & Facts', HomeMythsnFactsSubPage())
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
                    AwarenessPage(),
                    DailyTipsPage(),
                    ResourcePage(),
                    MythFactsPage(),
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
