import 'dart:async';
import 'package:caspian_coin/constants.dart';
import 'package:caspian_coin/continents/buttom_buttons.dart';
import 'package:caspian_coin/continents/drawer.dart';
import 'package:caspian_coin/continents/my_functions.dart';
import 'package:caspian_coin/screens/referral_screen.dart';
import 'package:caspian_coin/screens/withdraw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  //نوشتن یک اسم دلخواه برای مسیر صفحه
  static String routeName = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // اضافه کردن اسنک بار و تایمر ما در صفحه اصلی
  final MyFunctions functions = MyFunctions();
// درست کردن انیمیشن دکمه بزرگ
  late AnimationController controller;
  late Animation animation;
  getAnimation() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        DecorationTween(begin: kButtonDecoration0, end: kButtonDecoration1)
            .animate(controller);
    controller.forward();
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.addListener(() {
      setState(() {});
    });
  }
  // درست کردن تایمر
  Timer? timer;
  Duration duration = const Duration();
  // در اینجا شما میتوانید با تغییر دادن ثانیه به ساعت .. روی 24 ساعت تنظیم کنید
  Duration countdownDuration = const Duration(seconds: 10);
  bool countdown = true;

  addTimer() {
    const addSeconds = -1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
      if (seconds <= 0) {
        timer?.cancel();
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => addTimer());
  }

  void resetTimer() {
    if (countdown) {
      setState(() {
        duration = countdownDuration;
      });
    } else {
      setState(() {
        duration = const Duration();
      });
    }
  }
// زمانی که برروی دکه روشن یا خاموش کلیک میشود چه اتفاقی میوفتد ؟
// اگر دکمه خاموش باشد اسنک بار نشان داده و اگر آماده برای فشار دادن باشد ، پس از فشاردادن دکمه خاموش میشود
  void buttonReact() {
    if (timer!.isActive == true) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(functions.customSnackBar(duration));
    } else {
      resetTimer();
      startTimer();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAnimation();
    startTimer();
    resetTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: Drawer(
        child: Container(color: kBackgroundColor, child: const CustomDrawer()),
      ),
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Caspian Coin',
          style: kCaspianTextStyle,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(flex: 2, child: functions.buildTimer(duration, context)),
            Center(
                child:
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1)),
            Expanded(
              flex: 3,
              child: Container(
                constraints:
                    const BoxConstraints.tightFor(width: 200, height: 200),
                decoration: duration.inSeconds <= 0
                    ? animation.value
                    : kButtonConstDecoration,
                child: RawMaterialButton(
                  onPressed: () => setState(() => buttonReact()),
                  elevation: 8,
                  shape: const CircleBorder(),
                  child: Image.asset(
                    'images/logo.png',
                    height: 170,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Text Information 1',
                    style: kTextInfo,
                  ),
                  Text(
                    'Text Information 2',
                    style: kTextInfo.copyWith(
                        color: kOnPrimaryColor, fontSize: 17),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //اضافه کردن دکمه های دست ساز برای قرار گرقتن در پایین صفحه
                  BottomButton(
                    onTab: () =>
                        Navigator.pushNamed(context, ReferralScreen.routeName),
                    buttonTitle: 'Referral',
                  ),
                  BottomButton(
                    onTab: () => Navigator.pushNamed(context, WithdrawScreen.routeName),
                    buttonTitle: 'Withdraw',
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
