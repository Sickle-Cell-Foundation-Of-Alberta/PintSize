import 'package:flutter/material.dart';
import 'package:pintsize/Config/backgroundPalette.dart';
import 'package:pintsize/Screens/Home/home.dart';
import 'package:pintsize/Widgets/background/backgroundPainter.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SizedBox.expand(
        child: CustomPaint(
          painter: BackgroundPainter(
            animation: _controller.view,
          ),
        ),
      ),
      const SizedBox(height: 24),
      Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(18.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
                child: Text("Get Started ",
                    style: TextStyle(fontSize: 18, color: Palette.moderateRed)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(20)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Palette.moderateRed)))),
                onPressed: () => goToHome(context)),
          ])),
      Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(
            bottom: 235,
            left: 30,
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(
              'assets/Frame.png',
              width: 200,
              height: 150,
            )
          ])),
      Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(top: 450, right: 140, left: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Sickle Cell",
                style: TextStyle(
                    fontSize: 34,
                    color: Palette.moderateRed,
                    fontWeight: FontWeight.bold)),
            new Text("Foundation of",
                style: TextStyle(
                    fontSize: 25,
                    color: Palette.moderateRed,
                    fontWeight: FontWeight.normal)),
            new Text("Alberta",
                style: TextStyle(
                    fontSize: 25,
                    color: Palette.moderateRed,
                    fontWeight: FontWeight.normal)),
          ])),
    ]));
  }

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
}
