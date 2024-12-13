import 'package:eventra/firebase_service/splash_screen_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenService splashScreenService = SplashScreenService();

  @override
  void initState() {
    // TODO: implement initState

    splashScreenService.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "This is Splash Screen",
        style: TextStyle(
          fontSize: 25,
        ),
      )),
    );
  }
}
