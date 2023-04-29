import 'package:flutter/material.dart';

class UserCarrinho extends StatelessWidget {
  const UserCarrinho({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Cart', style: TextStyle(fontSize: 48))),
    );
  }
}
