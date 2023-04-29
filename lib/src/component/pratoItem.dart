import 'package:flutter/material.dart';
import 'package:appComida/assets/repository/pratos_repository.dart';
import '../../assets/models/pratos.dart';

final pratos = PratosRepository.prato;

 gerarListaComidas(List<Pratos> pratos) {
    return Column(
      children: pratos.map((comida) => pratosItem(comida)).toList(),
    );
  }

Widget pratosItem(Pratos comida) {
    return Column(
      children: [
        ListTile(
          title: Text(comida.nome),
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
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          trailing: Image.network(comida.imagem),
          contentPadding: EdgeInsets.all(15),
        ),
        Divider(),
      ],
    );
  }