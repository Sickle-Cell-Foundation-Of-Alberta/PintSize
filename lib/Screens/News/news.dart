import 'package:flutter/material.dart';
import 'package:pintsize/Components/sliverappBar.dart';
import 'package:pintsize/Screens/Donations/donation.dart';
import 'package:pintsize/Screens/News/newsPage/homepageNews.dart';
import 'package:pintsize/Widgets/bottomNav/bottomBar.dart';
import 'package:tuple/tuple.dart';
import 'subPage/news.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tuple2> _pages = [
    Tuple2('News', NewsSubPage()),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
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
              ];
            },
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    NewsPage(),
                  ],
                ))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('yes');
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
