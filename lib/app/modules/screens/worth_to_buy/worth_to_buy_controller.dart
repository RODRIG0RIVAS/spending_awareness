import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/share/animations/my_tweens.dart';
import 'package:spending_awareness/app/modules/share/database/local/local_database_repository.dart';

part 'worth_to_buy_controller.g.dart';

@Injectable()
class WorthToBuyController = _WorthToBuyControllerBase
    with _$WorthToBuyController;

abstract class _WorthToBuyControllerBase with Store {
  final RLocalDatabase _localDatabase;
  final MyTweens myTweens;

  TextEditingController howMuchTheItemCostsController = TextEditingController();
  TextEditingController howManyTimesAweekDoYouBuyItController =
      TextEditingController();

  @observable
  double dayWorth = 0.0;

  @observable
  double hourWorth = 0.0;

  @observable
  double mySalary = 0.0;

  @observable
  int daysInWeek = 0;

  @observable
  bool isReceiptMethodByMonth = true;

  @observable
  bool isLoading = true;

  @observable
  double itemCost = 0.0;

  _WorthToBuyControllerBase(this._localDatabase, this.myTweens) {
    start();
  }

  start() async {
    await _localDatabase.start().whenComplete(() {
      dayWorth = _localDatabase.dayWorth;
      hourWorth = _localDatabase.hourWorth;
      mySalary = _localDatabase.salary;
      isReceiptMethodByMonth = _localDatabase.isReceiptMethodByMonth;

      isLoading = !isLoading;
    });
  }

  @action
  Map<String, dynamic> getHowManyHoursHaveToWorkToBuyIt(
      double itemCost, double hourWorth) {
    double value = itemCost / hourWorth;

    int hours = value.truncate();
    int minutes = ((value - hours) * 60).truncate();

    return {"hours": hours, "minutes": minutes};
  }

  @action
  double getHowManyDaysHaveToWorkToBuyIt(double itemCost, double dayWorth) {
    return itemCost / dayWorth;
  }

  @action
  double getHowDoYouSpendInAweek(double itemCost, int daysInWeek) {
    return itemCost * daysInWeek;
  }
}
