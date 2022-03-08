import 'package:flutter/material.dart';
// رنگ ها و تمامی استایل های مورد استفاده شده در پروژه

const Color kBackgroundColor =  Color(0xFF151107);
const Color kOnPrimaryColor =  Color(0xFF6D5522);
const Color kPrimaryColor =  Color(0xFFBF9A48);
const Color kSecondaryColor = Color(0xB42B2307);
const kColorizeColors = [
  kPrimaryColor,
  kOnPrimaryColor,
  kBackgroundColor,
];

const TextStyle kCaspianTextStyle = TextStyle(fontFamily: 'Source', color: kPrimaryColor, fontSize: 30, fontWeight: FontWeight.w800,);
const TextStyle kTextButtonStyle = TextStyle(color: Colors.white,fontFamily: 'Source',fontSize: 19,fontWeight: FontWeight.bold);
const TextStyle kTextInfo = TextStyle(color: kPrimaryColor , fontSize: 20 , fontFamily: 'Source' , fontWeight: FontWeight.w900);
const TextStyle kTextFieldStyle =TextStyle(color: Colors.white , fontFamily: 'Source' , fontSize: 16);
const TextStyle kTextStyle = TextStyle(color: Colors.white , fontFamily: 'Source',fontSize: 16);


const Decoration kButtonDecoration0 = BoxDecoration(
    shape: BoxShape.circle ,
    gradient: RadialGradient(colors: [
      kBackgroundColor,
      kBackgroundColor,
    ]));
const Decoration kButtonDecoration1 = BoxDecoration(
    shape: BoxShape.circle ,
    gradient: RadialGradient(colors: [
      kBackgroundColor,
      kBackgroundColor,
      kBackgroundColor,
      kBackgroundColor,
      kBackgroundColor,
      kBackgroundColor,
      kBackgroundColor,
          kPrimaryColor,
    ]));
const Decoration kButtonConstDecoration = BoxDecoration(
    shape: BoxShape.circle ,
    gradient: RadialGradient(colors: [
      kBackgroundColor,
      kBackgroundColor,
    ])
);