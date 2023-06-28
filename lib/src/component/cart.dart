import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../feature/home/view/page/pagamento.dart';

class ItemCarrinho extends StatefulWidget {
  @override
  _ItemCarrinhoState createState() => _ItemCarrinhoState();
}

PreferredSizeWidget _minhaBarra(String texto) {
  return AppBar(
    title: Text(texto,
        style: const TextStyle(
            color: Colors.white, fontFamily: 'Outfit', fontSize: 20)),
    backgroundColor: Colors.red,
    elevation: 0,
  );
}

class _ItemCarrinhoState extends State<ItemCarrinho> {
  int somatorio = 0;

  Future<int> somarValores() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('reserva')
        .doc('Panama|teste|2023-06-26 18:00:00.000Z')
        .collection('carrinho')
        .get();

    int total = 0;
    int multipicacao = 0; // valor x quantidade

    for (final doc in snapshot.docs) {
      final valor =
          doc['valor'] as int; // Supondo que o campo 'valor' seja do tipo int
      final quantidade = doc['quantidade'] as int;

      multipicacao = valor * quantidade;

      total += multipicacao;
    }

    return total;
  }

  void initState() {
    super.initState();
    somarValores();
    resultado();
  }

  void resultado() async {
    somatorio = await somarValores();
  }

  Future deleteCarrinho(final nome) async {
    final docCliente = FirebaseFirestore.instance
        .collection('reserva')
        .doc('Panama|teste|2023-06-26 18:00:00.000Z')
        .collection('carrinho')
        .doc(nome);

    await docCliente.delete();
  }

  Future<void> refreshData() async {
    setState(() {});
    await somarValores();
    resultado();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _minhaBarra("Carrinho"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('reserva')
                  .doc('Panama|teste|2023-06-26 18:00:00.000Z')
                  .collection('carrinho')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                final documents = snapshot.data!.docs;

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...documents.map((document) {
                        final url = document['url'];
                        final nome = document['nome'];
                        final valor = document['valor'];
                        final quantidade = document['quantidade'];
                        somarValores();
                        resultado();

                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 8, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x320E151B),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Hero(
                                    tag: 'ControllerImage',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        url,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child: Text(
                                              nome,
                                              style: TextStyle(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF0F1113),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            NumberFormat('R\$ ###0.00', 'pt_BR')
                                                .format(valor),
                                            style: TextStyle(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF57636C),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            NumberFormat('###x', 'pt_BR')
                                                .format(quantidade),
                                            style: TextStyle(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF57636C),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete_outline_rounded,
                                      color: Color(0xFFDE4C62),
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      deleteCarrinho(nome);
                                      somarValores();
                                      resultado();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    170, 0, 0, 0),
                                child: Text(
                                  'Valor total:',
                                  style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF0F1113),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 4, 24, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    130, 0, 20, 0),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.refresh,
                                        color: Colors.black,
                                      ),
                                      onPressed: refreshData,
                                    ),
                                    Text(
                                      NumberFormat('R\$ ###0.00', 'pt_BR')
                                          .format(somatorio),
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF0F1113),
                                        fontSize: 32,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PagamentoPage(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: const Text('Ir para o pagamento'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
