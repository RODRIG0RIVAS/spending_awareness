import 'package:flutter/material.dart';
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final double endFontSize = 20.0;

  // ignore: missing_required_param
  Intro introduction = Intro(stepCount: 4);

  @override
  void initState() {
    super.initState();
    introStart();
  }

  void introStart() async {
    await Future.delayed(Duration(milliseconds: 1000)).whenComplete(() {
      final _next = S.of(context).lbl_next;
      final _continue = S.of(context).lbl_continue;

      final _title = S.of(context).lbl_introductionExplanationTitleAlertDialog;
      final _content = S.of(context).lbl_eachButtonFunctionality;

      introduction = updatedIntro(_next, _continue);

      if (!controller.isUserIntroduced && controller.isTimeValueSetted) {
        return showDialog(
            context: _scaffoldKey.currentContext,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return introductionProposeAlertDialog(_title, _content, context);
            });
      }
    });
  }

  List<String> get buttonsExplanations => <String>[
        S.of(context).lbl_firstButtonExplanation,
        S.of(context).lbl_secondButtonExplanation,
        S.of(context).lbl_thirdButtonExplanation,
        S.of(context).lbl_fourthButtonExplanation
      ];

  Intro updatedIntro(String _next, String _continue) => Intro(
        maskColor: Colors.green,
        noAnimation: false,
        stepCount: 4,
        maskClosable: true,
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(25.0),
        onHighlightWidgetTap: (introStatus) {
          print(introStatus);
        },
        widgetBuilder: StepWidgetBuilder.useDefaultTheme(
          /// Guide page text
          texts: buttonsExplanations,

          /// Button text
          buttonTextBuilder: (curr, total) {
            return curr < total - 1 ? _next : _continue;
          },
        ),
      );

  AlertDialog introductionProposeAlertDialog(
          String title, String content, BuildContext context) =>
      AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        content: Text(
          content,
          textAlign: TextAlign.justify,
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        actions: [
          TextButton(
            child: Text("Ok"),
            onPressed: () {
              Navigator.of(context).pop();
              controller.setUserIntroduced(true);
              introduction.start(_scaffoldKey.currentContext);
            },
          )
        ],
      );

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
    );
  }

  Widget myTimeValueButton(double fontSize) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextButton(
          key: introduction.keys[0],
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
          onPressed: () {
            controller.openMyTimeValueScreen(controller.mySalary);
          }),
    );
  }

  Widget worthToBuyButton(double fontSize) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextButton(
        key: introduction.keys[1],
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

  Widget creditCardImpactButton(double fontSize) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextButton(
        key: introduction.keys[2],
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

  Widget changeSalaryButton(double fontSize) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 30),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextButton(
        key: introduction.keys[3],
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

  Widget getButtons() {
    return controller.myTweens.getFontSizeAnimationBuilder(
        beginFontSize: 0.0,
        endFonzeSize: endFontSize,
        duration: Duration(milliseconds: 650),
        toAnimateWidget: ((context, fontSize, widget) {
          return Container(
              child: Column(
            children: [
              myTimeValueButton(fontSize),
              worthToBuyButton(fontSize),
              creditCardImpactButton(fontSize),
              changeSalaryButton(fontSize)
            ],
          ));
        }));
  }

  Widget getWhiteContainerWidget(EdgeInsets edgeInsets) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: edgeInsets,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50.0)),
        child: Column(
          children: [iWantToGetAwarenessOfLabel(), getButtons()],
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
        key: _scaffoldKey,
        backgroundColor: Colors.green,
        appBar: getAppBar(),
        body: getBody(),
      ),
    );
  }
}
