import 'package:flutter/material.dart';
import 'package:appComida/src/feature/login/view/page/cadastro.dart';


class button_signup extends StatelessWidget {
  const button_signup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        "Cadastre-se",
        textAlign: TextAlign.center,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignupPage(),
          ),
        );
      },
    );
  }
}