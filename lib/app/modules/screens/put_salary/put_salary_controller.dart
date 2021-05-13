import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/share/animations/my_tweens.dart';
import 'package:spending_awareness/app/modules/share/database/local/local_database_repository.dart';
import 'package:spending_awareness/app/modules/share/router_names/my_router_names.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:spending_awareness/generated/l10n.dart';

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
    _localDatabase.putSalary(value);
    _localDatabase.putHourWorth(
        (value / _localDatabase.daysInPeriod) / _localDatabase.hoursInDay);
    _localDatabase.putDayWorth(value / _localDatabase.daysInPeriod);
    _localDatabase.putYearWorth(value * 12);
  }

  /*
  
    The line:
    _localDatabase.putIsReceiptMethodByMonth(value);

    Is not at first in the method, because is an condition in the "else"
    of the first condition.

   */

  void isReceiptMethodByMonth(bool value) {
    if (_localDatabase.firstExecution) {
      _localDatabase.putFirstExecution(false);

      _localDatabase.putIsReceiptMethodByMonth(value);

      asuka.showDialog(
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text(
            S.of(context).lbl_addTimeWorth,
            textAlign: TextAlign.center,
          ),
          content: Text(
            S.of(context).lbl_addTimeWorthContent,
            textAlign: TextAlign.justify,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          actions: [
            IconButton(
              icon: Icon(Icons.done_outlined),
              onPressed: () {
                Navigator.pop(context);
                Modular.to.pushReplacementNamed(MyRouterNames.myTimeValue,
                    arguments: _localDatabase.salary);
              },
            )
          ],
        ),
      );
    } else {
      if (_localDatabase.isReceiptMethodByMonth != value) {
        _localDatabase.putHourWorth(0.0);
        _localDatabase.putDayWorth(0.0);
        _localDatabase.putYearWorth(0.0);
        _localDatabase.putHoursInDay(0);
        _localDatabase.putDaysInPeriod(0);
        _localDatabase.putIsTimeValueSetted(false);

        _localDatabase.putIsReceiptMethodByMonth(value);

        asuka.showDialog(
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: Text(
              S.of(context).lbl_changeTimeWorth,
              textAlign: TextAlign.center,
            ),
            content: Text(
              S.of(context).lbl_changeTimeWorthContent,
              textAlign: TextAlign.justify,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            actions: [
              IconButton(
                icon: Icon(Icons.done_outlined),
                onPressed: () {
                  Navigator.pop(context);
                  Modular.to.pushReplacementNamed(MyRouterNames.myTimeValue,
                      arguments: _localDatabase.salary);
                },
              )
            ],
          ),
        );
      } else {
        _localDatabase.putIsReceiptMethodByMonth(value);
      }
    }
  }

  void goToHome() {
    Modular.to.pushReplacementNamed(MyRouterNames.home);
  }
}
