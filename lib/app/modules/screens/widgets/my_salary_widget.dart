import 'package:flutter/material.dart';
import 'package:spending_awareness/app/modules/share/formaters/money_formated.dart';
import 'package:spending_awareness/app/modules/share/my_fonts/my_fonts_size.dart';
import 'package:spending_awareness/generated/l10n.dart';

class MySalaryWidget extends StatelessWidget {
  final double mySalaryValue;
  final bool isReceiptMethodByMonth;
  final MyFontsSize myFontsSizeClass;

  const MySalaryWidget(
      {Key key,
      @required this.mySalaryValue,
      @required this.myFontsSizeClass,
      @required this.isReceiptMethodByMonth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 15.0),
      height: MediaQuery.of(context).size.height * 0.3,
      color: Colors.green,
      child: Column(
        children: [
          Text(
            "${S.of(context).lbl_iReceive} ${(isReceiptMethodByMonth ? S.of(context).lbl_aMonth : S.of(context).lbl_aWeek)}",
            style: TextStyle(
                fontSize: myFontsSizeClass.labelIreceive, color: Colors.white),
          ),
          Text(
            "${MoneyFormated.getMoneyFormated(mySalaryValue)}",
            style: TextStyle(fontSize: 50.0, color: Colors.white),
          )
        ],
      ),
    );
  }
}
