import 'dart:async';
import 'package:charuvidya/Screens/HomeScreen/Home.dart';
import 'package:charuvidya/Screens/HomeScreen/HomeScreen.dart';
import 'package:charuvidya/Screens/landingpage.dart';
import 'package:charuvidya/Secure/Secure_id_token.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = new UserSecureStorage(key: "id_token");

  @override
  Future<void> initState() async {
    final jwt = await storage.getIdToken();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        PageTransition(
            child: (jwt != null) ? HomeScreen() : IntroScreen(), type: PageTransitionType.rightToLeftWithFade),
            // child: LandingPage(), type: PageTransitionType.rightToLeftWithFade),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20 , right: 20),
                child: SizedBox(
                  height: 300,
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
