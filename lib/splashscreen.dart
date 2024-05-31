import 'package:flutter/material.dart';
import 'dart:async';
import 'package:music_app/main.dart'; // Import the screen you want to navigate to

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulate some loading time with a Timer
    Timer(Duration(seconds: 3), () {
      // Navigate to the next screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => MyHomePage(),
        ),
      );
    });

    return Scaffold(
      body: Container(color: Colors.black,
        child: Center(
          
          child: Image.asset('assets/cloud.png',
          height: 200,
          width: 200,),
        ),
      ),
    );
  }
}
