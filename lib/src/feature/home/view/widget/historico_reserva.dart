import 'package:app_comida/src/component/reservas.dart';
import 'package:flutter/material.dart';

import '../../../../component/lista_restaurante.dart';

class UserCarrinho extends StatefulWidget {
  const UserCarrinho({super.key});

  @override
  State<UserCarrinho> createState() => _UserCarrinhoState();
}

PreferredSizeWidget _minhaBarra(String texto) {
  int cor = int.parse(restauranteCorSelecionado!);
  return AppBar(
    title: Text(texto,
        style: const TextStyle(
            color: Colors.white, fontFamily: 'Outfit', fontSize: 20)),
    backgroundColor: Color(cor),
    elevation: 0,
  );
}

class _UserCarrinhoState extends State<UserCarrinho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _minhaBarra("Minhas reservas"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              reservas(context),
            ],
          ),
        ));
  }
}
