import 'package:flutter/material.dart';
import 'package:pintsize/Screens/Home/home.dart';
import 'package:pintsize/Screens/News/news.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.transparent,
        elevation: 9.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                color: Colors.white),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            icon: new Icon(
                              Icons.home,
                              color: Color(0xFFEF7532),
                            ),
                            onPressed: () => goToHome(context),
                          ),
                          /*IconButton(
                            icon: new Icon(
                              Icons.feed_outlined,
                              color: Color(0xFF676E79),
                            ),
                            onPressed: () => goToNews(context),
                          ),*/
                        ],
                      )),
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          /*IconButton(
                            icon: new Icon(
                              Icons.volunteer_activism_outlined,
                              color: Color(0xFF676E79),
                            ),
                            onPressed: () {},
                          ),*/
                          /*IconButton(
                            icon: new Icon(
                              Icons.person_outlined,
                              color: Color(0xFF676E79),
                            ),
                            onPressed: () {},
                          ),*/
                          IconButton(
                            icon: new Icon(
                              Icons.feed_outlined,
                              color: Color(0xFF676E79),
                            ),
                            onPressed: () => goToNews(context),
                          ),
                        ],
                      )),
                ])));
  }

  void goToHome(context) => Navigator.pushReplacementNamed(context, "/home");

  void goToNews(context) => Navigator.pushReplacementNamed(context, "/news");
}
