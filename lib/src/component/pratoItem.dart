import 'package:appComida/src/feature/home/view/page/detalheproduto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'lista_restaurante.dart';

Widget pratosItem(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('restaurante').doc(restauranteSelecionado)
          .collection('pratos').snapshots(),
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
          final field1 = doc['nome'];
          final field2 = doc['descricao'];
          final field3 = doc['preco'];
          final field4 = doc['url_imagem'];

          return Column(
            children: [
              ListTile(
                title: Text(field1, style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        field2,
                        style: TextStyle(fontSize: 13),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Text(
                          field3,
                          style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                leading: Image.network(field4),
                contentPadding: const EdgeInsets.all(15),
                onTap: () {
                  print(restauranteSelecionado);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DetalheProduto()),
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
