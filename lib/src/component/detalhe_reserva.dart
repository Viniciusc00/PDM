import 'package:app_comida/src/component/lista_restaurante.dart';
import 'package:app_comida/src/feature/home/view/page/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';

import '../feature/home/view/widget/restaurantes.dart';

// ignore: camel_case_types
class detalheReserva extends StatefulWidget {
  const detalheReserva({super.key});

  @override
  State<detalheReserva> createState() => _detalheReservaState();
}

// ignore: camel_case_types
class _detalheReservaState extends State<detalheReserva> {
  TextEditingController _observacaoController = TextEditingController();
  int _counterValue = 1;
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
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserRestaurante()),
            );
          },
        ),
        title: const Text(
          'Reserva',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Align(
          alignment: const AlignmentDirectional(0, -1),
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, -1),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x230F1113),
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mesas disponíveis:',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, -0.5),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  _mesasDisponiveis.toString(),
                                  style: const TextStyle(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 36,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Faça sua reserva',
                            style: TextStyle(
                                color: Color(0xff1d2429), fontSize: 28),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Em caso de alguma observação, escreva no campo abaixo',
                            style: TextStyle(
                                color: Color(0xff1d2429), fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.7, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 15, 8, 0),
                      child: SizedBox(
                        width: 250,
                        child: TextFormField(
                          controller: _observacaoController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Observação',
                            labelStyle: const TextStyle(
                                color: Color(0xff1d2429), fontSize: 12),
                            hintStyle: const TextStyle(
                                color: Color(0xff1d2429), fontSize: 12),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xff000000),
                                width: 0.8,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xff22282f),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xffe21c3d),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xffe21c3d),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          style: const TextStyle(
                              color: Color(0xff1d2429), fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Informe a quantidade de mesas:',
                            style: TextStyle(
                                color: Color(0xff1d2429), fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.8, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: const Color(0xfff1f4f8),
                          width: 0.8,
                        ),
                      ),
                      child: CounterButton(
                        loading: false,
                        onChange: (int val) {
                          setState(() {
                            // Enforce the minimum value of 1
                            _counterValue = val < 1 ? 1 : val;

                            // Enforce the maximum value of _mesasDisponiveis
                            if (_counterValue > _mesasDisponiveis) {
                              _counterValue = _mesasDisponiveis;
                            }
                          });
                        },
                        count: _counterValue,
                        countColor: Colors.red,
                        buttonColor: Colors.redAccent,
                        progressColor: Colors.redAccent,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final selectedTimestamp =
                          DateTime.parse('2023-06-26 18:00:00').toUtc();

                      final reservationData = {
                        'restaurante_nome': restauranteSelecionado,
                        'cliente_email': 'teste',
                        'qtd_mesas': _counterValue,
                        'data_e_horario': selectedTimestamp,
                        'observacao': _observacaoController.text,
                      };

                      try {
                        await FirebaseFirestore.instance
                            .collection('reserva')
                            .add(reservationData);
                        print('Reservation created successfully.');
                      } catch (error) {
                        print('Error creating reservation: $error');
                      }

                      // Navigate to the desired page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text('Confirmar a reserva'),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
