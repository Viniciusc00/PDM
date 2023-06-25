import 'package:flutter/material.dart';

Widget reservas(BuildContext context){
  return Column(
    children: [
        ListTile(
            title: Text('Restaurante', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reserva para 4 pessoas',
                    style: TextStyle(fontSize: 15, color: Colors.black,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text(
                      'A mesa estrá pronta em 60 minutos',
                      style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            trailing: Icon(Icons.check_circle, color: Color.fromARGB(255, 43, 255, 0)),
            contentPadding: EdgeInsets.all(15),
            onTap: () {
              
            },
            
          ),
        Divider(),
      ],
  );
}