import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/screens/welcome/welcome_controller.dart';
import 'package:spending_awareness/app/modules/screens/welcome/widgets/final/final.dart';
import 'package:spending_awareness/app/modules/screens/welcome/widgets/how_works/how_works.dart';
import 'package:spending_awareness/app/modules/screens/welcome/widgets/propose/propose.dart';

import 'widgets/add_money/add_money.dart';

class WelcomePage extends StatefulWidget {
  final String title;
  const WelcomePage({Key key, this.title = "Spending Awareness"})
      : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends ModularState<WelcomePage, WelcomeController> {
  List<Widget> pages = <Widget>[
    ProposeWidget(),
    HowWorks(),
    AddMoney(),
    Final()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            itemCount: pages.length,
            itemBuilder: ((context, index) {
              return pages.elementAt(index);
            })));
  }
}
