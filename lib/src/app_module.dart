import 'package:appComida/src/feature/login/login.module.dart';
import 'package:appComida/src/feature/onboarding/onboarding_module.dart';
import 'package:appComida/src/main.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appComida/src/feature/onboarding/view/page/onboarding_page.dart';
import 'feature/home/home_module.dart';


class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: seenOnboard == true ? LoginModule() : OnboardingModule()),
      ];
}
