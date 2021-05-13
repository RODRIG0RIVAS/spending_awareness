import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/screens/widgets/my_salary_widget.dart';
import 'package:spending_awareness/app/modules/share/formaters/money_formated.dart';
import 'package:spending_awareness/app/modules/share/my_fonts/my_fonts_size.dart';
import 'package:spending_awareness/app/modules/share/router_names/my_router_names.dart';
import 'package:spending_awareness/generated/l10n.dart';
import 'worth_to_buy_controller.dart';

class WorthToBuyPage extends StatefulWidget {
  final String title;
  const WorthToBuyPage({Key key, this.title = "Spending Awareness"})
      : super(key: key);

  @override
  _WorthToBuyPageState createState() => _WorthToBuyPageState();
}

class _WorthToBuyPageState
    extends ModularState<WorthToBuyPage, WorthToBuyController> {
  //use 'controller' variable to access controller

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

  Widget worthToBuyLabel() {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      child:
          Text(S.of(context).lbl_worthToBuy, style: TextStyle(fontSize: 20.0)),
    );
  }

  Widget hourWorthWidget(double fontSize) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${S.of(context).lbl_yourHourWorth}",
                style: TextStyle(color: Colors.black, fontSize: fontSize),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                MoneyFormated.getMoneyFormated(controller.hourWorth.isInfinite
                    ? 0.0
                    : controller.hourWorth),
                style: TextStyle(
                    color: Colors.green,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget dayWorthWidget(double fontSize) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${S.of(context).lbl_yourDayWorth}",
                style: TextStyle(color: Colors.black, fontSize: fontSize),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                MoneyFormated.getMoneyFormated(
                    controller.dayWorth.isInfinite ? 0.0 : controller.dayWorth),
                style: TextStyle(
                    color: Colors.green,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget howMuchTheItemCostsTextFormField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: TextFormField(
        onChanged: (value) {
          if (value.isEmpty) {
            controller.itemCost = 0;
            //controller.howMuchTheItemCostsController.text = "0";
          }

          setState(() {
            controller.itemCost =
                double.parse(controller.howMuchTheItemCostsController.text);
          });
        },
        toolbarOptions: ToolbarOptions(
            copy: true, paste: false, cut: true, selectAll: true),
        //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textInputAction: TextInputAction.next,
        controller: controller.howMuchTheItemCostsController,
        keyboardType: TextInputType.number,
        decoration:
            InputDecoration(labelText: S.of(context).lbl_howMuchTheItemCosts),
      ),
    );
  }

  Widget howManyTimesAweekDoYouBuyItTextFormField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: TextFormField(
        onChanged: (value) {
          if (value.isEmpty) {
            controller.daysInWeek = 0;
            //controller.howManyTimesAweekDoYouBuyItController.text = "0";
          }

          setState(() {
            controller.daysInWeek = int.parse(
                controller.howManyTimesAweekDoYouBuyItController.text);
          });
        },
        toolbarOptions: ToolbarOptions(
            copy: true, paste: false, cut: true, selectAll: true),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: controller.howManyTimesAweekDoYouBuyItController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: S.of(context).lbl_howManyTimesAweekDoYouBuyIt),
      ),
    );
  }

  Widget toBuyItHoursLabel(double fontSize) {
    TextStyle style = TextStyle(fontSize: fontSize);

    return Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: Text(S.of(context).lbl_toBuyItOnceYouHaveToWork, style: style));
  }

  Widget isCostsXworkHoursOrXdays(double fontSize) {
    String hoursOutput = itCostsXworkHours();
    String daysOutput = itCostsXdays();

    TextStyle style = TextStyle(fontSize: fontSize);

    return Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Text("$hoursOutput ${S.of(context).lbl_or} $daysOutput",
            style: style));
  }

  String itCostsXworkHours() {
    Map workHoursCosts = controller.getHowManyHoursHaveToWorkToBuyIt(
        controller.itemCost, controller.hourWorth);

    String hourOrHours = S.of(context).lbl_hour;

    String minuteOrMinutes = S.of(context).lbl_minute;

    minuteOrMinutes += workHoursCosts["minutes"] == 0 ? "" : "s";

    if ((workHoursCosts["hours"] == 0) || (workHoursCosts["hours"] == 1)) {
      hourOrHours = hourOrHours;
    } else {
      hourOrHours = "$hourOrHours\s";
    }

    String output =
        "${workHoursCosts["hours"]} $hourOrHours ${S.of(context).lbl_and} ${workHoursCosts["minutes"]} $minuteOrMinutes";

    return output;
  }

  String itCostsXdays() {
    double daysCost = controller.getHowManyDaysHaveToWorkToBuyIt(
        controller.itemCost, controller.dayWorth);

    String dayOrDays = S.of(context).lbl_day;

    dayOrDays += daysCost > 1 ? "s" : "";

    String output = "${daysCost.ceil()} $dayOrDays";

    return output;
  }

  Widget spendInAweek(double fontSize) {
    double costInAweek = controller.getHowDoYouSpendInAweek(
        controller.itemCost, controller.daysInWeek);

    String costFormatted = MoneyFormated.getMoneyFormated(costInAweek);
    Color color = costInAweek == 0 ? Colors.green : Colors.red;

    TextStyle styleSpend = TextStyle(fontSize: fontSize);
    TextStyle styleCost = TextStyle(
        color: color, fontSize: fontSize, fontWeight: FontWeight.bold);

    return Container(
      margin: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(S.of(context).lbl_youSpendInAweek,
                      style: styleSpend))),
          Expanded(
              child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(" $costFormatted", style: styleCost))),
        ],
      ),
    );
  }

  Widget worthValuesWidgets() {
    return controller.myTweens.getFontSizeAnimationBuilder(
        beginFontSize: 0.0,
        endFonzeSize: 20.0,
        duration: Duration(milliseconds: 650),
        toAnimateWidget: ((context, fontSize, widget) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                hourWorthWidget(fontSize),
                dayWorthWidget(fontSize),
              ],
            ),
          );
        }));
  }

  Widget resultWidgets() {
    return controller.myTweens.getFontSizeAnimationBuilder(
        beginFontSize: 0.0,
        endFonzeSize: 20.0,
        duration: Duration(milliseconds: 650),
        toAnimateWidget: ((context, fontSize, widget) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                toBuyItHoursLabel(fontSize),
                isCostsXworkHoursOrXdays(fontSize),
                spendInAweek(fontSize),
              ],
            ),
          );
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
          children: [
            worthToBuyLabel(),
            worthValuesWidgets(),
            howMuchTheItemCostsTextFormField(),
            howManyTimesAweekDoYouBuyItTextFormField(),
            resultWidgets(),
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
