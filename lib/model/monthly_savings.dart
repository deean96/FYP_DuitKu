import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class MonthlySavingsSeries {
  final String month;
  final double monthlySavings;
  final charts.Color barColor;

  MonthlySavingsSeries(
      {@required this.month,
      @required this.monthlySavings,
      @required this.barColor});
}
