import 'package:caspian_coin/constants.dart';
import 'package:caspian_coin/continents/animated_icon.dart';
import 'package:caspian_coin/continents/card_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_screen.dart';
import 'package:caspian_coin/continents/contact_us_field.dart';

class ContactUs extends StatelessWidget {
  //نوشتن یک اسم دلخواه برای مسیر صفحه
  static String routeName = 'about_us_screen';

  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text('Contact Us', style: kCaspianTextStyle),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,
                color: kPrimaryColor, size: 25),
            onPressed: () =>
                Navigator.pushNamed(context, HomeScreen.routeName)),
        backgroundColor: kBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeaderText(header: 'Telegram'),
            CardView(
              width: size.width * 0.9,
              color: Colors.blue.shade100,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimationIcon(
                            color: Colors.blue,
                            size: 25,
                            endIcon: FontAwesomeIcons.telegram,
                            startIcon: FontAwesomeIcons.telegram),
                        Center(
                            child: Text(
                          'Click Buttons to Open Telegram Channels',
                          style: kTextInfo.copyWith(
                              fontSize: size.height * 0.0145,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        )),
                        AnimationIcon(
                          color: Colors.blue,
                          size: 25,
                          endIcon: FontAwesomeIcons.telegram,
                          startIcon: FontAwesomeIcons.telegram,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: size.width * 0.3,
                            child: ElevatedButton(
                              onPressed: () async {
                                const url = 'https://t.me/caspiancoin_io';
                                await launch(url);
                              },
                              child: Text(
                                'First Channel',
                                style: kTextButtonStyle.copyWith(
                                    fontSize: size.height * 0.016),
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  primary: Colors.blue,
                                  shadowColor: Colors.blue.shade700,
                                  shape: const StadiumBorder()),
                            )),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        SizedBox(
                            width: size.width * 0.3,
                            child: ElevatedButton(
                              onPressed: () async {
                                const url = 'https://t.me/caspian_coin_io';
                                await launch(url);
                              },
                              child: Text(
                                'Second Channel',
                                style: kTextButtonStyle.copyWith(
                                    fontSize: size.height * 0.015),
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  primary: Colors.blue,
                                  shadowColor: Colors.blue.shade700,
                                  shape: const StadiumBorder()),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // اضافه کردن فیلد دست ساز و هدرتکس دست ساز برای زیبایی ارتباط باما
            const HeaderText(header: 'Instagram'),
            ContactUsField(
              url: 'https://instagram.com/caspian_coin',
              backgroundColor: Colors.orange.shade100,
              startIcon: FontAwesomeIcons.instagram,
              endIcon: FontAwesomeIcons.instagram,
              title: 'Click Button to Open Instagram Page',
              buttonText: 'Instagram Page',
              primaryColor: Colors.orange,
              secondaryColor: Colors.orange.shade700,
            ),
            const HeaderText(header: 'Twitter'),
            ContactUsField(
              url: 'https://twitter.com/Caspiancoin',
              backgroundColor: Colors.purple.shade100,
              startIcon: FontAwesomeIcons.twitter,
              endIcon: FontAwesomeIcons.twitter,
              title: 'Click Button to Open Twitter Page',
              buttonText: 'Twitter Page',
              primaryColor: Colors.purple,
              secondaryColor: Colors.purple.shade700,
            ),
            const HeaderText(header: 'Medium'),
            ContactUsField(
              url: 'https://medium.com/@caspiancoin',
              backgroundColor: Colors.green.shade100,
              startIcon: FontAwesomeIcons.medium,
              endIcon: FontAwesomeIcons.medium,
              title: 'Click Button to Open Medium Page',
              buttonText: 'Medium Page',
              primaryColor: Colors.green,
              secondaryColor: Colors.green.shade700,
            ),
            const HeaderText(header: 'Reddit'),
            ContactUsField(
              url: 'https://www.reddit.com/u/CASPIANCOIN_io?utm_medium=android_app&utm_source=share',
              backgroundColor: Colors.red.shade100,
              startIcon: FontAwesomeIcons.reddit,
              endIcon: FontAwesomeIcons.reddit,
              title: 'Click Button to Open Reddit Page',
              buttonText: 'Reddit Page',
              primaryColor: Colors.red,
              secondaryColor: Colors.red.shade700,
            ),
            const HeaderText(header: 'Facebook'),
            ContactUsField(
              url: 'https://www.facebook.com/caspiancoin',
              backgroundColor: Colors.blue.shade100,
              startIcon: FontAwesomeIcons.facebookF,
              endIcon: FontAwesomeIcons.facebookF,
              title: 'Click Button to Open Facebook Page',
              buttonText: 'Facebook Page',
              primaryColor: Colors.blue,
              secondaryColor: Colors.blue.shade700,
            ),
          ],
        ),
      ))),
    );
  }
}