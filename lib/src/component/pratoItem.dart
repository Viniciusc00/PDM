import 'package:appComida/src/feature/home/view/page/detalheproduto.dart';
import 'package:flutter/material.dart';


Widget pratosItem(BuildContext context) {
    return Column(
      children: [
        ListTile(
            title: const Text('comida', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'sdouaboasdg',
                    style: TextStyle(fontSize: 13),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text(
                      '685198',
                      style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            leading: Image.asset("lib/assets/images/contrafile.png"),
            contentPadding: const EdgeInsets.all(15),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DetalheProduto()),);
            },
            
          ),
        const Divider(),
      ],
    );
  }