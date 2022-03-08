import 'package:caspian_coin/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTab;
  final String? buttonTitle;
  const BottomButton({Key? key,required this.onTab , this.buttonTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        child: Center(
          child: Text(
            '$buttonTitle',
            style: kTextButtonStyle.copyWith(color: kBackgroundColor,fontSize: 25),
          ),
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [kPrimaryColor , kOnPrimaryColor],begin: Alignment.topLeft , end: Alignment.bottomRight),
        ),
        width: MediaQuery.of(context).size.width*0.5,
        height: MediaQuery.of(context).size.height*0.11,
      ),
    );
  }
}
