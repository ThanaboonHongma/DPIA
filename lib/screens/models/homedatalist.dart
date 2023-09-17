// ignore_for_file: public_member_api_docs, sort_constructors_first
class Homedatalist {
  final int id;
  final String titel;
  final String datetime;
  final String rick;
  final String manage;
  Homedatalist({
    required this.id,
    required this.titel,
    required this.datetime,
    required this.rick,
    required this.manage,
  });

  Homedatalist copyWith({
    int? id,
    String? titel,
    String? datetime,
    String? rick,
    String? manage,
  }) {
    return Homedatalist(
      id: id ?? this.id,
      titel: titel ?? this.titel,
      datetime: datetime ?? this.datetime,
      rick: rick ?? this.rick,
      manage: manage ?? this.manage,
    );
  }
}
