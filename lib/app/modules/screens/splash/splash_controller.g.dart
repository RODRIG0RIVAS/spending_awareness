// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SplashController = BindInject(
  (i) => SplashController(i<RLocalDatabase>(), i<MyTweens>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on _SplashControllerBase, Store {
  final _$startToUpAtom = Atom(name: '_SplashControllerBase.startToUp');

  @override
  bool get startToUp {
    _$startToUpAtom.reportRead();
    return super.startToUp;
  }

  @override
  set startToUp(bool value) {
    _$startToUpAtom.reportWrite(value, super.startToUp, () {
      super.startToUp = value;
    });
  }

  final _$startAsyncAction = AsyncAction('_SplashControllerBase.start');

  @override
  Future start() {
    return _$startAsyncAction.run(() => super.start());
  }

  final _$awaiterAsyncAction = AsyncAction('_SplashControllerBase.awaiter');

  @override
  Future awaiter() {
    return _$awaiterAsyncAction.run(() => super.awaiter());
  }

  @override
  String toString() {
    return '''
startToUp: ${startToUp}
    ''';
  }
}
