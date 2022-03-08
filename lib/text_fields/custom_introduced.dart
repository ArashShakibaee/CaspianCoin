import 'package:caspian_coin/constants.dart';
import 'package:caspian_coin/continents/animated_icon.dart';
import 'package:flutter/material.dart';

class CustomIntroducedTextField extends StatelessWidget {
  final TextEditingController controller;
  const CustomIntroducedTextField(
      {Key? key,required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin:const EdgeInsets.all(5),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white , fontFamily: 'Sources'),
        scrollPadding: const EdgeInsets.all(16),
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          label: const Text('Introduced',style: kTextFieldStyle,),
          icon: AnimationIcon(endIcon: Icons.person, startIcon: Icons.person_add_alt_1_sharp),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            //حالت عادی بوردر
          enabledBorder: const OutlineInputBorder(
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
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(32))),
          errorStyle: kTextFieldStyle.copyWith(color: Colors.red,fontSize: 13)
        ),
      ),
    );
  }
}