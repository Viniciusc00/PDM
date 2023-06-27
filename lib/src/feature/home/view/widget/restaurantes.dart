import 'package:app_comida/src/component/lista_restaurante.dart';
import 'package:flutter/material.dart';

class UserRestaurante extends StatefulWidget {
  const UserRestaurante({super.key});

  @override
  State<UserRestaurante> createState() => _UserRestauranteState();
}

PreferredSizeWidget _minhaBarra(String texto) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(texto,
        style: const TextStyle(
            color: Colors.white, fontFamily: 'Outfit', fontSize: 20)),
    backgroundColor: Colors.red,
    elevation: 0,
  );
}

class _UserRestauranteState extends State<UserRestaurante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _minhaBarra('Restaurantes'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              restaurante(context),
            ],
          ),
        ));
  }
}
