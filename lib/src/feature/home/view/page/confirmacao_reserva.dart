import 'package:flutter/material.dart';
import '../widget/historico_reserva.dart';

class ConfirmaReserva extends StatefulWidget {
  final String email;
  final String nomeRestaurante;
  final int corRestaurante;
  ConfirmaReserva(
      {super.key,
      required this.email,
      required this.nomeRestaurante,
      required this.corRestaurante});

  @override
  State<ConfirmaReserva> createState() => _ConfirmaReservaState();
}

class _ConfirmaReservaState extends State<ConfirmaReserva> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 100),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(44),
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
              const Align(
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
                  alignment: const AlignmentDirectional(0, 0.6),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserCarrinho(
                                email: widget.email,
                                nomeRestaurante: widget.nomeRestaurante,
                                corRestaurante: widget
                                    .corRestaurante) /*colocar o restaurante*/),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(widget.corRestaurante),
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text('Ver minhas reversas'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
