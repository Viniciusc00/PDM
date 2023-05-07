import 'package:flutter/material.dart';
import 'package:appComida/src/component/pratoItem.dart';
import 'package:appComida/assets/models/pratos.dart';
import 'package:http/http.dart' as http;
import 'package:appComida/src/feature/login/config_url.dart';
import 'dart:convert';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  List<Pratos> pratosList = [];

  Future<List<Pratos>> getPratos() async {
    final response = await http.get(Uri.parse(listar_pratos));
    var data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      for (Map i in data) {
        Pratos prato = Pratos(
            nome: i['nome'],
            descricao: i['descricao'],
            preco: i['preco'],
            imagem: i['imagem']);
        pratosList.add(prato);
        print(prato);
      }
      return pratosList;
    } else {
      return pratosList;
    }
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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _minhaBarra("Laricão"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              gerarListaComidas(pratosList),
            ],
          ),
        ));
  }
}
