import 'package:caspian_coin/constants.dart';
import 'package:caspian_coin/continents/animated_icon.dart';
import 'package:caspian_coin/continents/card_view.dart';
import 'package:caspian_coin/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';

class WithdrawScreen extends StatefulWidget {
  //نوشتن یک اسم دلخواه برای مسیر صفحه
  static String routeName = 'withdraw_screen';

  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final _formKey = GlobalKey<FormState>();
  final walletController = TextEditingController();

  SnackBar showToast() {
    return SnackBar(
        shape: const StadiumBorder(),
        backgroundColor: kBackgroundColor,
        margin: const EdgeInsets.only(right: 16, left: 16, bottom: 8),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.up,
        content: Text(
          'The result of Withdraw Money is Sent in your email',
          style: kTextInfo.copyWith(fontSize: 13),
          textAlign: TextAlign.center,
        ));
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: const Text(
          'Withdraw Money',
          style: kCaspianTextStyle,
        ),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,
                color: kPrimaryColor, size: 25),
            onPressed: () =>
                Navigator.pushNamed(context, HomeScreen.routeName)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height*0.02,),
            SizedBox(
              height: size.height * 0.2,
              child: Card(
                elevation: 12,
                shadowColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: kBackgroundColor,
                child: SizedBox(
                  width: size.width*0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Current Coin',
                        style: kTextInfo.copyWith(
                            color: kOnPrimaryColor, fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * 0.009,
                      ),
                      Text(
                        '56,856',
                        style: kTextInfo.copyWith(fontSize: 50),
                      ),
                      SizedBox(
                        height: size.height * 0.009,
                      ),
                      Text(
                        '=\$ 5,6',
                        style: kTextInfo.copyWith(
                            fontSize: 20, color: kOnPrimaryColor),
                      ),
                      SizedBox(
                        height: size.height * 0.009,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CardView(
                width: size.width * 0.9,
                color: kSecondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dear Arash !\n\nYou are currently mining coins with This account :',
                        style: kTextStyle,
                      ),
                      Text('\narashspotify6369@gmail.com\n',
                          style: kTextStyle.copyWith(color: kPrimaryColor)),
                      RichText(
                        text: TextSpan(
                            text: 'When your wallet reaches ',
                            style: kTextStyle,
                            children: [
                              TextSpan(text: ' 1000 ', style: kTextInfo.copyWith(fontSize: 21)),
                              const TextSpan(text: 'coins,you can withdraw it through the button below and deposit it to your account.',),
                              const TextSpan(text: '\nPlease Give us Your Wallet Address so we can deposit the money in your account if you have reached the withdrawal limit .'),
                            ]),
                      ),
                      SizedBox(height: size.height*0.05,),
                      Form(key: _formKey,child: WalletAddress(controller: walletController)),
                      SizedBox(height: size.height*0.05,),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: kPrimaryColor,
                                  elevation: 4,
                                  shadowColor: kBackgroundColor,
                                  shape: const StadiumBorder()),
                              onPressed: () {
                                final form = _formKey.currentState!;
                                if(form.validate()){
                                  ScaffoldMessenger.of(context)
                                    ..removeCurrentSnackBar()
                                    ..showSnackBar(showToast());
                                }
                              },
                              child: Text(
                                'Withdraw Money',
                                style: kTextButtonStyle.copyWith(color: kBackgroundColor),
                              ))),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
// درست کردن فیلد شخصی برای وارد کردن آدرس کیف پول
class WalletAddress extends StatelessWidget {
  final TextEditingController controller ;
  WalletAddress({Key? key,required this.controller}) : super(key: key);

  final validator = RequiredValidator(errorText: 'Wallet Address is Required');
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      style: const TextStyle(color: Colors.white , fontFamily: 'Sources'),
      autofillHints: const [AutofillHints.postalAddress],
      cursorColor: kPrimaryColor,
      scrollPadding: const EdgeInsets.all(16),
      decoration: InputDecoration(
        label: Text('Wallet Address',style: kTextFieldStyle.copyWith(color: kPrimaryColor),),
        icon: AnimationIcon(color: kPrimaryColor,endIcon: FontAwesomeIcons.wallet, startIcon: FontAwesomeIcons.wallet),
      ),
    );
  }
}
