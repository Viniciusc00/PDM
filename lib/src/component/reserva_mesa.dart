import 'package:appComida/src/component/detalhe_reserva.dart';
import 'package:appComida/src/feature/home/view/page/homepage.dart';
import 'package:flutter/material.dart';

Widget reservaMesa(BuildContext context){
  return Column(
    children: [
        ListTile(
            title: Text('18:00', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '5 mesas disponíveis para o horário',
                    style: TextStyle(fontSize: 15, color: Colors.black,),
                  ),
                  
                ],
              ),
            ),
            leading: Icon(Icons.check_circle, color: Color.fromARGB(255, 43, 255, 0)),
            contentPadding: EdgeInsets.all(15),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => detalheReserva() /*colocar o restaurante*/ ),);
            },
            
          ),
        Divider(),
      ],
  );
}