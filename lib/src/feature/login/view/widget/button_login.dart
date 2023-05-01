import 'package:flutter/material.dart';
import 'package:appComida/src/feature/home/view/page/homepage.dart';


class button_login extends StatelessWidget {
  const button_login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
          Container(
            child: SizedBox(
              child: Icon(Icons.restaurant, color :Colors.white),
              height: 60,
              width: 60,
            ),
          )
        ],
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
    );
  }
}