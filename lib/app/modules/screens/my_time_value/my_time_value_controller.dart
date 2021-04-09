import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/share/animations/my_tweens.dart';
import 'package:spending_awareness/app/modules/share/database/local/local_database_repository.dart';
import 'package:spending_awareness/app/modules/share/my_fonts/my_fonts_size.dart';
import 'package:spending_awareness/app/modules/share/router_names/my_router_names.dart';

part 'my_time_value_controller.g.dart';

@Injectable()
class MyTimeValueController = _MyTimeValueControllerBase
    with _$MyTimeValueController;

abstract class _MyTimeValueControllerBase with Store {
  final MyFontsSize myFontsSize;
  final RLocalDatabase _localDatabase;
  final MyTweens myTweens;

  @observable
  TextEditingController hoursWorkedInAdayController = TextEditingController();

  @observable
  TextEditingController daysInPeriodController = TextEditingController();

  @observable
  double mySalary = 0.0;

  @observable
  double hourWorth = 0.0;

  @observable
  double dayWorth = 0.0;

  @observable
  double yearWorth = 0.0;

  @observable
  int hours = 0;

  @observable
  int days = 0;

  @observable
  double myHourWorth = 0.0;

  @observable
  bool isLoading = true;

  @observable
  bool isTimeValueSetted = false;

  @observable
  bool isReceiptMethodByMonth;

  _MyTimeValueControllerBase(
      this.myFontsSize, this._localDatabase, this.myTweens) {
    start();
  }

  start() async {
    await _localDatabase.start().whenComplete(() {
      isReceiptMethodByMonth = _localDatabase.isReceiptMethodByMonth;
      days = _localDatabase.daysInPeriod;
      hours = _localDatabase.hoursInDay;

      daysInPeriodController.text = days.toString();
      hoursWorkedInAdayController.text = hours.toString();

      hourWorth = _localDatabase.hourWorth;
      dayWorth = _localDatabase.dayWorth;
      yearWorth = _localDatabase.yearWorth;

      mySalary = _localDatabase.salary;

      isTimeValueSetted = _localDatabase.isTimeValueSetted;

      isLoading = !isLoading;
    });
  }

  @action
  double getYearWorth(double salary) {
    return salary * 12;
  }

  @action
  double getHourWorth(double salary, int days, int hoursInAday) {
    if (salary == 0 || days == 0 || hoursInAday == 0) {
      return 0.0;
    }
    return (salary / days) / hoursInAday;
  }

  @action
  double getDayWorth(double salary, int days) {
    if (salary == 0 || days == 0) {
      return 0.0;
    }
    return salary / days;
  }

  @action
  void saveStats(
      {double yearWorth,
      double hourWorth,
      double dayWorth,
      int hoursInPeriod}) {
    _localDatabase.putHoursInDay(int.parse(hoursWorkedInAdayController.text));
    _localDatabase.putDaysInPeriod(int.parse(daysInPeriodController.text));
    _localDatabase.putHoursInPeriod(hoursInPeriod);

    _localDatabase.putYearWorth(yearWorth);
    _localDatabase.putDayWorth(dayWorth);
    _localDatabase.putHourWorth(hourWorth);

    _localDatabase.putIsTimeValueSetted(true);

    Modular.to.pushReplacementNamed(MyRouterNames.home);
  }
}
