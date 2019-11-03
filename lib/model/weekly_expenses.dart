import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class WeeklyExpensesSeries {
  final String week;
  final double weeklyExpenses;
  final charts.Color barColor;

  WeeklyExpensesSeries(
      {@required this.week,
      @required this.weeklyExpenses,
      @required this.barColor});
}
