import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_comida/src/feature/home/view/page/homepage.dart';
import 'package:app_comida/src/feature/home/viewmodel/home_viewmodel.dart';

class HomeModule extends Module {
  final String email;
  final String nomeRestaurante;
  final int corRestaurante;
  HomeModule(
      {required this.email,
      required this.nomeRestaurante,
      required this.corRestaurante});
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => HomeViewModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (_, __) => HomePage(
                  email: this.email,
                  nomeRestaurante: this.nomeRestaurante,
                  corRestaurante: this.corRestaurante,
                )),
      ];
}
