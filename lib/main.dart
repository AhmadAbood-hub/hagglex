import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import './sign_in.dart';
import './configuration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HaggleX',
      theme: ThemeData(
        primaryColor: PrimaryColor,
      ),
      home: AnimatedSplashScreen(
          duration: 2000,
          splash: Image.asset("images/hagglex.png"),
          splashIconSize: 150,
          nextScreen: SignIn(),
          splashTransition: SplashTransition.rotationTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: PrimaryColor),
    );
  }
}
