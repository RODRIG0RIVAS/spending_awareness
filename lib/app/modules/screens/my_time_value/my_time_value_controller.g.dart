// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_time_value_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MyTimeValueController = BindInject(
  (i) => MyTimeValueController(
      i<MyFontsSize>(), i<RLocalDatabase>(), i<MyTweens>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyTimeValueController on _MyTimeValueControllerBase, Store {
  final _$hoursWorkedInAdayControllerAtom =
      Atom(name: '_MyTimeValueControllerBase.hoursWorkedInAdayController');

  @override
  TextEditingController get hoursWorkedInAdayController {
    _$hoursWorkedInAdayControllerAtom.reportRead();
    return super.hoursWorkedInAdayController;
  }

  @override
  set hoursWorkedInAdayController(TextEditingController value) {
    _$hoursWorkedInAdayControllerAtom
        .reportWrite(value, super.hoursWorkedInAdayController, () {
      super.hoursWorkedInAdayController = value;
    });
  }

  final _$daysInPeriodControllerAtom =
      Atom(name: '_MyTimeValueControllerBase.daysInPeriodController');

  @override
  TextEditingController get daysInPeriodController {
    _$daysInPeriodControllerAtom.reportRead();
    return super.daysInPeriodController;
  }

  @override
  set daysInPeriodController(TextEditingController value) {
    _$daysInPeriodControllerAtom
        .reportWrite(value, super.daysInPeriodController, () {
      super.daysInPeriodController = value;
    });
  }

  final _$mySalaryAtom = Atom(name: '_MyTimeValueControllerBase.mySalary');

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

  final _$hourWorthAtom = Atom(name: '_MyTimeValueControllerBase.hourWorth');

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

  final _$dayWorthAtom = Atom(name: '_MyTimeValueControllerBase.dayWorth');

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

  final _$yearWorthAtom = Atom(name: '_MyTimeValueControllerBase.yearWorth');

  @override
  double get yearWorth {
    _$yearWorthAtom.reportRead();
    return super.yearWorth;
  }

  @override
  set yearWorth(double value) {
    _$yearWorthAtom.reportWrite(value, super.yearWorth, () {
      super.yearWorth = value;
    });
  }

  final _$hoursAtom = Atom(name: '_MyTimeValueControllerBase.hours');

  @override
  int get hours {
    _$hoursAtom.reportRead();
    return super.hours;
  }

  @override
  set hours(int value) {
    _$hoursAtom.reportWrite(value, super.hours, () {
      super.hours = value;
    });
  }

  final _$daysAtom = Atom(name: '_MyTimeValueControllerBase.days');

  @override
  int get days {
    _$daysAtom.reportRead();
    return super.days;
  }

  @override
  set days(int value) {
    _$daysAtom.reportWrite(value, super.days, () {
      super.days = value;
    });
  }

  final _$myHourWorthAtom =
      Atom(name: '_MyTimeValueControllerBase.myHourWorth');

  @override
  double get myHourWorth {
    _$myHourWorthAtom.reportRead();
    return super.myHourWorth;
  }

  @override
  set myHourWorth(double value) {
    _$myHourWorthAtom.reportWrite(value, super.myHourWorth, () {
      super.myHourWorth = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_MyTimeValueControllerBase.isLoading');

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

  final _$isTimeValueSettedAtom =
      Atom(name: '_MyTimeValueControllerBase.isTimeValueSetted');

  @override
  bool get isTimeValueSetted {
    _$isTimeValueSettedAtom.reportRead();
    return super.isTimeValueSetted;
  }

  @override
  set isTimeValueSetted(bool value) {
    _$isTimeValueSettedAtom.reportWrite(value, super.isTimeValueSetted, () {
      super.isTimeValueSetted = value;
    });
  }

  final _$isReceiptMethodByMonthAtom =
      Atom(name: '_MyTimeValueControllerBase.isReceiptMethodByMonth');

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

  final _$_MyTimeValueControllerBaseActionController =
      ActionController(name: '_MyTimeValueControllerBase');

  @override
  double getYearWorth(double salary) {
    final _$actionInfo = _$_MyTimeValueControllerBaseActionController
        .startAction(name: '_MyTimeValueControllerBase.getYearWorth');
    try {
      return super.getYearWorth(salary);
    } finally {
      _$_MyTimeValueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double getHourWorth(double salary, int days, int hoursInAday) {
    final _$actionInfo = _$_MyTimeValueControllerBaseActionController
        .startAction(name: '_MyTimeValueControllerBase.getHourWorth');
    try {
      return super.getHourWorth(salary, days, hoursInAday);
    } finally {
      _$_MyTimeValueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double getDayWorth(double salary, int days) {
    final _$actionInfo = _$_MyTimeValueControllerBaseActionController
        .startAction(name: '_MyTimeValueControllerBase.getDayWorth');
    try {
      return super.getDayWorth(salary, days);
    } finally {
      _$_MyTimeValueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveStats(
      {double yearWorth,
      double hourWorth,
      double dayWorth,
      int hoursInPeriod}) {
    final _$actionInfo = _$_MyTimeValueControllerBaseActionController
        .startAction(name: '_MyTimeValueControllerBase.saveStats');
    try {
      return super.saveStats(
          yearWorth: yearWorth,
          hourWorth: hourWorth,
          dayWorth: dayWorth,
          hoursInPeriod: hoursInPeriod);
    } finally {
      _$_MyTimeValueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hoursWorkedInAdayController: ${hoursWorkedInAdayController},
daysInPeriodController: ${daysInPeriodController},
mySalary: ${mySalary},
hourWorth: ${hourWorth},
dayWorth: ${dayWorth},
yearWorth: ${yearWorth},
hours: ${hours},
days: ${days},
myHourWorth: ${myHourWorth},
isLoading: ${isLoading},
isTimeValueSetted: ${isTimeValueSetted},
isReceiptMethodByMonth: ${isReceiptMethodByMonth}
    ''';
  }
}
