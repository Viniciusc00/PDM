import 'package:appComida/src/feature/login/login.module.dart';
import 'package:appComida/src/feature/onboarding/onboarding_module.dart';
import 'package:appComida/src/main.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: seenOnboard == true ? LoginModule() : OnboardingModule()),
      ];
}
