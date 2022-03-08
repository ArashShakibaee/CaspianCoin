import 'package:caspian_coin/constants.dart';
import 'package:caspian_coin/continents/card_view.dart';
import 'package:caspian_coin/continents/referral_activity.dart';
import 'package:caspian_coin/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReferralScreen extends StatefulWidget {
  //نوشتن یک اسم دلخواه برای مسیر صفحه
  static String routeName = 'referral_screen';

  const ReferralScreen({Key? key}) : super(key: key);

  @override
  _ReferralScreenState createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  String text = 'https://adfhuiryy38425dufw89r8ytuifidfj4ydhdkldfj2r9';

  SnackBar showToast() {
    return SnackBar(
        shape: const StadiumBorder(),
        backgroundColor: kBackgroundColor,
        margin: const EdgeInsets.only(right: 16, left: 16, bottom: 8),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.up,
        content: Text(
          'The link in Copied on your Keyboard',
          style: kTextInfo.copyWith(fontSize: 15),
          textAlign: TextAlign.center,
        ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,
                color: kPrimaryColor, size: 25),
            onPressed: () =>
                Navigator.pushNamed(context, HomeScreen.routeName)),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: const Text(
          'Referral',
          style: kCaspianTextStyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            CardView(
              color: kSecondaryColor,
              width: double.infinity,
                height: size.height*0.3,
                child: Center(
                    child: Text(
              'Text Information',
              style: kTextInfo.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ))),
            const HeaderText(header: 'Your Link'),
            CardView(
              color: kSecondaryColor,
              width: double.infinity,
                height: size.height*0.1,
                child: Center(
              child: Row(
                children: [
                   SizedBox(
                      height: MediaQuery.of(context).size.height*0.05,
                      width: size.width*0.6,
                      child: ListView(
                        children: [
                          Center(
                            child: Text(
                              text,
                              style: kTextInfo.copyWith(
                                  fontSize: 19, fontWeight: FontWeight.bold,color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(4),
                      ),
                    ),
                    SizedBox(width: size.width*0.03),
                    SizedBox(
                      width: size.width*0.2,
                      height: size.height*0.05,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: kPrimaryColor,elevation: 8,shadowColor: Colors.black),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: text));
                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(showToast());
                          },
                          child: Text(
                            'COPY',
                            style: kTextInfo.copyWith(fontSize: size.height*0.024,color: kBackgroundColor),
                          )),
                    ),
                ],
              ),
            )),
            const HeaderText(header: 'Your Activity'),
            CardView(
              color: kSecondaryColor,
              width: double.infinity,
              height: size.height*0.4,
              child: const ReferralActivity(),
            ),
        ],
      ),
          )),
    );
  }
}
