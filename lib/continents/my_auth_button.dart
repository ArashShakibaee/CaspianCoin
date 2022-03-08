import 'package:caspian_coin/constants.dart';
import 'package:flutter/material.dart';

class MyAuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color ? color;
  final Widget? icon;
  final String? label;

  const MyAuthButton({Key? key, required this.onPressed, this.icon, this.label,this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity ,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color,shape: const StadiumBorder(),elevation: 4,shadowColor: Colors.grey),
        onPressed: onPressed,
        child: ListTile(leading: icon,title: Text('$label',style: kTextButtonStyle,),),
      ),
    );
  }
}
