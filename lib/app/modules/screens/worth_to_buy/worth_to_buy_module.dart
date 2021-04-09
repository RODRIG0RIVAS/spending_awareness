import 'package:spending_awareness/app/modules/share/animations/my_tweens.dart';
import 'package:spending_awareness/app/modules/share/database/local/local_database_repository.dart';

import 'worth_to_buy_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'worth_to_buy_page.dart';

class WorthToBuyModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) =>
            WorthToBuyController(i.get<RLocalDatabase>(), i.get<MyTweens>())),
        Bind((i) => RLocalDatabase()),
        Bind((i) => MyTweens())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => WorthToBuyPage()),
      ];

  static Inject get to => Inject<WorthToBuyModule>.of();
}
