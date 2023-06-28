import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget reservas(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
        child: Text(
          'Este é o histórico de suas últimas reservas:',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Color(0xFF606A85),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('reserva')
              .where('cliente_email', isEqualTo: 'teste')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            final reservas = snapshot.data?.docs ?? [];

            return Column(
              mainAxisSize: MainAxisSize.max,
              children: reservas.map((reserva) {
                final data = reserva.data() as Map<String, dynamic>;
                final qtdMesas = data['qtd_mesas'] as int?;
                final restauranteNome = data['restaurante_nome'] as String?;
                final dataEHora =
                    (data['data_e_horario'] as Timestamp?)?.toDate();
                final formattedDataEHora = dataEHora != null
                    ? DateFormat('dd/MM/yyyy HH:mm').format(dataEHora)
                    : '';

                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12, 12, 12, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: const Color(0x4D9489F5),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF6F61EF),
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    2, 2, 2, 2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.asset(
                                    'lib/assets/images/login_imagens/L.png',
                                    width: 44,
                                    height: 44,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Restaurante ${restauranteNome ?? ''}',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF15161E),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Text(
                                        'R\$ 257,98 ${qtdMesas ?? 0} Mesa(s)',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF606A85),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                          child: Text(
                                            formattedDataEHora,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF606A85),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
      const Divider(
        height: 1,
        thickness: 1,
        color: Color(0xFFE5E7EB),
      ),
    ],
  );
}
