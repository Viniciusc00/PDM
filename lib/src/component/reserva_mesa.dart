import 'package:app_comida/src/component/detalhe_reserva.dart';
import 'package:flutter/material.dart';

Widget reservaMesa(BuildContext context) {
  return Column(
    children: [
      ListTile(
        title:
            const Text('18:00', style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '5 mesas disponíveis para o horário',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        leading: const Icon(Icons.check_circle,
            color: Color.fromARGB(255, 43, 255, 0)),
        contentPadding: const EdgeInsets.all(15),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const detalheReserva() /*colocar o restaurante*/),
          );
        },
      ),
      const Divider(),
    ],
  );
}
