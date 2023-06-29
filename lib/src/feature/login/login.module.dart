import 'package:app_comida/src/feature/login/view/page/login.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_comida/src/feature/login/viewmodel/login_viewmodel.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => LoginViewModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const LoginPage()),
      ];
}
