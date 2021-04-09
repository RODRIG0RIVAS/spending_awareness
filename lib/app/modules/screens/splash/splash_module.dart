import 'package:spending_awareness/app/modules/share/animations/my_tweens.dart';
import 'package:spending_awareness/app/modules/share/database/local/local_database_repository.dart';

import 'splash_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'splash_page.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) =>
            SplashController(i.get<RLocalDatabase>(), i.get<MyTweens>())),
        Bind((i) => RLocalDatabase()),
        Bind((i) => MyTweens())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashPage()),
      ];

  static Inject get to => Inject<SplashModule>.of();
}
