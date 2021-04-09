// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worth_to_buy_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $WorthToBuyController = BindInject(
  (i) => WorthToBuyController(i<RLocalDatabase>(), i<MyTweens>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorthToBuyController on _WorthToBuyControllerBase, Store {
  final _$dayWorthAtom = Atom(name: '_WorthToBuyControllerBase.dayWorth');

  @override
  double get dayWorth {
    _$dayWorthAtom.reportRead();
    return super.dayWorth;
  }

  @override
  set dayWorth(double value) {
    _$dayWorthAtom.reportWrite(value, super.dayWorth, () {
      super.dayWorth = value;
    });
  }

  final _$hourWorthAtom = Atom(name: '_WorthToBuyControllerBase.hourWorth');

  @override
  double get hourWorth {
    _$hourWorthAtom.reportRead();
    return super.hourWorth;
  }

  @override
  set hourWorth(double value) {
    _$hourWorthAtom.reportWrite(value, super.hourWorth, () {
      super.hourWorth = value;
    });
  }

  final _$mySalaryAtom = Atom(name: '_WorthToBuyControllerBase.mySalary');

  @override
  double get mySalary {
    _$mySalaryAtom.reportRead();
    return super.mySalary;
  }

  @override
  set mySalary(double value) {
    _$mySalaryAtom.reportWrite(value, super.mySalary, () {
      super.mySalary = value;
    });
  }

  final _$daysInWeekAtom = Atom(name: '_WorthToBuyControllerBase.daysInWeek');

  @override
  int get daysInWeek {
    _$daysInWeekAtom.reportRead();
    return super.daysInWeek;
  }

  @override
  set daysInWeek(int value) {
    _$daysInWeekAtom.reportWrite(value, super.daysInWeek, () {
      super.daysInWeek = value;
    });
  }

  final _$isReceiptMethodByMonthAtom =
      Atom(name: '_WorthToBuyControllerBase.isReceiptMethodByMonth');

  @override
  bool get isReceiptMethodByMonth {
    _$isReceiptMethodByMonthAtom.reportRead();
    return super.isReceiptMethodByMonth;
  }

  @override
  set isReceiptMethodByMonth(bool value) {
    _$isReceiptMethodByMonthAtom
        .reportWrite(value, super.isReceiptMethodByMonth, () {
      super.isReceiptMethodByMonth = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_WorthToBuyControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$itemCostAtom = Atom(name: '_WorthToBuyControllerBase.itemCost');

  @override
  double get itemCost {
    _$itemCostAtom.reportRead();
    return super.itemCost;
  }

  @override
  set itemCost(double value) {
    _$itemCostAtom.reportWrite(value, super.itemCost, () {
      super.itemCost = value;
    });
  }

  final _$_WorthToBuyControllerBaseActionController =
      ActionController(name: '_WorthToBuyControllerBase');

  @override
  Map<String, dynamic> getHowManyHoursHaveToWorkToBuyIt(
      double itemCost, double hourWorth) {
    final _$actionInfo =
        _$_WorthToBuyControllerBaseActionController.startAction(
            name: '_WorthToBuyControllerBase.getHowManyHoursHaveToWorkToBuyIt');
    try {
      return super.getHowManyHoursHaveToWorkToBuyIt(itemCost, hourWorth);
    } finally {
      _$_WorthToBuyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double getHowManyDaysHaveToWorkToBuyIt(double itemCost, double dayWorth) {
    final _$actionInfo =
        _$_WorthToBuyControllerBaseActionController.startAction(
            name: '_WorthToBuyControllerBase.getHowManyDaysHaveToWorkToBuyIt');
    try {
      return super.getHowManyDaysHaveToWorkToBuyIt(itemCost, dayWorth);
    } finally {
      _$_WorthToBuyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double getHowDoYouSpendInAweek(double itemCost, int daysInWeek) {
    final _$actionInfo = _$_WorthToBuyControllerBaseActionController
        .startAction(name: '_WorthToBuyControllerBase.getHowDoYouSpendInAweek');
    try {
      return super.getHowDoYouSpendInAweek(itemCost, daysInWeek);
    } finally {
      _$_WorthToBuyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dayWorth: ${dayWorth},
hourWorth: ${hourWorth},
mySalary: ${mySalary},
daysInWeek: ${daysInWeek},
isReceiptMethodByMonth: ${isReceiptMethodByMonth},
isLoading: ${isLoading},
itemCost: ${itemCost}
    ''';
  }
}
