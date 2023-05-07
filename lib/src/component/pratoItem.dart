import 'package:flutter/material.dart';
import '../../assets/models/pratos.dart';
import 'package:http/http.dart' as http;
import 'package:appComida/src/feature/login/config_url.dart';
import 'dart:convert';

List<Pratos> pratosList = [];

Future<List<Pratos>> getPratos() async {
  final response = await http.get(Uri.parse(listar_pratos));
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    for (Map i in data) {
      Pratos prato = Pratos(
          nome: i['nome'],
          descricao: i['descricao'],
          preco: i['preco'],
          imagem: i['imagem']);
      pratosList.add(prato);
    }
    return pratosList;
  } else {
    return pratosList;
  }
}

gerarListaComidas(List<Pratos> pratos) {
  return Column(
    children: pratos.map((comida) => pratosItem(comida)).toList(),
  );
}

Widget pratosItem(Pratos comida) {
  return Column(
    children: [
      ListTile(
        title: Text(comida.nome, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comida.descricao,
                style: TextStyle(fontSize: 13),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24),
                child: Text(
                  comida.preco,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        leading: Image.network(comida.imagem),
        contentPadding: EdgeInsets.all(15),
      ),
      Divider(),
    ],
  );
}
