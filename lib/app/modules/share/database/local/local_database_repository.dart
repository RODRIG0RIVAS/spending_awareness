import 'package:hive/hive.dart';

class RLocalDatabase {
  final String _moneyBoxName = "money_box";
  final String _controlBoxName = "control_box";

  Box _moneyBox;
  Box _controlBox;

  Future start() async {
    await Hive.openBox(_moneyBoxName).whenComplete(() async {
      _moneyBox = await Hive.openBox(_moneyBoxName);
      _controlBox = await Hive.openBox(_controlBoxName);
    });
  }

  void putSalary(double value) {
    _moneyBox.put('salary', value);
  }

  double get salary => _moneyBox.get('salary', defaultValue: 0.0);

  void putIsReceiptMethodByMonth(bool value) {
    _moneyBox.put('is_receipt_method_by_month', value);
  }

  bool get isReceiptMethodByMonth =>
      _moneyBox.get('is_receipt_method_by_month', defaultValue: true);

  void putYearWorth(double value) {
    _moneyBox.put('year_worth', value);
  }

  double get yearWorth => _moneyBox.get('year_worth', defaultValue: 0.0);

  void putHourWorth(double value) {
    _moneyBox.put('hour_worth', value);
  }

  double get hourWorth => _moneyBox.get('hour_worth', defaultValue: 0.0);

  void putDayWorth(double value) {
    _moneyBox.put('day_worth', value);
  }

  double get dayWorth => _moneyBox.get('day_worth', defaultValue: 0.0);

  void putHoursInPeriod(int value) {
    _moneyBox.put('hours_in_period', value);
  }

  int get hoursInPeriod => _moneyBox.get('hours_in_period', defaultValue: 0);

  void putHoursInDay(int value) {
    _moneyBox.put('hours_in_day', value);
  }

  int get hoursInDay => _moneyBox.get('hours_in_day', defaultValue: 0);

  void putDaysInPeriod(int value) {
    _moneyBox.put('days_in_period', value);
  }

  int get daysInPeriod => _moneyBox.get('days_in_period', defaultValue: 0);

  void putFirstExecution(bool value) {
    _controlBox.put('first_execution', value);
  }

  bool get firstExecution =>
      _controlBox.get('first_execution', defaultValue: true);

  void putIsTimeValueSetted(bool value) {
    _controlBox.put('time_value_set', value);
  }

  bool get isTimeValueSetted =>
      _controlBox.get('time_value_set', defaultValue: false);
}
