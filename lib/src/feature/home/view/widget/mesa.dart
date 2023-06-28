import 'package:app_comida/src/component/reserva_mesa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserMesa extends StatefulWidget {
  final String email;
  final String nomeRestaurante;
  final int corRestaurante;
  UserMesa(
      {super.key,
      required this.email,
      required this.nomeRestaurante,
      required this.corRestaurante});

  @override
  State<UserMesa> createState() => _UserMesaState();
}

PreferredSizeWidget _minhaBarra(String texto, int corRestaurante) {
  return AppBar(
    title: Text(texto,
        style: const TextStyle(
            color: Colors.white, fontFamily: 'Outfit', fontSize: 20)),
    backgroundColor: Color(corRestaurante),
    elevation: 0,
  );
}

class _UserMesaState extends State<UserMesa> {
  int _mesasDisponiveis = 0;

  @override
  void initState() {
    super.initState();
    fetchMesasDisponiveis(widget.email);
  }

  Future<void> fetchMesasDisponiveis(String email) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('restaurante')
          .doc(widget.nomeRestaurante)
          .get();

      final data = snapshot.data();
      final reservaSnapshot = await FirebaseFirestore.instance
          .collection('reserva')
          .where('cliente_email', isEqualTo: email)
          .where('restaurante_nome', isEqualTo: widget.nomeRestaurante)
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
        appBar: _minhaBarra(
            'Selecione o horario da reserva', widget.corRestaurante),
        body: SingleChildScrollView(
          child: Column(
            children: [
              reservaMesa(context, _mesasDisponiveis, widget.email,
                  widget.nomeRestaurante, widget.corRestaurante),
            ],
          ),
        ));
  }
}
