import 'package:appComida/src/component/reserva_mesa.dart';
import 'package:flutter/material.dart';

class UserMesa extends StatefulWidget {
  const UserMesa({super.key});

  @override
  State<UserMesa> createState() => _UserMesaState();
}


class _UserMesaState extends State<UserMesa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          automaticallyImplyLeading: false,
          title: const Text(
            'Selecione um horário para sua reserva',
            style: TextStyle(color: Color(0xffffffff), fontSize: 20),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              reservaMesa(context),
            ],
          ),
        ));
  }
}
