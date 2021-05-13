import 'package:flutter/material.dart';
import 'package:spending_awareness/generated/l10n.dart';

class HowWorks extends StatelessWidget {
  Widget titleWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50.0),
      child: Text(S.of(context).lbl_choice_your_earn_type,
          style: TextStyle(fontSize: 20.0)),
    );
  }

  Widget imageWidget(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.45,
        child: Image.asset(
          "images/_choice_earn_salary_type.png",
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
          S.of(context).lbl_get_type,
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
