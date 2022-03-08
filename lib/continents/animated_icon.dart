import 'package:flutter/material.dart';
import 'package:animate_icons/animate_icons.dart';
class AnimationIcon extends StatelessWidget {
  final Color? color;
  final double? size ;
  final IconData startIcon;
  final IconData endIcon;
  AnimationIcon({Key? key,this.color,this.size,required this.endIcon,required this.startIcon}) : super(key: key);
  final controller = AnimateIconController();
  @override
  Widget build(BuildContext context) {
    // درست کردن آیکن انیمیشنال برای زیبایی بهتر UI
    return AnimateIcons(
      startIcon: startIcon,
      endIcon: endIcon,
      controller: controller,
      size: size,
      onStartIconPress: () {
        return true;
      },
      onEndIconPress: () {
        return true;
      },
      duration: const Duration(milliseconds: 500),
      startIconColor: color,
      endIconColor: color,
      clockwise: false,
    );
  }
}
