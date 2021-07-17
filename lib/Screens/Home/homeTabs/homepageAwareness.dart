import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pintsize/Screens/Home/subPages/awareness.dart';

class AwarenessPage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<AwarenessPage> {
  //Creating an instance of firebase
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: formWidget(),
    );
  }

//Creating a referance to the database child
  var _firebaseRef =
      FirebaseDatabase().reference().child('Awareness').orderByChild("id");

  Widget formWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 6.0, right: 6.0),
      child: Center(
        child: StreamBuilder(
          stream: _firebaseRef.onValue,
/*On value change the stream is triggered for all 
crud operations. 
If you only want to trigger when a child is added 
use ***stream: _firebaseRef.onChildAdded,*** instead of onValue*/
          builder: (context, snap) {
            if (snap.hasData &&
                !snap.hasError &&
                snap.data.snapshot.value != null) {
              Map data = snap.data.snapshot.value;
              List item = [];

              data.forEach((index, data) {
                item.add(
                    {"key": index, ...data}); //The items are added to the list

                //if you only want to add a specific type of data to be displayed you can use this approach
                /*if (data["Type"] == "Pollution") {
                  item.add({"key": index, ...data});
                } */
              });
              if (item.length > 0) {
                return ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 15.0, left: 45.0, right: 45.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeAwarenessSubPage(
                                    documentTitle: item[index][
                                        "title"], //The title is taken from the list index
                                    documentDescription: item[
                                            index] //The description is taken from the list index
                                        ["description"])));
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
                                      child: Text(item[index]["title"],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFFCC8053),
                                              fontFamily: 'Varela',
                                              fontSize: 14.0)),
                                    ),
                                  ])),
                        ));
                  },
                );
              } else {
                //if item list has no data
                return Container(
                  child: ListView(children: <Widget>[
                    Text(
                      "Nothing To Display",
                      style: TextStyle(height: 5, fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ]),
                );
              }
            } else //if database reading has no data
              return Container(
                child: ListView(children: <Widget>[
                  Text(
                    "Nothing To Display",
                    style: TextStyle(height: 5, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ]),
              );
          },
        ),
      ),
    );
  }
}
