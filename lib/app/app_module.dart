import 'package:spending_awareness/app/modules/screens/credit_cart_impact/credit_cart_impact_module.dart';
import 'package:spending_awareness/app/modules/screens/put_salary/put_salary_module.dart';
import 'package:spending_awareness/app/modules/screens/splash/splash_module.dart';
import 'package:spending_awareness/app/modules/screens/worth_to_buy/worth_to_buy_module.dart';
import 'package:spending_awareness/app/modules/share/router_names/my_router_names.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:spending_awareness/app/app_widget.dart';
import 'package:spending_awareness/app/modules/screens/home/home_module.dart';

import 'modules/screens/my_time_value/my_time_value_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [$AppController];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(MyRouterNames.home,
            module: HomeModule(), transition: TransitionType.fadeIn),
        ModularRouter(MyRouterNames.myTimeValue,
            module: MyTimeValueModule(), transition: TransitionType.fadeIn),
        ModularRouter(MyRouterNames.worthToBuy,
            module: WorthToBuyModule(), transition: TransitionType.fadeIn),
        ModularRouter(MyRouterNames.putSalary,
            module: PutSalaryModule(), transition: TransitionType.fadeIn),
        ModularRouter(Modular.initialRoute,
            module: SplashModule(), transition: TransitionType.fadeIn),
        ModularRouter(MyRouterNames.creditCardImpact,
            module: CreditCartImpactModule(), transition: TransitionType.fadeIn)
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();

  /*CustomTransition get myScaleWithFadeTransition => CustomTransition(
        transitionDuration: Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          var begin = 0.0;
          var end = 1.0;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return ScaleTransition(
            scale: animation.drive(tween),
            child: FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            ),
          );
        },
      );*/
}
