import 'package:spending_awareness/app/modules/share/animations/my_tweens.dart';
import 'package:spending_awareness/app/modules/share/database/local/local_database_repository.dart';

import 'put_salary_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'put_salary_page.dart';

class PutSalaryModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $PutSalaryController,
        Bind((i) => RLocalDatabase()),
        Bind((i) => MyTweens()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => PutSalaryPage(isFirstExecution: args.data)),
      ];

  static Inject get to => Inject<PutSalaryModule>.of();
}
