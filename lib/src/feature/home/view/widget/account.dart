import 'package:flutter/material.dart';

import '../../../../component/lista_restaurante.dart';
import '../../../login/view/page/usuario.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

PreferredSizeWidget _minhaBarra(String texto) {
  int cor = int.parse(restauranteCorSelecionado!);
  return AppBar(
    title: Text(texto,
        style: const TextStyle(
            color: Colors.white, fontFamily: 'PermanentMarker', fontSize: 37)),
    backgroundColor: Color(cor),
    elevation: 0,
  );
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _minhaBarra("Laricão"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              itemUsuario(context),
            ],
          ),
        ));
  }
}
