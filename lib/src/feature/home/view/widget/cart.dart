import 'package:appComida/src/component/reservas.dart';
import 'package:flutter/material.dart';

class UserCarrinho extends StatefulWidget {
  const UserCarrinho({super.key});

  @override
  State<UserCarrinho> createState() => _UserCarrinhoState();
}

PreferredSizeWidget _minhaBarra(String texto) {
    return AppBar(
        title: Text(texto,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'PermanentMarker',
                fontSize: 37)),
        backgroundColor: Colors.red,
        elevation: 0,
        );
  }

class _UserCarrinhoState extends State<UserCarrinho> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: _minhaBarra("Laricão"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              reservas(context),
            ],
          ),
        ));
  }
}
