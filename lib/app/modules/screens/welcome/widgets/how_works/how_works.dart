import 'package:flutter/material.dart';
import 'package:spending_awareness/generated/l10n.dart';

class HowWorks extends StatelessWidget {
  Widget titleWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50.0),
      child: Text("Choose how you earn your salary",
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
          "You can choose Weekly or Monthly. This is for the app makes the calc with more precision.",
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
        Container(
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
              Container(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.arrow_forward_ios, size: 15.0))
            ],
          ),
        )
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
