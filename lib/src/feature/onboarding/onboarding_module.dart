import 'package:app_comida/src/feature/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_comida/src/feature/onboarding/view/page/onboarding_page.dart';

class OnboardingModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => OnboardingViewModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const OnboardingPage()),
      ];
}
