import 'package:caspian_coin/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:caspian_coin/constants.dart';

class SplashScreen extends StatefulWidget {
  //نوشتن یک اسم دلخواه برای مسیر صفحه
  static String routeName = 'splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 6),(){
      Navigator.pushReplacementNamed(context, AuthScreen.routeName);
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Caspian Coin',
              speed: const Duration(milliseconds: 300),
              textAlign: TextAlign.center,
              textStyle: const TextStyle(
                fontFamily: 'Source',
                color: kOnPrimaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}