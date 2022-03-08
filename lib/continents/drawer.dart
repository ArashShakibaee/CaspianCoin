import 'package:caspian_coin/screens/contact_us.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:caspian_coin/constants.dart';
import 'animated_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UserAccountsDrawerHeader(
          accountEmail: Text(
            'arashshakibaee@gmail.com',
            style: kTextInfo.copyWith(color: kBackgroundColor, fontSize: 16),
          ),
          accountName: Text(
            'ARASH',
            style: kTextInfo.copyWith(color: kBackgroundColor, fontSize: 20),
          ),
          decoration: const BoxDecoration(color: kPrimaryColor),
          currentAccountPicture: CircleAvatar(child: Image.asset('images/logo.png'),backgroundColor: kBackgroundColor),
        ),
        ListTile(
          onTap: ()=>Navigator.pushNamed(context, ContactUs.routeName),
          title: const Text(
            'Contact Us',
            style: kTextInfo,
          ),
          leading: AnimationIcon(
              endIcon: Icons.group_outlined, startIcon: Icons.group),
        ),
        const Divider(
          color: kPrimaryColor,
          indent: 32,
          endIndent: 32,
        ),
        ListTile(
          title: const Text(
            'Log Out',
            style: kTextInfo,
          ),
          leading: AnimationIcon(
              endIcon: FontAwesomeIcons.doorOpen,
              startIcon: FontAwesomeIcons.doorClosed),
        )
      ],
    );
  }
}
/*Stack(
      children: [
        Positioned(
          top: -70,
          left: -50,
          child: Container(
            width: size.width*0.89,
            height: size.height*0.59,
            decoration: const BoxDecoration(
                color: kSecondaryColor, shape: BoxShape.circle),
          ),
        ),
        Positioned(
          top: -70,
          left: -50,
          child: Container(
            width: size.width*0.77,
            height: size.height*0.54,
            decoration: const BoxDecoration(
                color: kDrawerColor1, shape: BoxShape.circle),
          ),
        ),
        Positioned(
          top: -70,
          left: -50,
          child: Container(
            width: size.width*0.65,
            height: size.height*0.48,
            decoration: const BoxDecoration(
                color: kDrawerColor2, shape: BoxShape.circle),
          ),
        ),
        ],
        );
        */
