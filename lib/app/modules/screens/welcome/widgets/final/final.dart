import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/share/router_names/my_router_names.dart';
import 'package:spending_awareness/generated/l10n.dart';

class Final extends StatelessWidget {
  Widget titleWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50.0),
      child: Text(S.of(context).lbl_knowYourMoneyWorth,
          style: TextStyle(fontSize: 20.0)),
    );
  }

  Widget okWidget(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.45,
        child: IconButton(
          icon: Icon(Icons.check_circle_rounded),
          color: Colors.green,
          iconSize: MediaQuery.of(context).size.width * 0.5,
          onPressed: () {
            Modular.to
                .pushReplacementNamed(MyRouterNames.putSalary, arguments: true);
          },
        ));
  }

  Widget explanationWidget(BuildContext context) {
    final EdgeInsets marginEdgeInsets =
        EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0);

    return Container(
        height: 50.0,
        margin: marginEdgeInsets,
        child: Text(
          S.of(context).lbl_clickTheButtonAboveToContinue,
          textAlign: TextAlign.justify,
        ));
  }

  Widget swipeWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
      child: Stack(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.arrow_back_ios, size: 15.0)),
          Container(
              alignment: Alignment.center,
              child: Text(S.of(context).lbl_swipe,
                  style: TextStyle(fontSize: 15.0))),
        ],
      ),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        titleWidget(context),
        okWidget(context),
        explanationWidget(context),
        swipeWidget(context),
      ],
    );
  }

  Widget mainContainerWidget(BuildContext context) {
    return Container(
      //TODO: white or green, choose the best option, if white, do not need this
      //decoration: BoxDecoration(color: Colors.green[300]),
      child: bodyWidget(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return mainContainerWidget(context);
  }
}
