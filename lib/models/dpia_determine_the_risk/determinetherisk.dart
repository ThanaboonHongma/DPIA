import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Determine {
  final String id;
  final String identifiable;
  final String access;
  final String activity;
  final String volume;
  final List<String> dropdown;
  final String datasubjects;
  final String organization;
  Determine({
    required this.id,
    required this.identifiable,
    required this.access,
    required this.activity,
    required this.volume,
    required this.dropdown,
    required this.datasubjects,
    required this.organization,
  });

  Determine copyWith({
    String? id,
    String? identifiable,
    String? access,
    String? activity,
    String? volume,
    List<String>? dropdown,
    String? datasubjects,
    String? organization,
  }) {
    return Determine(
      id: id ?? this.id,
      identifiable: identifiable ?? this.identifiable,
      access: access ?? this.access,
      activity: activity ?? this.activity,
      volume: volume ?? this.volume,
      dropdown: dropdown ?? this.dropdown,
      datasubjects: datasubjects ?? this.datasubjects,
      organization: organization ?? this.organization,
    );
  }

  @override
  String toString() {
    return 'Determine(id: $id, identifiable: $identifiable, access: $access, activity: $activity, volume: $volume, dropdown: $dropdown, datasubjects: $datasubjects, organization: $organization)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'identifiable': identifiable,
      'access': access,
      'activity': activity,
      'volume': volume,
      'dropdown': dropdown,
      'datasubjects': datasubjects,
      'organization': organization,
    };
  }

  factory Determine.fromMap(Map<String, dynamic> map) {
    return Determine(
      id: map['id'] as String,
      identifiable: map['identifiable'] as String,
      access: map['access'] as String,
      activity: map['activity'] as String,
      volume: map['volume'] as String,
      dropdown: List<String>.from(
        (map['dropdown'] as List<String>),
      ),
      datasubjects: map['datasubjects'] as String,
      organization: map['organization'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Determine.fromJson(String source) =>
      Determine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Determine other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.identifiable == identifiable &&
        other.access == access &&
        other.activity == activity &&
        other.volume == volume &&
        listEquals(other.dropdown, dropdown) &&
        other.datasubjects == datasubjects &&
        other.organization == organization;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        identifiable.hashCode ^
        access.hashCode ^
        activity.hashCode ^
        volume.hashCode ^
        dropdown.hashCode ^
        datasubjects.hashCode ^
        organization.hashCode;
  }
}
