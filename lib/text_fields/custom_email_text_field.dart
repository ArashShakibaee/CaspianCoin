import 'package:caspian_coin/constants.dart';
import 'package:caspian_coin/continents/animated_icon.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CustomEmailTextField extends StatelessWidget {
  final TextEditingController controller;
  CustomEmailTextField(
      {Key? key,required this.controller})
      : super(key: key);
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email Address is required'),
    PatternValidator(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$", errorText: 'Email Address is\'t Valid'),
  ]);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin:const EdgeInsets.all(5),
      child: TextFormField(
        controller: controller,
        validator: emailValidator,
        autofillHints: const [AutofillHints.email],
        style: const TextStyle(color: Colors.white , fontFamily: 'Sources'),
        keyboardType:TextInputType.emailAddress,
        scrollPadding: const EdgeInsets.all(16),
        obscureText: false,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          label: RichText(
            text: const TextSpan(
              text: 'Email Address',
              style: kTextFieldStyle,
              children: <TextSpan>[
                TextSpan(text: '(required)', style: TextStyle(color: kPrimaryColor,fontSize: 14,fontWeight: FontWeight.bold , fontFamily: 'Source')),
              ],
            ),
          ),
          icon: AnimationIcon(endIcon: Icons.mail, startIcon: Icons.mail_rounded),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          //حالت عادی بوردر
          enabledBorder:  const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: kPrimaryColor),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          // نغییر حالت بوردر زمانی که کاربر روی بوردر کلیک میکند
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: kOnPrimaryColor),
              borderRadius: BorderRadius.all(Radius.circular(32))),
          // تغییر حالت بوردر زمانی که کاربر اطلاعات اشتباه وارد میکند
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          focusedErrorBorder:const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(32))),
          errorStyle: kTextFieldStyle.copyWith(fontSize: 12 , color: Colors.red)
        ),
      ),
    );
  }
}
