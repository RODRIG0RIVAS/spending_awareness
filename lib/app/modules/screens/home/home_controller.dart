import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/share/animations/my_tweens.dart';
import 'package:spending_awareness/app/modules/share/database/local/local_database_repository.dart';
import 'package:spending_awareness/app/modules/share/my_fonts/my_fonts_size.dart';
import 'package:spending_awareness/app/modules/share/router_names/my_router_names.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final MyFontsSize myFontsSize;
  final RLocalDatabase _localDatabase;
  final MyTweens myTweens;

  @observable
  bool isReceiptMethodByMonth;

  @observable
  double mySalary;

  @observable
  bool isLoading = true;

  @observable
  bool isTimeValueSetted;

  _HomeControllerBase(this.myFontsSize, this._localDatabase, this.myTweens) {
    start();
  }

  void start() async {
    await _localDatabase.start().whenComplete(() {
      mySalary = _localDatabase.salary;
      isReceiptMethodByMonth = _localDatabase.isReceiptMethodByMonth;
      isTimeValueSetted = _localDatabase.isTimeValueSetted;

      isLoading = !isLoading;
    });
  }

  void openMyTimeValueScreen(double salaryValue) {
    Modular.to.pushReplacementNamed(MyRouterNames.myTimeValue,
        arguments: salaryValue);
  }

  void openWorthToBuyScreen() {
    Modular.to.pushReplacementNamed(MyRouterNames.worthToBuy);
  }

  void openCreditCardImpactScreen() {
    Modular.to
        .pushReplacementNamed(MyRouterNames.creditCardImpact, arguments: false);
  }
}
