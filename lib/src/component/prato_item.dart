import 'dart:ffi';

import 'package:app_comida/src/feature/home/view/page/detalheproduto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'lista_restaurante.dart';

String ? pratoDescricaoSelecionado;
String ? pratoImagemSelecionado;
String ? pratoNomeSelecionado;
int pratoTempSelecionado = 0;
int pratoValorSelecionado = 0;

Widget pratosItem(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('restaurante')
        .doc(restauranteSelecionado)
        .collection('pratos')
        .snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }

      final documents = snapshot.data!.docs;

      return Column(
        children: documents.map((doc) {
          final nomePrato = doc['nome'];
          final descricaoPrato = doc['descricao'];
          final precoPrato = doc['valor'];
          final urlImagem = doc['url'];
          final tempPrato = doc['tempPrep'];

          return Column(
            children: [
              ListTile(
                title: Text(nomePrato,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        descricaoPrato,
                        style: const TextStyle(fontSize: 13),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Text(
                          NumberFormat('R\$ ###.00', 'pt_BR')
                              .format(precoPrato),
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                leading: Image.network(urlImagem,height: 70,width: 90,),
                contentPadding: const EdgeInsets.all(15),
                onTap: () {
                  print(restauranteSelecionado);

                  pratoNomeSelecionado = nomePrato;
                  pratoImagemSelecionado = urlImagem;
                  pratoDescricaoSelecionado = descricaoPrato;
                  pratoTempSelecionado = tempPrato;
                  pratoValorSelecionado = precoPrato;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetalheProduto()),
                  );
                },
              ),
              const Divider(),
            ],
          );
        }).toList(),
      );
    },
  );
}
