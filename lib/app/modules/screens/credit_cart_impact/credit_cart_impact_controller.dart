import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/share/animations/my_tweens.dart';
import 'package:spending_awareness/app/modules/share/database/local/local_database_repository.dart';
import 'package:spending_awareness/app/modules/share/my_fonts/my_fonts_size.dart';

part 'credit_cart_impact_controller.g.dart';

@Injectable()
class CreditCartImpactController = _CreditCartImpactControllerBase
    with _$CreditCartImpactController;

abstract class _CreditCartImpactControllerBase with Store {
  final MyFontsSize myFontsSize;
  final RLocalDatabase _localDatabase;
  final MyTweens myTweens;

  @observable
  TextEditingController howMuchIsTheInstallmentController =
      TextEditingController();

  @observable
  TextEditingController howManyInstallmentsController = TextEditingController();

  @observable
  double mySalary = 0.0;

  @observable
  double hourWorth = 0.0;

  @observable
  double dayWorth = 0.0;

  @observable
  double yearWorth = 0.0;

  @observable
  double installmentCost = 0.0;

  @observable
  int hours = 0;

  @observable
  int days = 0;

  @observable
  int months = 0;

  @observable
  int installmentCount = 0;

  @observable
  double myHourWorth = 0.0;

  @observable
  bool isLoading = true;

  @observable
  bool isReceiptMethodByMonth;

  _CreditCartImpactControllerBase(
      this.myFontsSize, this._localDatabase, this.myTweens) {
    start();
  }

  start() async {
    await _localDatabase.start().whenComplete(() {
      isReceiptMethodByMonth = _localDatabase.isReceiptMethodByMonth;
      days = _localDatabase.daysInPeriod;
      hours = _localDatabase.hoursInDay;

      hourWorth = _localDatabase.hourWorth;
      dayWorth = _localDatabase.dayWorth;
      yearWorth = _localDatabase.yearWorth;

      mySalary = _localDatabase.salary;

      isLoading = !isLoading;
    });
  }

  double salaryInNextMonths(double mySalary, double installment) {
    return mySalary - installment;
  }

  double totalCostOfInstallment(double installmentCost, int installmentPeriod) {
    return installmentCost * installmentPeriod;
  }

  @action
  double getHowManyDaysHaveToWorkToBuyIt(double itemCost, double dayWorth) {
    return itemCost / dayWorth;
  }

  @action
  double getHowDoYouSpendInAweek(double itemCost, int daysInWeek) {
    return itemCost * daysInWeek;
  }

  @action
  Map<String, dynamic> getHowManyHoursHaveToWorkToBuyIt(
      double itemCost, double hourWorth) {
    double value = itemCost / hourWorth;

    int hours = value.truncate();
    int minutes = ((value - hours) * 60).truncate();

    return {"hours": hours, "minutes": minutes};
  }
}
