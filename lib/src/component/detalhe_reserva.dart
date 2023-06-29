import 'package:app_comida/src/feature/home/view/page/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';

import '../feature/home/view/widget/restaurantes.dart';

// ignore: camel_case_types
class detalheReserva extends StatefulWidget {
  final String email;
  final String nomeRestaurante;
  final int corRestaurante;
  detalheReserva(
      {super.key,
      required this.email,
      required this.nomeRestaurante,
      required this.corRestaurante});

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
          .doc(widget.nomeRestaurante)
          .get();

      final data = snapshot.data();
      final reservaSnapshot = await FirebaseFirestore.instance
          .collection('reserva')
          .where('cliente_email', isEqualTo: widget.email)
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

  Future<void> refreshData() async {
    setState(() {
      _counterValue = 1;
      _observacaoController.clear();
    });
    await fetchMesasDisponiveis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(widget.corRestaurante),
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
              MaterialPageRoute(
                  builder: (context) => UserRestaurante(email: widget.email)),
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: refreshData,
          ),
        ],
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
                    decoration: BoxDecoration(
                      color: Color(widget.corRestaurante),
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
                          style:
                              TextStyle(color: Color(0xff1d2429), fontSize: 28),
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
                          style:
                              TextStyle(color: Color(0xff1d2429), fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.7, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 15, 8, 0),
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
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: const TextStyle(
                            color: Color(0xff1d2429), fontSize: 16),
                        keyboardType: TextInputType.text,
                        maxLines: null,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Quantidade de Mesas',
                          style:
                              TextStyle(color: Color(0xff1d2429), fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
                      countColor: Color(widget.corRestaurante),
                      buttonColor: Color(widget.corRestaurante),
                      progressColor: Color(widget.corRestaurante),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 16),
                  child: TextButton(
                    onPressed: () async {
                      final selectedTimestamp =
                          DateTime.parse('2023-06-26 18:00:00').toUtc();
                      final doc_id = [
                        widget.nomeRestaurante,
                        widget.email,
                        selectedTimestamp.toString()
                      ].join('|');

                      final reservationData = {
                        'restaurante_nome': widget.nomeRestaurante,
                        'cliente_email': widget.email,
                        'qtd_mesas': _counterValue,
                        'data_e_horario': selectedTimestamp,
                        'observacao': _observacaoController.text,
                      };

                      try {
                        final collectionRef =
                            FirebaseFirestore.instance.collection('reserva');
                        await collectionRef
                            .doc(doc_id)
                            .set(reservationData, SetOptions(merge: true));
                        print('Reservation created or updated successfully.');
                      } catch (error) {
                        print('Error creating or updating reservation: $error');
                      }

                      // Navigate to the desired page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                email: widget.email,
                                nomeRestaurante: widget.nomeRestaurante,
                                corRestaurante: widget.corRestaurante)),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(widget.corRestaurante),
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text('Confirmar a reserva'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
