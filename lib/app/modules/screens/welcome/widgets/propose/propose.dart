import 'package:flutter/material.dart';
import 'package:spending_awareness/generated/l10n.dart';

class ProposeWidget extends StatelessWidget {
  Widget titleWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50.0),
      child: Text(S.of(context).lbl_welcome_screen_spending_awareness,
          style: TextStyle(fontSize: 20.0)),
    );
  }

  //gamb, do not touch
  double getHeight(context) {
    double heightMediaQuery = MediaQuery.of(context).size.height;
    double widthMediaQuery = MediaQuery.of(context).size.width;

    if ((heightMediaQuery.round() == 913) && (widthMediaQuery.round() == 601)) {
      return MediaQuery.of(context).size.height * 0.50;
    } else if ((heightMediaQuery == 1232.0) && widthMediaQuery == 800.0) {
      return MediaQuery.of(context).size.height * 0.50;
    } else {
      return MediaQuery.of(context).size.height * 0.45;
    }
  }

  //another gamb
  double getWidthToTenInchesTabletText(context) {
    double heightMediaQuery = MediaQuery.of(context).size.height;
    double widthMediaQuery = MediaQuery.of(context).size.width;

    if ((heightMediaQuery == 1232.0) && widthMediaQuery == 800.0) {
      return MediaQuery.of(context).size.width * 0.040;
    } else {
      return MediaQuery.of(context).size.width * 0.048;
    }
  }

  Widget imageWidget(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: getHeight(context),
        child: Image.asset(
          "images/_propose.png",
          fit: BoxFit.cover,
        ));
  }

  Widget explanationWidget(BuildContext context) {
    final EdgeInsets marginEdgeInsets =
        EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0);

    return Container(
        height: 150.0,
        margin: marginEdgeInsets,
        child: Text(S.of(context).lbl_welcome_screen_propose_explanation,
            textAlign: TextAlign.justify,
            style:
                TextStyle(fontSize: getWidthToTenInchesTabletText(context))));
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
