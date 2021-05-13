import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/share/animations/my_tweens.dart';
import 'package:spending_awareness/app/modules/share/database/local/local_database_repository.dart';
import 'package:spending_awareness/app/modules/share/router_names/my_router_names.dart';

part 'splash_controller.g.dart';

@Injectable()
class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final RLocalDatabase _localDatabase;
  final MyTweens myTweens;

  @observable
  bool startToUp = false;

  _SplashControllerBase(this._localDatabase, this.myTweens) {
    start();
  }

  @action
  start() async {
    awaiter();
    await _localDatabase.start().whenComplete(() async {
      await Future.delayed(Duration(milliseconds: 1000)).whenComplete(() {
        if (_localDatabase.firstExecution || (_localDatabase.salary == 0.0)) {
          _localDatabase.putFirstExecution(false);
          Modular.to.pushReplacementNamed(MyRouterNames.welcome);
        } else {
          Modular.to.pushReplacementNamed(MyRouterNames.home);
        }
      });
    });
  }

  @action
  awaiter() async {
    await Future.delayed(Duration(milliseconds: 800)).whenComplete(() {
      startToUp = true;
    });
  }
}
