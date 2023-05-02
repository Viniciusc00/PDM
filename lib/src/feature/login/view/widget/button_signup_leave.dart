import 'package:flutter/material.dart';

class button_signup_leave extends StatelessWidget {
  const button_signup_leave({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        "Cancelar",
        textAlign: TextAlign.center,
      ),
      onPressed: () => Navigator.pop(context, false),
    );
  }
}