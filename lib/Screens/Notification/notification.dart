import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pintsize/Widgets/bottomNav/bottomBar.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  SliverAppBar showSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.red,
      floating: true,
      pinned: true,
      snap: false,
      expandedHeight: 140,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            showSliverAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 200,
                  child: Center(
                    child: Text(
                      'Main Field',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  height: 800,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'Main Field',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.red,
          child: Icon(Icons.bloodtype_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomBar());
  }
}
