import 'package:flutter/material.dart';
import 'package:app_comida/assets/repository/pratos_repository.dart';
import 'package:app_comida/src/component/prato_item.dart';

class UserHome extends StatelessWidget {
  UserHome({super.key});

  final pratos = PratosRepository.prato;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _minhaBarra("Laricão"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              pratosItem(context),
            ],
          ),
        ));
  }
}
