import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/screens/widgets/my_salary_widget.dart';
import 'package:spending_awareness/app/modules/share/my_fonts/my_fonts_size.dart';
import 'package:spending_awareness/app/modules/share/router_names/my_router_names.dart';
import 'package:spending_awareness/generated/l10n.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Spending Awareness"})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  final double fontSize = 23.0;

  final Intro intro = Intro(
    noAnimation: false,
    stepCount: 1,
    padding: EdgeInsets.all(8),
    borderRadius: BorderRadius.all(Radius.circular(4)),
    widgetBuilder: StepWidgetBuilder.useDefaultTheme(
      /// Guide page text
      texts: [
        'Hello, I\'m Flutter Intro.',
        /*'I can help you quickly implement the Step By Step guide in the Flutter project.',
        'My usage is also very simple, you can quickly learn and use it through example and api documentation.',
        'In order to quickly implement the guidance, I also provide a set of out-of-the-box themes, I wish you all a happy use, goodbye!',*/
      ],

      /// Button text
      buttonTextBuilder: (curr, total) {
        return curr < total - 1 ? 'Next' : 'Finish';
      },

      /// Click on whether the mask is allowed to be closed.
      //maskClosable: true,
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //introductionExplanation();
  }

  void introductionExplanation() async {
    await Future.delayed(Duration(seconds: 1)).whenComplete(() {
      intro.start(context);
    });
  }

  void snackBarSetYourTimeValue() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(S.of(context).answer_youCanUseItWhenSetYourTimeValue,
          style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.white,
      duration: Duration(milliseconds: 2000),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(10.0),
    ));
  }

  AppBar getAppBar() {
    return AppBar(
        title: Text(S.of(context).lbl_title),
        elevation: 0.0,
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: Container());
  }

  Widget myTimeValueButton() {
    return Container(
      key: intro.keys[0],
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextButton(
          child: Text(S.of(context).btn_timeValue,
              style: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
              )),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.red),
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
          ),
          onPressed: () =>
              controller.openMyTimeValueScreen(controller.mySalary)),
    );
  }

  Widget worthToBuyButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextButton(
        child: Text(S.of(context).btn_worthToBuy,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            )),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
              controller.isTimeValueSetted ? Colors.red : Colors.transparent),
          backgroundColor: MaterialStateProperty.all(
              controller.isTimeValueSetted ? Colors.blue : Colors.grey),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
        ),
        onPressed: () {
          if (controller.isTimeValueSetted) {
            controller.openWorthToBuyScreen();
          } else {
            snackBarSetYourTimeValue();
          }
        },
      ),
    );
  }

  Widget creditCardImpactButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextButton(
        child: Text(S.of(context).btn_creditCartImpact,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            )),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
              controller.isTimeValueSetted ? Colors.red : Colors.transparent),
          backgroundColor: MaterialStateProperty.all(
              controller.isTimeValueSetted ? Colors.blue : Colors.grey),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
        ),
        onPressed: () {
          if (controller.isTimeValueSetted) {
            controller.openCreditCardImpactScreen();
          } else {
            snackBarSetYourTimeValue();
          }
        },
      ),
    );
  }

  Widget changeSalaryButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 30),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextButton(
        child: Text(S.of(context).btn_changeSalary,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            )),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.red),
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
        ),
        onPressed: () {
          Modular.to
              .pushReplacementNamed(MyRouterNames.putSalary, arguments: false);
        },
      ),
    );
  }

  Widget iWantToGetAwarenessOfLabel() {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      child: Text(S.of(context).lbl_getAwarenessOf,
          style: TextStyle(fontSize: 18.0)),
    );
  }

  Widget getWhiteContainerWidget(EdgeInsets edgeInsets) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: edgeInsets,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50.0)),
        child: Column(
          children: [
            iWantToGetAwarenessOfLabel(),
            myTimeValueButton(),
            worthToBuyButton(),
            creditCardImpactButton(),
            changeSalaryButton()
          ],
        ),
      ),
    );
  }

  Widget getWhiteContainer() {
    return controller.myTweens.getOpacityAnimationBuilder(
        toAnimateWidget: ((context, opacityValue, widget) {
      return Opacity(
        opacity: opacityValue,
        child: controller.myTweens.getEdgeInsetsAnimationBuilder(
          beginEdgeInsets: EdgeInsets.only(top: 500.0, right: 300, left: 300),
          endEdgeInsets: EdgeInsets.only(top: 120.0, right: 15, left: 15),
          toAnimateWidget: ((context, edgeInsets, widget) {
            return getWhiteContainerWidget(edgeInsets);
          }),
        ),
      );
    }));
  }

  Widget getWidget(edgeInsetsValue) {
    return Container(
        margin: edgeInsetsValue,
        child: MySalaryWidget(
            mySalaryValue: controller.mySalary,
            myFontsSizeClass: MyFontsSize(),
            isReceiptMethodByMonth: controller.isReceiptMethodByMonth));
  }

  Widget getMySalaryWidget() {
    return controller.myTweens.getOpacityAnimationBuilder(
        toAnimateWidget: ((context, opacityValue, widget) {
      return Opacity(
        opacity: opacityValue,
        child: controller.myTweens.getEdgeInsetsAnimationBuilder(
            beginEdgeInsets: EdgeInsets.only(top: 10.0),
            endEdgeInsets: EdgeInsets.zero,
            toAnimateWidget: ((context, edgeInsets, widget) {
              return getWidget(
                edgeInsets,
              );
            })),
      );
    }));
  }

  Widget getBody() {
    return Observer(builder: (_) {
      if (controller.isLoading) {
        return Center(
            child: CircularProgressIndicator(backgroundColor: Colors.white));
      }
      return Stack(
        children: [
          getMySalaryWidget(),
          getWhiteContainer(),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.green,
        appBar: getAppBar(),
        body: getBody(),
      ),
    );
  }
}
