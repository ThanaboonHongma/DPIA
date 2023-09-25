
// ignore_for_file: public_member_api_docs, sort_constructors_first
class Determine {
  final String id;
  final String identifiable;
  final String access;
  final String activity;
  final String volume;
  final String dropdown;
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
    String? dropdown,
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
      dropdown: map['dropdown'] as String,
      datasubjects: map['datasubjects'] as String,
      organization: map['organization'] as String,
    );
  }
}
