import 'package:caspian_coin/constants.dart';
import 'package:flutter/material.dart';

class ReferralActivity extends StatelessWidget {
  const ReferralActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'How Many Users Joined on your Behalf',
            style: kTextInfo.copyWith(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: size.height*0.03,),
          SizedBox(
            width: size.width * 0.7,
            height: size.height * 0.07,
            child: Card(
              shape: const StadiumBorder(),
              color: kPrimaryColor,
              elevation: 12,
              shadowColor: Colors.black,
              child: Center(
                child: Text(
                  '000',
                  style: kTextInfo.copyWith(fontSize: 30,color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height*0.03,),
          Text(
            'How Much Money Earned on your Behalf',
            style: kTextInfo.copyWith(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: size.height*0.03,),
          SizedBox(
            width: size.width * 0.7,
            height: size.height * 0.07,
            child: Card(
              shape: const StadiumBorder(),
              color: kPrimaryColor,
              elevation: 12,
              shadowColor: Colors.black,
              child: Center(
                child: Text(
                  '000,000,000 \$',
                  style: kTextInfo.copyWith(fontSize: 30,color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
