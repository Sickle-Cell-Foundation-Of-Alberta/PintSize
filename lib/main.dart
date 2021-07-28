import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:pintsize/Screens/News/news.dart';

import 'Screens/Donations/homepageDonation.dart';
import 'Screens/Home/home.dart';
import 'Screens/Notification/notification.dart';
import 'Screens/onBoarding/onboardingScreen.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'PintSize App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.white),
        initialRoute: "/",
        routes: {
          '/': (context) => OnBoardingScreen(),
          '/home': (context) => HomeScreen(),
          '/news': (context) => NewsScreen(),
          '/donate': (context) => DonationScreen(),
          '/notification': (context) => NotificationScreen(),
        });
  }
}
