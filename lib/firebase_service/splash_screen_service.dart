import 'dart:async';

import 'package:eventra/posts/post_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../screen/login_screen.dart';

class SplashScreenService {
  void isLogin(BuildContext context) {

    // final auth = FirebaseAuth.instance;
    final user= Constant.auth.currentUser;

    if(user != null){
      Timer(
        const Duration(seconds: 3),
            () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PostScreen(),
              ));
        },
      );
    } else{
      Timer(
        const Duration(seconds: 3),
            () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
        },
      );
    }

    // Timer(
    //   const Duration(seconds: 3),
    //   () {
    //     Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const LoginScreen(),
    //         ));
    //   },
    // );
  }

}
