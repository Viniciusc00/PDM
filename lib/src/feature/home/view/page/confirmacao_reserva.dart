import 'package:appComida/src/feature/home/view/page/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ConfirmaReserva extends StatefulWidget {
  const ConfirmaReserva({super.key});

  @override
  State<ConfirmaReserva> createState() => _ConfirmaReservaState();
}

class _ConfirmaReservaState extends State<ConfirmaReserva> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        
        backgroundColor: Color(0xffffffff),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                          padding: EdgeInsets.symmetric(vertical: 100),
                          
                        ),
              
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(44),
                                            child: Image.asset(
                                              'lib/assets/images/confirmacao.png',
                                              width: 150,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
              ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                  'Sua reserva foi feita com sucesso!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff1d2429), fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                ),
              Align(
                alignment: AlignmentDirectional(0, 0.6),
                child: TextButton(
                          onPressed: () {
                            
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() /*colocar o restaurante*/ ),);
                          
                          },
                          child: const Text('Ir para o cardápio'),
                           style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          )
              ),
            ],
          ),
        ),
      ),
    );
  }
}