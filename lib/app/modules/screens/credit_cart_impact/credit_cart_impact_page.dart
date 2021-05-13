import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/screens/widgets/my_salary_widget.dart';
import 'package:spending_awareness/app/modules/share/formaters/money_formated.dart';
import 'package:spending_awareness/app/modules/share/my_fonts/my_fonts_size.dart';
import 'package:spending_awareness/app/modules/share/router_names/my_router_names.dart';
import 'package:spending_awareness/generated/l10n.dart';
import 'credit_cart_impact_controller.dart';

class CreditCartImpactPage extends StatefulWidget {
  final String title;
  const CreditCartImpactPage({Key key, this.title = "Spending Awareness"})
      : super(key: key);

  @override
  _CreditCartImpactPageState createState() => _CreditCartImpactPageState();
}

class _CreditCartImpactPageState
    extends ModularState<CreditCartImpactPage, CreditCartImpactController> {
  //use 'controller' variable to access controller

  AppBar getAppBar() {
    return AppBar(
      title: Text(S.of(context).lbl_title),
      centerTitle: true,
      backgroundColor: Colors.green,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.white,
        onPressed: () => Modular.to.pushReplacementNamed(MyRouterNames.home),
      ),
    );
  }

  Widget installmentsImpactLabel(double fontSize) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      child: Text(S.of(context).lbl_impactOfCreditCardInstallment,
          style: TextStyle(fontSize: fontSize)),
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

  Widget howMuchIsTheInstallmentTextFormField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: TextFormField(
        onChanged: (value) {
          if (value.isEmpty) {
            controller.installmentCost = 0;
            value = "0";
          }

          setState(() {
            controller.installmentCost = double.parse(value);
          });
        },
        toolbarOptions: ToolbarOptions(
            copy: true, paste: false, cut: true, selectAll: true),
        //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textInputAction: TextInputAction.next,
        controller: controller.howMuchIsTheInstallmentController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: S.of(context).lbl_howMuchOneInstallmentCosts),
      ),
    );
  }

  Widget inHowManyInstallmentsTextFormField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: TextFormField(
        onChanged: (value) {
          if (value.isEmpty) {
            controller.installmentCount = 0;
            value = "0";
          }

          setState(() {
            controller.installmentCount = int.parse(value);
          });
        },
        toolbarOptions: ToolbarOptions(
            copy: true, paste: false, cut: true, selectAll: true),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: controller.howManyInstallmentsController,
        keyboardType: TextInputType.number,
        decoration:
            InputDecoration(labelText: S.of(context).lbl_inHowManyInstallments),
      ),
    );
  }

  Widget salaryInNextMonthWidget(double fontSize) {
    double salaryInNextMonth = controller.salaryInNextMonths(
        controller.mySalary, controller.installmentCost);

    String formattedValue = MoneyFormated.getMoneyFormated(salaryInNextMonth);

    TextStyle stylePhrase = TextStyle(fontSize: fontSize);
    TextStyle styleValuePhrase = TextStyle(
        fontSize: fontSize,
        color: salaryInNextMonth == controller.mySalary
            ? Colors.green
            : Colors.red,
        fontWeight: FontWeight.bold);

    return Container(
      margin: const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(S.of(context).lbl_realSalaryInNextMonth,
                      style: stylePhrase),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(formattedValue, style: styleValuePhrase),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget totalCostOfTheInstallment(double fontSize) {
    double totalCostOfTheInstallment = controller.totalCostOfInstallment(
        controller.installmentCost, controller.installmentCount);

    String formattedValue =
        MoneyFormated.getMoneyFormated(totalCostOfTheInstallment);

    TextStyle stylePhrase = TextStyle(fontSize: fontSize);
    TextStyle styleValuePhrase = TextStyle(
        fontSize: fontSize, color: Colors.red, fontWeight: FontWeight.bold);

    return Container(
      margin: const EdgeInsets.only(
          top: 15.0, left: 15.0, right: 15.0, bottom: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(S.of(context).lbl_totalInstallmentCost,
                      style: stylePhrase),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(formattedValue, style: styleValuePhrase),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget toBuyItHoursLabel(double fontSize) {
    TextStyle style = TextStyle(fontSize: fontSize);

    return Container(
        margin: const EdgeInsets.only(top: 15.0),
        child: Text("${S.of(context).lbl_toBuyItAtTotalValueYouHaveToWork}",
            style: style));
  }

  Widget isCostsXworkHoursOrXdays(double fontSize) {
    String hoursOutput = itCostsXworkHours();
    String daysOutput = itCostsXdays();

    String or = S.of(context).lbl_or;

    TextStyle style = TextStyle(fontSize: fontSize);

    return Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Text("$hoursOutput $or $daysOutput", style: style));
  }

  String itCostsXworkHours() {
    Map workHoursCosts = controller.getHowManyHoursHaveToWorkToBuyIt(
        controller.totalCostOfInstallment(
            controller.installmentCost, controller.installmentCount),
        controller.hourWorth);

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
        controller.totalCostOfInstallment(
            controller.installmentCost, controller.installmentCount),
        controller.dayWorth);

    String dayOrDays = S.of(context).lbl_day;

    dayOrDays += daysCost > 1 ? "s" : "";

    String output = "${daysCost.ceil()} $dayOrDays";

    return output;
  }

  Widget getTitle() {
    return controller.myTweens.getFontSizeAnimationBuilder(
        beginFontSize: 0.0,
        endFonzeSize: 18.0,
        duration: Duration(milliseconds: 650),
        toAnimateWidget: ((context, fontSize, widget) {
          return Container(
              child: Column(
            children: [
              installmentsImpactLabel(fontSize),
            ],
          ));
        }));
  }

  //Easier implemented with this method
  Widget getColumnWidgets() {
    return controller.myTweens.getFontSizeAnimationBuilder(
        beginFontSize: 0.0,
        endFonzeSize: 20.0,
        duration: Duration(milliseconds: 650),
        toAnimateWidget: ((context, fontSize, widget) {
          return Container(
              child: Column(
            children: [
              hourWorthWidget(fontSize),
              dayWorthWidget(fontSize),
              howMuchIsTheInstallmentTextFormField(),
              inHowManyInstallmentsTextFormField(),
              salaryInNextMonthWidget(fontSize),
              totalCostOfTheInstallment(fontSize),
              toBuyItHoursLabel(fontSize),
              isCostsXworkHoursOrXdays(fontSize)
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
            children: [
              getTitle(),
              getColumnWidgets(),
            ],
          )),
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

  Widget getWidget(EdgeInsets edgeInsetsValue) {
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
