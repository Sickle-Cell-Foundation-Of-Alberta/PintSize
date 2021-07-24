import 'package:flutter/material.dart';

class PortfolioSliverAppBar extends StatelessWidget {
  final String _title;

  const PortfolioSliverAppBar(
    this._title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        expandedHeight: 120.0,
        floating: true,
        pinned: true,
        snap: true,
        elevation: 40.0,
        backgroundColor: Colors.red,
        flexibleSpace: Container(
            child: FlexibleSpaceBar(
          centerTitle: true,
          title: SizedBox(
            height: 100,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 44,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: "Sickle Cell Disease\n",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            TextSpan(
                                text: "Help",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic,
                                )),
                            TextSpan(
                                text: ' END',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic,
                                )),
                            TextSpan(
                                text: ' Sickle Cell \n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic,
                                )),
                            //TextSpan(
                            //  text:
                            //      'Together we can make a difference in the lives of those living with Sickle Cell Disease.',
                            // style: const TextStyle(
                            //  color: Colors.black,
                            //  fontSize: 12.0,
                            //   fontWeight: FontWeight.bold,
                          ]),
                        )
                      ])
                ]),
              ),
              // SizedBox(
              // height: 5,
            ),
            // SingleChildScrollView(
            //  child: Padding(
            //    padding: EdgeInsets.symmetric(horizontal: 16),
            //    child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //  children: <Widget>[
            //   Expanded(
            //
            //     width: 20,
            //   ),
            //    Expanded(
            //    child: ElevatedButton.icon(
            //  label: Text("Share".toUpperCase(),
            //    style: TextStyle(fontSize: 14)),
            //   style: ButtonStyle(
            //  padding:
            //      MaterialStateProperty.all<EdgeInsets>(
            //           EdgeInsets.all(10)),
            //     foregroundColor:
            //       MaterialStateProperty.all<Color>(
            //      Colors.black),
            //   backgroundColor:
            //       MaterialStateProperty.all<Color>(
            //           Colors.white),
            //    shape: MaterialStateProperty.all<
            //         RoundedRectangleBorder>(
            //    RoundedRectangleBorder(
            //   borderRadius:
            //      BorderRadius.circular(18.0),
            //   side:
            //       BorderSide(color: Colors.red)))),
            // icon: Icon(
            //   Icons.file_upload_outlined,
            //    size: 17,
          ),
          // onPressed: () => null,
        )));

    //   ),
    // );
  }
}
