import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:caspian_coin/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final Color color;
  final Widget child;
  final double? width;
  final double? height;
  const CardView({Key? key, required this.child,this.width,this.height,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
class HeaderText extends StatelessWidget {
  final String header;
  const HeaderText({Key? key,required this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.04,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: AnimatedTextKit(
          totalRepeatCount: 3,
          pause: const Duration(milliseconds: 400),
          animatedTexts: [
            ColorizeAnimatedText(header, textStyle: kTextInfo.copyWith(fontSize: 25), colors: kColorizeColors)
          ],
        )
      ),
    );
  }
}
