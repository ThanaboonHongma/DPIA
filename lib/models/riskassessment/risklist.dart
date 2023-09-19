// ignore_for_file: public_member_api_docs, sort_constructors_first


class RiskData {
  final int id;
  final String effect;
  final String probability;
  final String severity;
  final String riskLevel;
  RiskData({
    required this.id,
    required this.effect,
    required this.probability,
    required this.severity,
    required this.riskLevel,
  });

  RiskData copyWith({
    int? id,
    String? effect,
    String? probability,
    String? severity,
    String? riskLevel,
  }) {
    return RiskData(
      id: id ?? this.id,
      effect: effect ?? this.effect,
      probability: probability ?? this.probability,
      severity: severity ?? this.severity,
      riskLevel: riskLevel ?? this.riskLevel,
    );
  }
   
}
List<RiskData> defaultriskdata = [];
