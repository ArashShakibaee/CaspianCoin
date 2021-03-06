import 'package:caspian_coin/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? password;
  const CustomPasswordTextField({Key? key, required this.controller,this.password})
      : super(key: key);

  @override
  _CustomPasswordTextFieldState createState() =>
      _CustomPasswordTextFieldState(controller,password);
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  final TextEditingController controller;
   String? password;
  _CustomPasswordTextFieldState(this.controller,this.password);

  bool isObscure = true;
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
    PatternValidator(r"^(?=.*?[A-Z])(?=.*?[a-z]).{6,}$", errorText: 'Passwords must have at least one a-z_A-Z'),
    PatternValidator(r"^(?=.*?[0-9]).{6,}$", errorText: 'Passwords must have at least one Number'),
  ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(5),
      child: TextFormField(
        onChanged: (value)=>password = value,
        controller: controller,
        validator: passwordValidator,
        style: const TextStyle(color: Colors.white, fontFamily: 'Sources'),
        scrollPadding: const EdgeInsets.all(16),
        obscureText: isObscure,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          label: RichText(
            text: const TextSpan(
              text: 'Password',
              style: kTextFieldStyle,
              children: <TextSpan>[
                TextSpan(
                    text: '(required)',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Source')),
              ],
            ),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(left:10.0,right: 10),
            child: GestureDetector(
              // ?????????? ???? ?????????? ?????? ???????? ???????? ?????????? .. ???????? ???????? ???????? ?? ?????????? ??????????
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: FaIcon(
                  isObscure ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                  color: kPrimaryColor,
                  size: 25,
                )),
          ),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            //???????? ???????? ??????????
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: kPrimaryColor),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            // ?????????? ???????? ?????????? ?????????? ???? ?????????? ?????? ?????????? ???????? ??????????
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: kOnPrimaryColor),
                borderRadius: BorderRadius.all(Radius.circular(32))),
            // ?????????? ???????? ?????????? ?????????? ???? ?????????? ?????????????? ???????????? ???????? ??????????
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(32))),
            errorStyle: kTextFieldStyle.copyWith(color: Colors.red,fontSize: 11)
        ),
      ),
    );
  }
}
