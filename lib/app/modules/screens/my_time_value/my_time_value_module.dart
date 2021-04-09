import 'package:spending_awareness/app/modules/share/animations/my_tweens.dart';
import 'package:spending_awareness/app/modules/share/database/local/local_database_repository.dart';
import 'package:spending_awareness/app/modules/share/my_fonts/my_fonts_size.dart';

import 'my_time_value_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'my_time_value_page.dart';

class MyTimeValueModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MyTimeValueController(
            i.get<MyFontsSize>(), i.get<RLocalDatabase>(), i.get<MyTweens>())),
        Bind((i) => RLocalDatabase()),
        Bind((i) => MyFontsSize()),
        Bind((i) => MyTweens())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => MyTimeValuePage(mySalary: args.data)),
      ];

  static Inject get to => Inject<MyTimeValueModule>.of();
}
