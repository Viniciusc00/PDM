import 'package:app_comida/src/component/lista_restaurante.dart';
import 'package:flutter/material.dart';
import 'package:app_comida/assets/repository/pratos_repository.dart';
import 'package:app_comida/src/component/prato_item.dart';

class UserHome extends StatefulWidget {
  UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int cor = int.parse(restauranteCorSelecionado!);

  final pratos = PratosRepository.prato;

  PreferredSizeWidget _minhaBarra(String texto) {
    return AppBar(
      title: Text(texto,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'PermanentMarker',
              fontSize: 37)),
      backgroundColor: Color(cor),
      elevation: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _minhaBarra(restauranteSelecionado!),
        body: SingleChildScrollView(
          child: Column(
            children: [
              pratosItem(context),
            ],
          ),
        ));
  }
}
