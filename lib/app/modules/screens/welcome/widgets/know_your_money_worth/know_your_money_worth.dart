import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/share/router_names/my_router_names.dart';
import 'package:spending_awareness/generated/l10n.dart';

class KnowYourMoneyWorth extends StatelessWidget {
  Widget titleWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50.0),
      child: Text(S.of(context).lbl_knowYourMoneyWorth,
          style: TextStyle(fontSize: 20.0)),
    );
  }

  //gamb
  double getHeight(context) {
    double heightMediaQuery = MediaQuery.of(context).size.height;
    double widthMediaQuery = MediaQuery.of(context).size.width;

    if ((heightMediaQuery.round() != 913) && (widthMediaQuery.round() != 601)) {
      return MediaQuery.of(context).size.height * 0.45;
    } else {
      return MediaQuery.of(context).size.height * 0.50;
    }
  }

  Widget okWidget(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: getHeight(context),
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
        height: 150.0,
        margin: marginEdgeInsets,
        child: Text(S.of(context).lbl_clickTheButtonAboveToContinue,
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.048)));
  }

  Widget bodyWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        titleWidget(context),
        okWidget(context),
        explanationWidget(context),
      ],
    );
  }

  Widget mainContainerWidget(BuildContext context) {
    return Container(
      child: bodyWidget(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return mainContainerWidget(context);
  }
}
