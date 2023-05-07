import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/bottom_navigation.dart';
import 'package:sicipe/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void session() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');

    if (token == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => bottom_navigation()));
    }
  }

  @override
  void initState() {
    Timer(
        Duration(
          seconds: 3,
        ), () {
      session();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/App Logo.png'),
                Text(
                  'SICIPE',
                  style: GoogleFonts.jost(color: Colors.black, fontSize: 30),
                ),
                Text(
                  'Find and Share Your Recipes',
                  style: GoogleFonts.jost(color: Colors.black, fontSize: 20),
                ),
                SizedBox(height: 60),
                CircularProgressIndicator(
                  color: Colors.deepOrange,
                ),
              ],
            )));
  }
}
