import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:pintsize/Screens/News/news.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Charity/charity.dart';
import 'Screens/Donations/donation.dart';
import 'Screens/Home/home.dart';
import 'Screens/Organization/organization.dart';
import 'Screens/onBoarding/onboardingScreen.dart';

int? isviewed;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('isviewed');
  await prefs.setInt("isviewed", 1);
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
          '/home': (context) => NewsScreen(),
          '/news': (context) => NewsScreen(),
          '/donate': (context) => DonationScreen(),
          '/notification': (context) => OrganizationScreen(),
          '/charity': (context) => CharityScreen(),
        });
  }
}

// FIX Back Arrow Button WHen init screen is good

goToHome(context) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
    ModalRoute.withName('/'));
