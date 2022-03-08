import 'package:flutter/material.dart';
import 'package:caspian_coin/constants.dart';
class CardTimer extends StatelessWidget {
  final String ? header;
  final String ? time;
  const CardTimer({Key? key,this.header,this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$header',
          style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 14,
              fontFamily: 'Source',
              fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 4),
        Card(
          margin: const EdgeInsets.only(top: 3 , right: 5 , left: 5 , bottom: 3),
          elevation: 0,
          shadowColor: kOnPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$time',
              style: const TextStyle(
                  fontSize: 40,
                  color: kBackgroundColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source'),
            ),
          ),
        ),
      ],
    );
  }
}
