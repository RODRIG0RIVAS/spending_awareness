// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$isReceiptMethodByMonthAtom =
      Atom(name: '_HomeControllerBase.isReceiptMethodByMonth');

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

  final _$mySalaryAtom = Atom(name: '_HomeControllerBase.mySalary');

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

  final _$isLoadingAtom = Atom(name: '_HomeControllerBase.isLoading');

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
      Atom(name: '_HomeControllerBase.isTimeValueSetted');

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

  @override
  String toString() {
    return '''
isReceiptMethodByMonth: ${isReceiptMethodByMonth},
mySalary: ${mySalary},
isLoading: ${isLoading},
isTimeValueSetted: ${isTimeValueSetted}
    ''';
  }
}
