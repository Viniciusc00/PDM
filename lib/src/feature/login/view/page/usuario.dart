import 'package:appComida/src/feature/login/view/page/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../home/view/page/detalheproduto.dart';

Widget itemUsuario(BuildContext context) {
  return Column(
    children: [
      ListView(
            children:  <Widget>[
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Gerenciar sua conta'),
                onTap: () { /*colocar pagina da conta*/ },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Ajuda'),
                onTap: () { /*colocar pagina de ajuda*/ },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),),
              ),
              
            ],
            scrollDirection: Axis.vertical,
            shrinkWrap: true,

          ),
        ]
      );
}