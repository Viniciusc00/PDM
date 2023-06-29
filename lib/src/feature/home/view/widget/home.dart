import 'package:flutter/material.dart';
import 'package:app_comida/src/component/prato_item.dart';

class UserHome extends StatefulWidget {
  final String email;
  final String nomeRestaurante;
  final int corRestaurante;
  UserHome(
      {super.key,
      required this.email,
      required this.nomeRestaurante,
      required this.corRestaurante});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  PreferredSizeWidget _minhaBarra(String texto) {
    return AppBar(
      title: Text(texto,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'PermanentMarker',
              fontSize: 37)),
      backgroundColor: Color(widget.corRestaurante),
      elevation: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _minhaBarra(widget.nomeRestaurante),
        body: SingleChildScrollView(
          child: Column(
            children: [
              pratosItem(context, widget.email, widget.nomeRestaurante,
                  widget.corRestaurante),
            ],
          ),
        ));
  }
}
