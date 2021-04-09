import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/share/animations/my_tweens.dart';
import 'package:spending_awareness/app/modules/share/database/local/local_database_repository.dart';
import 'package:spending_awareness/app/modules/share/router_names/my_router_names.dart';

part 'put_salary_controller.g.dart';

@Injectable()
class PutSalaryController = _PutSalaryControllerBase with _$PutSalaryController;

abstract class _PutSalaryControllerBase with Store {
  final RLocalDatabase _localDatabase;
  final MyTweens myTweens;

  _PutSalaryControllerBase(this._localDatabase, this.myTweens) {
    start();
  }

  start() async {
    await _localDatabase.start();
  }

  void putSalaryInDatabase(double value) {
    print("VALOR DO SALARIO: $value");
    _localDatabase.putSalary(value);
    _localDatabase.putHourWorth(
        (value / _localDatabase.daysInPeriod) / _localDatabase.hoursInDay);
    _localDatabase.putDayWorth(value / _localDatabase.daysInPeriod);
    _localDatabase.putYearWorth(value * 12);
  }

  void isReceiptMethodByMonth(bool value) {
    _localDatabase.putIsReceiptMethodByMonth(value);
  }

  void goToHome() {
    Modular.to.pushReplacementNamed(MyRouterNames.home);
  }
}
