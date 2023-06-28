import 'dart:ui';
import 'package:app_comida/src/component/prato_item.dart';
import 'package:app_comida/src/feature/home/view/page/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetalheProduto extends StatefulWidget {
  final String email;
  final String nomeRestaurante;
  final int corRestaurante;
  DetalheProduto(
      {super.key,
      required this.email,
      required this.nomeRestaurante,
      required this.corRestaurante});

  @override
  State<DetalheProduto> createState() => _DetalheProdutoState();
}

class _DetalheProdutoState extends State<DetalheProduto> {
  Future addCarrinho() async {
    final docCliente = FirebaseFirestore.instance
        .collection('reserva')
        .doc([widget.nomeRestaurante, widget.email, '2023-06-26 18:00:00.000Z']
            .join('|'))
        .collection('carrinho')
        .doc(pratoNomeSelecionado);
    var json = {
      "nome": pratoNomeSelecionado,
      "valor": pratoValorSelecionado,
      "url": pratoImagemSelecionado,
      "quantidade": _counterValue
    };

    await docCliente.set(json);
  }

  int _counterValue = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(pratoImagemSelecionado!),
          ),
          buttonArrow(context),
          DraggableScrollableSheet(
              initialChildSize: 0.6,
              maxChildSize: 1.0,
              minChildSize: 0.6,
              builder: (context, scrollController) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 5,
                                width: 35,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          pratoNomeSelecionado!,
                          style: TextStyle(fontSize: 30),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          NumberFormat('### minutos', 'pt_BR')
                              .format(pratoTempSelecionado),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider(
                            height: 4,
                          ),
                        ),
                        const Text(
                          "Descrição",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          pratoDescricaoSelecionado!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider(
                            height: 4,
                          ),
                        ),
                        CounterButton(
                          loading: false,
                          onChange: (int val) {
                            setState(() {
                              _counterValue = val < 1 ? 1 : val;
                            });
                          },
                          count: _counterValue,
                          countColor: Color(widget.corRestaurante),
                          buttonColor: Color(widget.corRestaurante),
                          progressColor: Color(widget.corRestaurante),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider(
                            height: 4,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            addCarrinho();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(
                                        email: widget.email,
                                        nomeRestaurante: widget.nomeRestaurante,
                                        corRestaurante:
                                            widget.corRestaurante)));
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(widget.corRestaurante),
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: const Text('Adicionar ao Carrinho'),
                        )
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    ));
  }
}

buttonArrow(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ),
  );
}
