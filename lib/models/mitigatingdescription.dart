// ignore_for_file: public_member_api_docs, sort_constructors_first
class MitigatingDescription {
  final int id;
  final String dpo;
  final String manage;
  MitigatingDescription({
    required this.id,
    required this.dpo,
    required this.manage,
  });

  MitigatingDescription copyWith({
    int? id,
    String? dpo,
    String? manage,
  }) {
    return MitigatingDescription(
      id: id ?? this.id,
      dpo: dpo ?? this.dpo,
      manage: manage ?? this.manage,
    );
  }
}

List<MitigatingDescription> defaltMitigatingDescription = [
  MitigatingDescription(id: 1, dpo: 'เห็นด้วย', manage: '0 %'),
  MitigatingDescription(id: 2, dpo: 'เห็นด้วย', manage: '25 %'),
  MitigatingDescription(id: 3, dpo: 'เห็นด้วย', manage: '50 %'),
  MitigatingDescription(id: 4, dpo: '', manage: ''),
];
