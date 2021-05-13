import 'package:flutter/material.dart';
import 'package:spending_awareness/generated/l10n.dart';

class AddMoney extends StatelessWidget {
  Widget titleWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50.0),
      child:
          Text(S.of(context).lbl_add_money, style: TextStyle(fontSize: 20.0)),
    );
  }

  Widget imageWidget(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.45,
        child: Image.asset(
          "images/_add_money.png",
          fit: BoxFit.cover,
        ));
  }

  Widget explanationWidget(BuildContext context) {
    final EdgeInsets marginEdgeInsets =
        EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0);

    return Container(
        height: 50.0,
        margin: marginEdgeInsets,
        child: Text(
          S.of(context).lbl_add_money_explanation,
          textAlign: TextAlign.justify,
        ));
  }

  Widget bodyWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        titleWidget(context),
        imageWidget(context),
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
