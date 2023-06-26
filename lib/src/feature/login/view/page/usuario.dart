import 'package:appComida/src/feature/login/view/page/login.dart';
import 'package:flutter/material.dart';


Widget itemUsuario(BuildContext context) {
  return Column(
    children: [
      ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children:  <Widget>[
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Gerenciar sua conta'),
                onTap: () { /*colocar pagina da conta*/ },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Ajuda'),
                onTap: () { /*colocar pagina de ajuda*/ },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()),),
              ),
              
            ],

          ),
        ]
      );
}