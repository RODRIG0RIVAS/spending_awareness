import 'package:intl/intl.dart';

class MoneyFormated {
  static String getMoneyFormated(double value) {
    final oCcy = new NumberFormat("#,##0.00", "en_US");

    return "\$ " + oCcy.format(value).toString();
  }
}
