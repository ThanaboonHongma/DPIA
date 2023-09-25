import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RiskData {
  final String id;
  final String effect;
  final String probability;
  final String severity;
  final String riskLevel;
  final DateTime date;
  final List<Measure> measures;
  RiskData({
    required this.id,
    required this.effect,
    required this.probability,
    required this.severity,
    required this.riskLevel,
    required this.date,
    required this.measures,
  });

  RiskData copyWith({
    String? id,
    String? effect,
    String? probability,
    String? severity,
    String? riskLevel,
    DateTime? date,
    List<Measure>? measures,
  }) {
    return RiskData(
      id: id ?? this.id,
      effect: effect ?? this.effect,
      probability: probability ?? this.probability,
      severity: severity ?? this.severity,
      riskLevel: riskLevel ?? this.riskLevel,
      date: date ?? this.date,
      measures: measures ?? this.measures,
    );
  }

  @override
  String toString() {
    return 'RiskData(id: $id, effect: $effect, probability: $probability, severity: $severity, riskLevel: $riskLevel, date: $date, measures: $measures)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'effect': effect,
      'probability': probability,
      'severity': severity,
      'riskLevel': riskLevel,
      'date': date.millisecondsSinceEpoch,
      'measures': measures.map((x) => x.toMap()).toList(),
    };
  }

  factory RiskData.fromMap(Map<String, dynamic> map) {
    return RiskData(
      id: map['id'] as String,
      effect: map['effect'] as String,
      probability: map['probability'] as String,
      severity: map['severity'] as String,
      riskLevel: map['riskLevel'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      measures: List<Measure>.from(
        (map['measures'] as List<dynamic>).map<Measure>(
          (x) => Measure.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class Measure {
  final String measure1;
  final String measure2;
  final String measure3;
  final String project;
  final String responsible;
  final String rick1;
  final String rick2;
  final String rick3;
  final String dpo;
  final String results;
  final String percent;

  Measure({
    required this.measure1,
    required this.measure2,
    required this.measure3,
    required this.project,
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
    String? responsible,
    String? rick1,
    String? rick2,
    String? rick3,
    String? dpo,
    String? results,
    String? percent,
  }) {
    return Measure(
      measure1: measure1 ?? this.measure1,
      measure2: measure2 ?? this.measure2,
      measure3: measure3 ?? this.measure3,
      project: project ?? this.project,
      responsible: responsible ?? this.responsible,
      rick1: rick1 ?? this.rick1,
      rick2: rick2 ?? this.rick2,
      rick3: rick3 ?? this.rick3,
      dpo: dpo ?? this.dpo,
      results: results ?? this.results,
      percent: percent ?? this.percent,
    );
  }

  @override
  String toString() {
    return 'Measure(measure1: $measure1, measure2: $measure2, measure3: $measure3, project: $project, responsible: $responsible, rick1: $rick1, rick2: $rick2, rick3: $rick3, dpo: $dpo, results: $results, percent: $percent)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'measure1': measure1,
      'measure2': measure2,
      'measure3': measure3,
      'project': project,
      'responsible': responsible,
      'rick1': rick1,
      'rick2': rick2,
      'rick3': rick3,
      'dpo': dpo,
      'results': results,
      'percent': percent,
    };
  }

  factory Measure.fromMap(Map<String, dynamic> map) {
    return Measure(
      measure1: map['measure1'] as String,
      measure2: map['measure2'] as String,
      measure3: map['measure3'] as String,
      project: map['project'] as String,
      responsible: map['responsible'] as String,
      rick1: map['rick1'] as String,
      rick2: map['rick2'] as String,
      rick3: map['rick3'] as String,
      dpo: map['dpo'] as String,
      results: map['results'] as String,
      percent: map['percent'] as String,
    );
  }
}
