import 'package:app_comida/src/component/reserva_mesa.dart';
import 'package:flutter/material.dart';

class UserMesa extends StatefulWidget {
  const UserMesa({super.key});

  @override
  State<UserMesa> createState() => _UserMesaState();
}

PreferredSizeWidget _minhaBarra(String texto) {
  return AppBar(
    title: Text(texto,
        style: const TextStyle(
            color: Colors.white, fontFamily: 'Outfit', fontSize: 20)),
    backgroundColor: Colors.red,
    elevation: 0,
  );
}

class _UserMesaState extends State<UserMesa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _minhaBarra('Selecione o horario da reserva'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              reservaMesa(context),
            ],
          ),
        ));
  }
}
