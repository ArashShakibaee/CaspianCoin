import 'package:caspian_coin/constants.dart';
import 'package:caspian_coin/screens/home_screen.dart';
import 'package:caspian_coin/text_fields/custom_introduced.dart';
import 'package:caspian_coin/text_fields/custom_password.dart';
import 'package:caspian_coin/text_fields/custom_username.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:caspian_coin/text_fields/custom_email_text_field.dart';

class SignIn extends StatefulWidget {
  //نوشتن یک اسم دلخواه برای مسیر صفحه
  static String routeName = 'sign_in';

  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // ساختن کنترلر و درست کردن فرم برای ولیدت شدن تکست فیلد ها
  final  _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _introducedController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
                child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                Image.asset(
                  'images/logo.png',
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    CustomUsernameTextField(controller: _usernameController),
                    CustomEmailTextField(controller: _emailController),
                    CustomPasswordTextField(controller: _passwordController),
                    const Divider(
                      color: Color(0xFFBF9A48),
                      indent: 32,
                      endIndent: 32,
                    ),
                    CustomIntroducedTextField(controller: _introducedController),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            elevation: 4,
                            shadowColor: Colors.grey,
                            shape: const StadiumBorder()),
                        onPressed: () {
                          // چک کردن ولیدیشن ها .. اگر درست بود وارد صفحه هوم میشویم
                          final form = _formKey.currentState!;
                          if(form.validate()){
                            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                          }
                        },
                        child: const Text(
                          'Sign in',
                          style: kTextButtonStyle,
                        ))),
                SizedBox(
                  height: size.height * 0.05,
                ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
