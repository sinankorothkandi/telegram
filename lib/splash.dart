// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_2/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_2/Home.dart';

class mysplashScreen extends StatefulWidget {
  const mysplashScreen({super.key});

  @override
  State<mysplashScreen> createState() => _mysplashScreenState();
}

class _mysplashScreenState extends State<mysplashScreen> {
  @override

  void initState() {
    super.initState();
    _navigationToHome();
  }

  void _navigationToHome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    await Future.delayed(Duration(milliseconds: 500));
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomePage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute
          (builder: (_) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: Text(
            'Telegram',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
