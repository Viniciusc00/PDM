import 'package:appComida/src/component/lista_restaurante.dart';
import 'package:flutter/material.dart';

class UserRestaurante extends StatefulWidget {
  const UserRestaurante({super.key});

  @override
  State<UserRestaurante> createState() => _UserRestauranteState();
}


class _UserRestauranteState extends State<UserRestaurante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffffffff),
          automaticallyImplyLeading: false,
          title: const Text(
            'Restaurantes ',
            style: TextStyle(color: Color(0xff1d2429), fontSize: 28),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              restaurante(context),
            ],
          ),
        ));
  }
}
