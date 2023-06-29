import 'package:app_comida/src/component/detalhe_reserva.dart';
import 'package:flutter/material.dart';

Widget reservaMesa(BuildContext context, int mesasDisponiveis, String email,
    String nomeRestaurante, int corRestaurante) {
  final isDisponivel = mesasDisponiveis > 0;

  return Column(
    children: [
      ListTile(
        title: Text('18:00', style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$mesasDisponiveis mesas disponíveis para o horário',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        leading: Icon(
          isDisponivel ? Icons.check_circle : Icons.close,
          color: isDisponivel ? Color.fromARGB(255, 43, 255, 0) : Colors.grey,
        ),
        contentPadding: const EdgeInsets.all(15),
        onTap: isDisponivel
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => detalheReserva(
                            email: email,
                            nomeRestaurante: nomeRestaurante,
                            corRestaurante: corRestaurante,
                          )),
                );
              }
            : null,
      ),
      const Divider(),
    ],
  );
}
