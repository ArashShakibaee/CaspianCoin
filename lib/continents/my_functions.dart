import 'package:flutter/material.dart';
import 'package:caspian_coin/constants.dart';
import 'card_timer.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';


class MyFunctions{
// شکل گیری و چینش تایمر صفحه اصلی در کارت ویو
  Widget buildTimer(Duration duration , BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final hours = twoDigits(duration.inHours.remainder(24));
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.17),
        child: Card(
          elevation: 12,
          shadowColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: kBackgroundColor,
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardTimer(time: hours, header: 'Hour'),
                  CardTimer(time: minutes, header: 'Minutes'),
                  CardTimer(time: seconds, header: 'Seconds'),
                ],
              )),
        ),
      ),
    );
  }
  // اسنک بار برای نشان دادن اینکه هنوز زمان فشار دادن دکمه فرا نرسیده
  SnackBar customSnackBar(Duration duration){
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final hours = twoDigits(duration.inHours.remainder(24));
    return SnackBar(
        shape: const StadiumBorder(),
        backgroundColor: kBackgroundColor,
        margin: const EdgeInsets.only(right: 16 , left:16,bottom: 8),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.up,
        content: Text(
          'You can press the button in another $hours:$minutes:$seconds',
          style: kTextInfo.copyWith(fontSize: 15),
          textAlign: TextAlign.center,
        ));
  }
}