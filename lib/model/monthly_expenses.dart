import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class MonthlyExpensesSeries {
  final String month;
  final int monthlyExpenses;
  final charts.Color barColor;

  MonthlyExpensesSeries(
      {@required this.month,
      @required this.monthlyExpenses,
      @required this.barColor});
}
