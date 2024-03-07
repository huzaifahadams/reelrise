import 'package:flutter/material.dart';
import 'package:reelrise/login/login_screen.dart';
import 'package:reelrise/usefull.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.play_arrow, size: 100, color: Colors.white),
            // Image.asset('assets/images/logo.png'),
            Text(
              'ReelRise',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            Text('Where Every Laugh Finds Its Reel'),
          ],
        ),
      ),
    );
  }
}
