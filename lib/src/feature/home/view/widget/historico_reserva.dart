import 'package:app_comida/src/component/reservas.dart';
import 'package:flutter/material.dart';

class UserCarrinho extends StatefulWidget {
  final String email;
  final String nomeRestaurante;
  final int corRestaurante;
  UserCarrinho(
      {super.key,
      required this.email,
      required this.nomeRestaurante,
      required this.corRestaurante});

  @override
  State<UserCarrinho> createState() => _UserCarrinhoState();
}

PreferredSizeWidget _minhaBarra(String texto, int corRestaurante) {
  return AppBar(
    title: Text(texto,
        style: const TextStyle(
            color: Colors.white, fontFamily: 'Outfit', fontSize: 20)),
    backgroundColor: Color(corRestaurante),
    elevation: 0,
  );
}

class _UserCarrinhoState extends State<UserCarrinho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _minhaBarra("Minhas reservas", widget.corRestaurante),
        body: SingleChildScrollView(
          child: Column(
            children: [
              reservas(context, widget.email),
            ],
          ),
        ));
  }
}
