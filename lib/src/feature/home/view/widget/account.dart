import 'package:flutter/material.dart';

import '../../../login/view/page/usuario.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

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
