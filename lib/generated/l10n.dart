// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Spending Awareness`
  String get lbl_title {
    return Intl.message(
      'Spending Awareness',
      name: 'lbl_title',
      desc: '',
      args: [],
    );
  }

  /// `Select your salary receipt method`
  String get lbl_selectReceiptMethod {
    return Intl.message(
      'Select your salary receipt method',
      name: 'lbl_selectReceiptMethod',
      desc: '',
      args: [],
    );
  }

  /// `Put your salary here`
  String get lbl_putYourSalaryHere {
    return Intl.message(
      'Put your salary here',
      name: 'lbl_putYourSalaryHere',
      desc: '',
      args: [],
    );
  }

  /// `I want to get awareness of:`
  String get lbl_getAwarenessOf {
    return Intl.message(
      'I want to get awareness of:',
      name: 'lbl_getAwarenessOf',
      desc: '',
      args: [],
    );
  }

  /// `I receive`
  String get lbl_iReceive {
    return Intl.message(
      'I receive',
      name: 'lbl_iReceive',
      desc: '',
      args: [],
    );
  }

  /// `a month`
  String get lbl_aMonth {
    return Intl.message(
      'a month',
      name: 'lbl_aMonth',
      desc: '',
      args: [],
    );
  }

  /// `a week`
  String get lbl_aWeek {
    return Intl.message(
      'a week',
      name: 'lbl_aWeek',
      desc: '',
      args: [],
    );
  }

  /// `Your year worth`
  String get lbl_yourYearWorth {
    return Intl.message(
      'Your year worth',
      name: 'lbl_yourYearWorth',
      desc: '',
      args: [],
    );
  }

  /// `Your day worth`
  String get lbl_yourDayWorth {
    return Intl.message(
      'Your day worth',
      name: 'lbl_yourDayWorth',
      desc: '',
      args: [],
    );
  }

  /// `Your hour worth`
  String get lbl_yourHourWorth {
    return Intl.message(
      'Your hour worth',
      name: 'lbl_yourHourWorth',
      desc: '',
      args: [],
    );
  }

  /// `How many hours do you work a day?`
  String get lbl_howManyHoursWorkAday {
    return Intl.message(
      'How many hours do you work a day?',
      name: 'lbl_howManyHoursWorkAday',
      desc: '',
      args: [],
    );
  }

  /// `For how many days in a month?`
  String get lbl_forHowManydaysInAmonth {
    return Intl.message(
      'For how many days in a month?',
      name: 'lbl_forHowManydaysInAmonth',
      desc: '',
      args: [],
    );
  }

  /// `For how many days in a week?`
  String get lbl_forHowManyDaysInAweek {
    return Intl.message(
      'For how many days in a week?',
      name: 'lbl_forHowManyDaysInAweek',
      desc: '',
      args: [],
    );
  }

  /// `You work for {period} hours a`
  String lbl_youWorkForXhoursA(Object period) {
    return Intl.message(
      'You work for $period hours a',
      name: 'lbl_youWorkForXhoursA',
      desc: '',
      args: [period],
    );
  }

  /// `month`
  String get lbl_month {
    return Intl.message(
      'month',
      name: 'lbl_month',
      desc: '',
      args: [],
    );
  }

  /// `week`
  String get lbl_week {
    return Intl.message(
      'week',
      name: 'lbl_week',
      desc: '',
      args: [],
    );
  }

  /// `Worth to buy?`
  String get lbl_worthToBuy {
    return Intl.message(
      'Worth to buy?',
      name: 'lbl_worthToBuy',
      desc: '',
      args: [],
    );
  }

  /// `How much the item costs?`
  String get lbl_howMuchTheItemCosts {
    return Intl.message(
      'How much the item costs?',
      name: 'lbl_howMuchTheItemCosts',
      desc: '',
      args: [],
    );
  }

  /// `How many times a week do you buy it`
  String get lbl_howManyTimesAweekDoYouBuyIt {
    return Intl.message(
      'How many times a week do you buy it',
      name: 'lbl_howManyTimesAweekDoYouBuyIt',
      desc: '',
      args: [],
    );
  }

  /// `To buy it once, you have to work`
  String get lbl_toBuyItOnceYouHaveToWork {
    return Intl.message(
      'To buy it once, you have to work',
      name: 'lbl_toBuyItOnceYouHaveToWork',
      desc: '',
      args: [],
    );
  }

  /// `hour`
  String get lbl_hour {
    return Intl.message(
      'hour',
      name: 'lbl_hour',
      desc: '',
      args: [],
    );
  }

  /// `minute`
  String get lbl_minute {
    return Intl.message(
      'minute',
      name: 'lbl_minute',
      desc: '',
      args: [],
    );
  }

  /// `day`
  String get lbl_day {
    return Intl.message(
      'day',
      name: 'lbl_day',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get lbl_and {
    return Intl.message(
      'and',
      name: 'lbl_and',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get lbl_or {
    return Intl.message(
      'or',
      name: 'lbl_or',
      desc: '',
      args: [],
    );
  }

  /// `Impact of credit card installments`
  String get lbl_impactOfCreditCardInstallment {
    return Intl.message(
      'Impact of credit card installments',
      name: 'lbl_impactOfCreditCardInstallment',
      desc: '',
      args: [],
    );
  }

  /// `In how many installments?`
  String get lbl_inHowManyInstallments {
    return Intl.message(
      'In how many installments?',
      name: 'lbl_inHowManyInstallments',
      desc: '',
      args: [],
    );
  }

  /// `Real salary in next month`
  String get lbl_realSalaryInNextMonth {
    return Intl.message(
      'Real salary in next month',
      name: 'lbl_realSalaryInNextMonth',
      desc: '',
      args: [],
    );
  }

  /// `Total installment cost`
  String get lbl_totalInstallmentCost {
    return Intl.message(
      'Total installment cost',
      name: 'lbl_totalInstallmentCost',
      desc: '',
      args: [],
    );
  }

  /// `To buy it at total value, you have to work`
  String get lbl_toBuyItAtTotalValueYouHaveToWork {
    return Intl.message(
      'To buy it at total value, you have to work',
      name: 'lbl_toBuyItAtTotalValueYouHaveToWork',
      desc: '',
      args: [],
    );
  }

  /// `You spend in a week`
  String get lbl_youSpendInAweek {
    return Intl.message(
      'You spend in a week',
      name: 'lbl_youSpendInAweek',
      desc: '',
      args: [],
    );
  }

  /// `Week`
  String get btn_toogle_selectReceiptMethod_week {
    return Intl.message(
      'Week',
      name: 'btn_toogle_selectReceiptMethod_week',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get btn_toogle_selectReceiptMethod_month {
    return Intl.message(
      'Month',
      name: 'btn_toogle_selectReceiptMethod_month',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get btn_continue {
    return Intl.message(
      'Continue',
      name: 'btn_continue',
      desc: '',
      args: [],
    );
  }

  /// `How much my time worth`
  String get btn_timeValue {
    return Intl.message(
      'How much my time worth',
      name: 'btn_timeValue',
      desc: '',
      args: [],
    );
  }

  /// `Worth to buy it?`
  String get btn_worthToBuy {
    return Intl.message(
      'Worth to buy it?',
      name: 'btn_worthToBuy',
      desc: '',
      args: [],
    );
  }

  /// `Credit card impact`
  String get btn_creditCartImpact {
    return Intl.message(
      'Credit card impact',
      name: 'btn_creditCartImpact',
      desc: '',
      args: [],
    );
  }

  /// `Change salary`
  String get btn_changeSalary {
    return Intl.message(
      'Change salary',
      name: 'btn_changeSalary',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get btn_save {
    return Intl.message(
      'Save',
      name: 'btn_save',
      desc: '',
      args: [],
    );
  }

  /// `Insert any value`
  String get answer_insertAnyValue {
    return Intl.message(
      'Insert any value',
      name: 'answer_insertAnyValue',
      desc: '',
      args: [],
    );
  }

  /// `Only numbers can be used here`
  String get answer_onlyNumbers {
    return Intl.message(
      'Only numbers can be used here',
      name: 'answer_onlyNumbers',
      desc: '',
      args: [],
    );
  }

  /// `You can use it when set your time value`
  String get answer_youCanUseItWhenSetYourTimeValue {
    return Intl.message(
      'You can use it when set your time value',
      name: 'answer_youCanUseItWhenSetYourTimeValue',
      desc: '',
      args: [],
    );
  }

  /// `Please, set the values to continue`
  String get answer_setFollowingValues {
    return Intl.message(
      'Please, set the values to continue',
      name: 'answer_setFollowingValues',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}