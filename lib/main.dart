import 'package:caspian_coin/constants.dart';
import 'package:caspian_coin/screens/contact_us.dart';
import 'package:caspian_coin/screens/auth_screen.dart';
import 'package:caspian_coin/screens/referral_screen.dart';
import 'package:caspian_coin/screens/sign_in.dart';
import 'package:caspian_coin/screens/splash_screen.dart';
import 'package:caspian_coin/screens/home_screen.dart';
import 'package:caspian_coin/screens/withdraw.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // تغییر رنگ های جانبی اپ
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        systemNavigationBarDividerColor: kBackgroundColor,
        systemNavigationBarColor: kBackgroundColor,
        statusBarColor: kBackgroundColor,
        statusBarIconBrightness: Brightness.light
    ),
  );
  runApp(const CaspianCoin());
}

class CaspianCoin extends StatelessWidget {
  const CaspianCoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        appBarTheme:
            const AppBarTheme(iconTheme: IconThemeData(color: kPrimaryColor)),
      ),
      //اپ از صفحه اسپلش اسکرین شروع شود
      initialRoute: SplashScreen.routeName,
      // تعریف راه ها برای رفتن به صفحات مختلف
      routes: {
        WithdrawScreen.routeName: (context)=> const WithdrawScreen(),
        ContactUs.routeName: (context)=>const ContactUs(),
        ReferralScreen.routeName: (context)=> const ReferralScreen(),
        SignIn.routeName: (context) => const SignIn(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        AuthScreen.routeName: (context) => const AuthScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
