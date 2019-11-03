import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class WeeklySavingsSeries {
  final String week;
  final double weeklySavings;
  final charts.Color barColor;

  WeeklySavingsSeries(
      {@required this.week,
      @required this.weeklySavings,
      @required this.barColor});
}
