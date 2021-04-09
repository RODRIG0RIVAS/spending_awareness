import 'package:spending_awareness/app/modules/share/animations/my_tweens.dart';
import 'package:spending_awareness/app/modules/share/database/local/local_database_repository.dart';
import 'package:spending_awareness/app/modules/share/my_fonts/my_fonts_size.dart';

import 'credit_cart_impact_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'credit_cart_impact_page.dart';

class CreditCartImpactModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $CreditCartImpactController,
        Bind((i) => MyFontsSize()),
        Bind((i) => MyTweens()),
        Bind((i) => RLocalDatabase())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CreditCartImpactPage()),
      ];

  static Inject get to => Inject<CreditCartImpactModule>.of();
}
