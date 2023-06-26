import 'package:flutter/material.dart';

import '../page/app_style.dart';
import '../page/size_configs.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key, required this.buttoName, required this.onPressed, required this.bgColor,
  });

  final String buttoName;
  final VoidCallback onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20
      ),
      child: SizedBox(
        height: SizeConfig.blockSizeH! * 15.5,
        width: SizeConfig.blockSizeH! * 100,
        child: TextButton(
          onPressed: onPressed,
            style: TextButton.styleFrom(
              backgroundColor: bgColor
            ),
          child: Text(
            buttoName,
            style: kBodyText1,
            ),
        ),
      ),
    );
  }
}