import 'package:flutter/material.dart';
import 'package:appComida/assets/repository/pratos_repository.dart';
import 'package:appComida/src/component/pratoItem.dart';


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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ]);
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


