import 'package:flutter/material.dart';
import '../../../login/view/page/usuario.dart';

class UserAccount extends StatefulWidget {
  final String email;
  final String nomeRestaurante;
  final int corRestaurante;
  UserAccount(
      {super.key,
      required this.email,
      required this.nomeRestaurante,
      required this.corRestaurante});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

PreferredSizeWidget _minhaBarra(String texto, int corRestaurante) {
  return AppBar(
    title: Text(texto,
        style: const TextStyle(
            color: Colors.white, fontFamily: 'PermanentMarker', fontSize: 37)),
    backgroundColor: Color(corRestaurante),
    elevation: 0,
  );
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _minhaBarra("Laricão", widget.corRestaurante),
        body: SingleChildScrollView(
          child: Column(
            children: [
              itemUsuario(context, widget.email, widget.nomeRestaurante,
                  widget.corRestaurante),
            ],
          ),
        ));
  }
}
