import 'package:app_comida/src/component/lista_restaurante.dart';
import 'package:flutter/material.dart';

class UserRestaurante extends StatelessWidget {
  final String email; // Add a parameter to receive the email

  const UserRestaurante({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the email value directly
    print('Email from File 1: $email');

    return Scaffold(
      appBar: _minhaBarra('Restaurantes'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            restaurante(context, email),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _minhaBarra(String texto) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(texto,
          style: const TextStyle(
              color: Colors.white, fontFamily: 'Outfit', fontSize: 20)),
      backgroundColor: Colors.red,
      elevation: 0,
    );
  }
}
