import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spending_awareness/app/modules/share/router_names/my_router_names.dart';
import 'package:spending_awareness/generated/l10n.dart';
import 'put_salary_controller.dart';

class PutSalaryPage extends StatefulWidget {
  final String title;
  final bool isFirstExecution;
  const PutSalaryPage(
      {Key key,
      this.title = "Spending Awareness",
      @required this.isFirstExecution})
      : super(key: key);

  @override
  _PutSalaryPageState createState() => _PutSalaryPageState();
}

class _PutSalaryPageState
    extends ModularState<PutSalaryPage, PutSalaryController> {
  //use 'controller' variable to access controller
  var _formKey = GlobalKey<FormState>();

  List<bool> isSelected = [false, true];

  final moneyTextController =
      MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');

  Widget getAppBar() {
    return AppBar(
      title: Text(S.of(context).lbl_title),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.green,
      leading: widget.isFirstExecution
          ? Container()
          : IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () =>
                  Modular.to.pushReplacementNamed(MyRouterNames.home),
            ),
    );
  }

  Widget selectSalaryReceiptMethod() {
    return Container(
      margin: const EdgeInsets.only(top: 15.0, bottom: 25.0),
      child: Text(S.of(context).lbl_selectReceiptMethod,
          style: TextStyle(fontSize: 20.0)),
    );
  }

  Widget toggleSalaryReceiveMethod() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      child: ToggleButtons(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.black,
          selectedBorderColor: Colors.green,
          selectedColor: Colors.green,
          textStyle: TextStyle(fontSize: 30.0),
          children: [
            Container(
                padding: const EdgeInsets.all(15.0),
                child: Text(S.of(context).btn_toogle_selectReceiptMethod_week)),
            Container(
                padding: const EdgeInsets.all(15.0),
                child: Text(S.of(context).btn_toogle_selectReceiptMethod_month))
          ],
          onPressed: (int index) {
            setState(() {
              for (int buttonIndex = 0;
                  buttonIndex < isSelected.length;
                  buttonIndex++) {
                if (buttonIndex == index) {
                  isSelected[buttonIndex] = true;
                } else {
                  isSelected[buttonIndex] = false;
                }
              }
            });
          },
          isSelected: isSelected),
    );
  }

  Widget putSalaryWidget() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: moneyTextController,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 30.0),
          maxLength: 20,
          toolbarOptions: ToolbarOptions(
              copy: true, paste: false, cut: true, selectAll: true),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          cursorColor: Colors.black87,
          decoration: InputDecoration(
            labelText: S.of(context).lbl_putYourSalaryHere,
            labelStyle: TextStyle(fontSize: 30.0, color: Colors.black87),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black87)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black87)),
          ),
          // ignore: missing_return
          validator: (value) {
            if (value.isEmpty) return S.of(context).answer_insertAnyValue;

            if (value.contains(RegExp(r'[A-Za-z]')))
              return S.of(context).answer_onlyNumbers;
          },
        ),
      ),
    );
  }

  Widget continueButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
      child: TextButton(
        child: Text(
          S.of(context).btn_continue,
          style: TextStyle(fontSize: 30.0, color: Colors.green),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.green, width: 1.0)))),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            controller.putSalaryInDatabase(moneyTextController.numberValue);

            controller.isReceiptMethodByMonth(!isSelected[0]);
            /*isSelected[0]
                ? controller.isReceiptMethodByMonth(false)
                : controller.isReceiptMethodByMonth(true);*/

            controller.goToHome();
          }
        },
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            selectSalaryReceiptMethod(),
            toggleSalaryReceiveMethod(),
            putSalaryWidget(),
            continueButton()
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
          /**
           * the properties right and left was changed
           * because the previous values gotten some 
           * render flex problems.
           * 
           * To solve it, i should to reduce it from 300 to 100
           */
          beginEdgeInsets: EdgeInsets.only(top: 500.0, right: 100, left: 100),
          endEdgeInsets: EdgeInsets.only(top: 0, right: 15, left: 15),
          toAnimateWidget: ((context, edgeInsets, widget) {
            return getWhiteContainerWidget(edgeInsets);
          }),
        ),
      );
    }));
  }

  Widget getBody() {
    return Center(
      child: getWhiteContainer(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          widget.isFirstExecution ? Container() : controller.goToHome();

          return;
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.green,
          appBar: getAppBar(),
          body: getBody(),
        ));
  }
}
