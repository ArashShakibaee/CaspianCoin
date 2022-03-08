import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:caspian_coin/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:caspian_coin/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:caspian_coin/continents/my_auth_button.dart';

class AuthScreen extends StatefulWidget {
  //نوشتن یک اسم دلخواه برای مسیر صفحه
  static String routeName = 'auth_screen';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextLiquidFill(
                    boxBackgroundColor: kBackgroundColor,
                    boxWidth: double.infinity,
                    boxHeight: 60,
                    text: 'Welcome To Caspian App',
                    waveColor: const Color(0xFFBF9A48),
                    textStyle: kCaspianTextStyle.copyWith(fontSize: 27),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Sign in With :',
                      style: kCaspianTextStyle.copyWith(
                          color: const Color(0xFFBF9A48)),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  // اضافه کردن دکمه های دست ساز
                  MyAuthButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.google,color: Colors.white,),
                    label: 'Sign in with Google',
                    color: Colors.orange,
                  ),
                  MyAuthButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.facebook),
                    label: 'Sign in with Facebook',
                    color: Colors.blue,
                  ),
                  MyAuthButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.twitter,color: Colors.white,),
                    label: 'Sign in with Twitter',
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Divider(
                    color: Color(0xFFBF9A48),
                    indent: 8,
                    endIndent: 8,
                  ),
                  MyAuthButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignIn.routeName);
                    },
                    icon: const Icon(Icons.email),
                    color: const Color(0xFFBF9A48),
                    label: 'Sign in with Email',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
