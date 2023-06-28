import 'package:app_comida/src/component/lista_restaurante.dart';
import 'package:app_comida/src/component/reserva_mesa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserMesa extends StatefulWidget {
  const UserMesa({super.key});

  @override
  State<UserMesa> createState() => _UserMesaState();
}

PreferredSizeWidget _minhaBarra(String texto) {
  int cor = int.parse(restauranteCorSelecionado!);
  return AppBar(
    title: Text(texto,
        style: const TextStyle(
            color: Colors.white, fontFamily: 'Outfit', fontSize: 20)),
    backgroundColor: Color(cor),
    elevation: 0,
  );
}

class _UserMesaState extends State<UserMesa> {
  int _mesasDisponiveis = 0;

  @override
  void initState() {
    super.initState();
    fetchMesasDisponiveis();
  }

  Future<void> fetchMesasDisponiveis() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('restaurante')
          .doc(restauranteSelecionado)
          .get();

      final data = snapshot.data();
      final reservaSnapshot = await FirebaseFirestore.instance
          .collection('reserva')
          .where('cliente_email', isEqualTo: 'teste')
          .where('restaurante_nome', isEqualTo: restauranteSelecionado)
          .get();

      int sum = 0;
      for (final doc in reservaSnapshot.docs) {
        final data = doc.data();
        final qtdMesas = data['qtd_mesas'] as int?;
        if (qtdMesas != null) {
          sum += qtdMesas;
        }
      }
      setState(() {
        _mesasDisponiveis = (data?['capacidade'] as int?) ?? 0;
        _mesasDisponiveis = _mesasDisponiveis - sum;
      });
    } catch (error) {
      print('Error retrieving capacidade: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _minhaBarra('Selecione o horario da reserva'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              reservaMesa(context, _mesasDisponiveis),
            ],
          ),
        ));
  }
}
