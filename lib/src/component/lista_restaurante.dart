import 'package:app_comida/src/feature/home/view/widget/mesa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget restaurante(BuildContext context, String email) {
  return Column(
    children: [
      const Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 15, 0, 12),
            child: Text(
              'Selecione uma das opções abaixo:',
              style: TextStyle(color: Color(0xff1d2429), fontSize: 14),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
        child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('restaurante').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            final documents = snapshot.data!.docs;

            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final document = documents[index];
                final descricao = document['descricao'];
                final nome = document['nome'];
                final urlLogo = document['url_logo'];
                final cor_tema = document['cor_tema'];
                final endereco = document['endereco'];

                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                  child: Container(
                    width: 100,
                    height: 72,
                    decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0,
                          color: Color(0xfff1f4f8),
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: const Color(0xff616161f),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF22282f),
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  2, 2, 2, 2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(44),
                                child: Image.network(
                                  urlLogo,
                                  width: 44,
                                  height: 44,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 0, 0, 0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 4),
                                      child: Text(
                                        nome,
                                        style: const TextStyle(
                                            color: Color(0xff1d2429),
                                            fontSize: 16),
                                      ),
                                    ),
                                    Text(
                                      descricao,
                                      style: const TextStyle(
                                          color: Color(0xff1d2429),
                                          fontSize: 12),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2),
                                    ),
                                    Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 4),
                                        child: Text(
                                          endereco,
                                          style: const TextStyle(
                                              color: Color(0xff1d2429),
                                              fontSize: 12),
                                        )),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UserMesa(
                                          email: email,
                                          nomeRestaurante: nome,
                                          corRestaurante: int.parse(cor_tema!)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      const Divider(),
    ],
  );
}
