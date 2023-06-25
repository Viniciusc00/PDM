import 'package:appComida/src/component/reserva_mesa.dart';
import 'package:appComida/src/feature/home/view/page/homepage.dart';
import 'package:appComida/src/feature/home/view/widget/home.dart';
import 'package:appComida/src/feature/home/view/widget/mesa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';


  Widget restaurante(BuildContext context) {

    return Column(
    children: [
        Row(
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                              child: Container(
                                width: 100,
                                height: 72,
                                decoration: BoxDecoration(
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF616161f),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0xFF22282f),
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            
                                            child: Column(
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
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => UserMesa() /*colocar o restaurante*/ ),);
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
        Divider(),
      ],
  );
    
  }

