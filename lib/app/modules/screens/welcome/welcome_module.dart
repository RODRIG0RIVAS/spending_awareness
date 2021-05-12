import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/screens/welcome/welcome_controller.dart';
import 'package:spending_awareness/app/modules/screens/welcome/welcome_page.dart';

class WelcomeModule extends ChildModule {
  @override
  final List<Bind> binds = [
    $WelcomeController,
  ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => WelcomePage()),
      ];
}
