import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/screens/welcome/welcome_controller.dart';
import 'package:spending_awareness/app/modules/screens/welcome/widgets/how_works/how_works.dart';
import 'package:spending_awareness/app/modules/screens/welcome/widgets/know_your_money_worth/know_your_money_worth.dart';
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
  double currentPage = 0.0;
  final _pageViewController = new PageController();

  List<Widget> pages = <Widget>[
    ProposeWidget(),
    HowWorks(),
    AddMoney(),
    KnowYourMoneyWorth()
  ];

  List<Widget> indicator() => List<Widget>.generate(
      pages.length,
      (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                color: currentPage.round() == index
                    ? Colors.green
                    : Colors.green.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.0)),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView.builder(
            controller: _pageViewController,
            itemCount: pages.length,
            itemBuilder: ((context, index) {
              _pageViewController.addListener(() {
                setState(() {
                  currentPage = _pageViewController.page;
                });
              });
              return pages.elementAt(index);
            })),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: 70.0),
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicator(),
              ),
            ))
      ],
    ));
  }
}
