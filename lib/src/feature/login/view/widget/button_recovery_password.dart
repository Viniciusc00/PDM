import 'package:flutter/material.dart';
import 'package:appComida/src/feature/login/view/page/reset_password.dart';

class button_recovery_password extends StatelessWidget {
  const button_recovery_password({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        "Recuperar Senha",
        textAlign: TextAlign.right,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResetPasswordPage(),
          ),
        );
      },
    );
  }
}