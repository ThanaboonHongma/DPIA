import 'package:dpia_project/models/riskassessment/risklist.dart';

class DpiaSummary {
  final List<RiskData> risks;
  final DateTime date;

  DpiaSummary({
    required this.risks,
    required this.date,
  });
}
