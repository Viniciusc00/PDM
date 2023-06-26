import 'package:appComida/src/feature/home/view/widget/mesa.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports


  Widget restaurante(BuildContext context) {

    return Column(
    children: [
        const Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding:
                    EdgeInsetsDirectional.fromSTEB(16, 0, 0, 12),
                  child: Text(
                    'Selecione uma das opções abaixo:',
                    style: TextStyle(color: Color(0xff1d2429), fontSize: 14),
                    ),
                  ),
                ],
              ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  2, 2, 2, 2),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(44),
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
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            
                                            child: const Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 4),
                                                  child: Text(
                                                    'Restaurante Laricão',
                                                    style: TextStyle(color: Color(0xff1d2429), fontSize: 16),
                                                  ),
                                                ),
                                                Text(
                                                  'À La Carte',
                                                  style: TextStyle(color: Color(0xff1d2429), fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => const UserMesa() /*colocar o restaurante*/ ),);
                                             },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ] 
                        ),
                      ),
        const Divider(),
      ],
  );
    
  }

