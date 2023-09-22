class RiskData {
  final String id;
  final String effect;
  final String probability;
  final String severity;
  final String riskLevel;
  final List<Measure> measures;

  RiskData({
    required this.id,
    required this.effect,
    required this.probability,
    required this.severity,
    required this.riskLevel,
    required this.measures,
  });

  RiskData copyWith({
    String? id,
    String? effect,
    String? probability,
    String? severity,
    String? riskLevel,
    List<Measure>? measures,
  }) {
    return RiskData(
      id: id ?? this.id,
      effect: effect ?? this.effect,
      probability: probability ?? this.probability,
      severity: severity ?? this.severity,
      riskLevel: riskLevel ?? this.riskLevel,
      measures: measures ?? this.measures,
    );
  }
}

class Measure {
  final String measure1;
  final String measure2;
  final String measure3;
  final String project;
  final DateTime date;
  final String responsible;
  final String rick1;
  final String rick2;
  final String rick3;
  final String dpo;
  final String results;
  final int percent;

  Measure({
    required this.measure1,
    required this.measure2,
    required this.measure3,
    required this.project,
    required this.date,
    required this.responsible,
    required this.rick1,
    required this.rick2,
    required this.rick3,
    required this.dpo,
    required this.results,
    required this.percent,
  });

  Measure copyWith({
    String? measure1,
    String? measure2,
    String? measure3,
    String? project,
    DateTime? date,
    String? responsible,
    String? rick1,
    String? rick2,
    String? rick3,
    String? dpo,
    String? results,
    int? percent,
  }) {
    return Measure(
      measure1: measure1 ?? this.measure1,
      measure2: measure2 ?? this.measure2,
      measure3: measure3 ?? this.measure3,
      project: project ?? this.project,
      date: date ?? this.date,
      responsible: responsible ?? this.responsible,
      rick1: rick1 ?? this.rick1,
      rick2: rick2 ?? this.rick2,
      rick3: rick3 ?? this.rick3,
      dpo: dpo ?? this.dpo,
      results: results ?? this.results,
      percent: percent ?? this.percent,
    );
  }
}
