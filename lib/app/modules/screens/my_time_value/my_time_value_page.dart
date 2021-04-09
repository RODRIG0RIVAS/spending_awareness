import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/screens/widgets/my_salary_widget.dart';
import 'package:spending_awareness/app/modules/share/formaters/money_formated.dart';
import 'package:spending_awareness/app/modules/share/my_fonts/my_fonts_size.dart';
import 'package:spending_awareness/app/modules/share/router_names/my_router_names.dart';
import 'package:spending_awareness/generated/l10n.dart';
import 'my_time_value_controller.dart';

class MyTimeValuePage extends StatefulWidget {
  final String title;
  final double mySalary;
  const MyTimeValuePage(
      {Key key, this.title = "Spending Awareness", @required this.mySalary})
      : super(key: key);

  @override
  _MyTimeValuePageState createState() => _MyTimeValuePageState();
}

class _MyTimeValuePageState
    extends ModularState<MyTimeValuePage, MyTimeValueController> {
  //use 'controller' variable to access controller

  Widget howMuchMyWorkWorthLabel() {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      child:
          Text(S.of(context).btn_timeValue, style: TextStyle(fontSize: 18.0)),
    );
  }

  Widget yearWorthWidget() {
    double yearWorthValue = controller.getYearWorth(widget.mySalary);

    String formattedValue = MoneyFormated.getMoneyFormated(yearWorthValue);

    if (controller.isReceiptMethodByMonth) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(S.of(context).lbl_yourYearWorth,
                  style: TextStyle(fontSize: 20.0)),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text("$formattedValue",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold)),
            ),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Widget hourWorthWidget() {
    double hourWorthValue = controller.getHourWorth(
        widget.mySalary, controller.days, controller.hours);

    String formattedValue = MoneyFormated.getMoneyFormated(hourWorthValue);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              S.of(context).lbl_yourHourWorth,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: Text("$formattedValue",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  AppBar getAppBar() {
    return AppBar(
      title: Text(S.of(context).lbl_title),
      elevation: 0.0,
      backgroundColor: Colors.green,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.white,
        onPressed: () => Modular.to.pushReplacementNamed(MyRouterNames.home),
      ),
    );
  }

  Widget howManyHoursWorkAdayTextFormField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: TextFormField(
        onChanged: (value) {
          if (value.isEmpty) {
            controller.hours = 0;
            //value = "0";
          }
          setState(() {
            if (int.parse(value) > 24) {
              value = "24";
              controller.hoursWorkedInAdayController.text = "24";
            }
            controller.hours =
                int.parse(controller.hoursWorkedInAdayController.text);
          });
        },
        controller: controller.hoursWorkedInAdayController,
        keyboardType: TextInputType.number,
        decoration:
            InputDecoration(labelText: S.of(context).lbl_howManyHoursWorkAday),
      ),
    );
  }

  Widget daysInPeriodTextFormField() {
    if (controller.isReceiptMethodByMonth) {
      return Container(
        margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: TextFormField(
          onChanged: (value) {
            if (value.isEmpty) {
              controller.days = 0;
              //value = "0";
            }
            setState(() {
              if (int.parse(value) > 31) {
                value = "31";
                controller.daysInPeriodController.text = "31";
              }
              controller.days =
                  int.parse(controller.daysInPeriodController.text);
            });
            //controller.myHourWorthAction();
          },
          controller: controller.daysInPeriodController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: S.of(context).lbl_forHowManydaysInAmonth),
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: TextFormField(
          onChanged: (value) {
            if (value.isEmpty) {
              controller.days = 0;
              //value = "0";
            }
            setState(() {
              if (int.parse(value) > 7) {
                value = "7";
                controller.daysInPeriodController.text = "7";
              }
              controller.days =
                  int.parse(controller.daysInPeriodController.text);
            });
            //controller.myHourWorthAction();
          },
          controller: controller.daysInPeriodController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: S.of(context).lbl_forHowManyDaysInAweek),
        ),
      );
    }
  }

  Widget dayWorthWidget() {
    double dayWorth = controller.getDayWorth(widget.mySalary, controller.days);
    String formattedDayWorth = MoneyFormated.getMoneyFormated(dayWorth);

    return Row(
      children: [
        Expanded(
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text(S.of(context).lbl_yourDayWorth,
                    style: TextStyle(fontSize: 20.0)))),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(
              "$formattedDayWorth",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }

  Widget hoursInPeriodWidget() {
    int period = controller.days * controller.hours;
    String output = S.of(context).lbl_youWorkForXhoursA(period);
    TextStyle style = TextStyle(fontSize: 20.0);

    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      child: controller.isReceiptMethodByMonth
          ? Text("$output ${S.of(context).lbl_month}", style: style)
          : Text("$output ${S.of(context).lbl_week}", style: style),
    );
  }

  Widget saveButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 30),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextButton(
        child: Text(S.of(context).btn_save,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            )),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.red),
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
        ),
        onPressed: () {
          if (controller.hours == 0 || controller.days == 0) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(S.of(context).answer_setFollowingValues,
                  style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.white,
              duration: Duration(milliseconds: 2000),
              behavior: SnackBarBehavior.floating,
              padding: const EdgeInsets.all(10.0),
            ));
          } else {
            controller.saveStats(
                dayWorth:
                    controller.getDayWorth(widget.mySalary, controller.days),
                hourWorth: controller.getHourWorth(
                    widget.mySalary, controller.days, controller.hours),
                yearWorth: controller.getYearWorth(widget.mySalary),
                hoursInPeriod: controller.days * controller.hours);
          }
        },
      ),
    );
  }

  Widget resultContainer() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          yearWorthWidget(),
          hourWorthWidget(),
          dayWorthWidget(),
          hoursInPeriodWidget(),
          saveButton()
        ],
      ),
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
            howMuchMyWorkWorthLabel(),
            howManyHoursWorkAdayTextFormField(),
            daysInPeriodTextFormField(),
            resultContainer()
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
        Modular.to.pushReplacementNamed(MyRouterNames.home);
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
