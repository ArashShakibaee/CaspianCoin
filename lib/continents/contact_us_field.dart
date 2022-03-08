import 'package:caspian_coin/constants.dart';
import 'package:caspian_coin/continents/animated_icon.dart';
import 'package:caspian_coin/continents/card_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//فیلد دست ساز برای قسمت ارتباط با ما
class ContactUsField extends StatelessWidget {
  final Color backgroundColor;
  final Color? primaryColor;
  final Color? secondaryColor;
  final IconData startIcon;
  final IconData endIcon;
  final String? title;
  final String url;
  final String? buttonText;

  const ContactUsField(
      {Key? key,
        this.secondaryColor,
        this.buttonText,
        required this.url,
        this.title,
        required this.backgroundColor,
        this.primaryColor,
        required this.startIcon,
        required this.endIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CardView(
      width: size.width * 0.9,
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimationIcon(
                    color: primaryColor,
                    size: 25,
                    endIcon: endIcon,
                    startIcon: startIcon),
                Center(
                    child: Text(
                      '$title',
                      style: kTextInfo.copyWith(
                          fontSize: size.height * 0.016,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                    )),
                AnimationIcon(
                  color: primaryColor,
                  size: 25,
                  endIcon: endIcon,
                  startIcon: startIcon,
                ),
              ],
            ),
            SizedBox(
                width: size.width * 0.5,
                child: ElevatedButton(
                  onPressed: () async {
                    await launch(url);
                  },
                  child: Text(
                    '$buttonText',
                    style:
                    kTextButtonStyle.copyWith(fontSize: size.height * 0.02),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      primary: primaryColor,
                      shadowColor: secondaryColor,
                      shape: const StadiumBorder()),
                )),
          ],
        ),
      ),
    );
  }
}