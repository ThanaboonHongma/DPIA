// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomeDescription {
  final int id;
  final String titel;
  final String datetime;
  final String rick;
  final String manage;
  HomeDescription({
    required this.id,
    required this.titel,
    required this.datetime,
    required this.rick,
    required this.manage,
  });

  HomeDescription copyWith({
    int? id,
    String? titel,
    String? datetime,
    String? rick,
    String? manage,
  }) {
    return HomeDescription(
      id: id ?? this.id,
      titel: titel ?? this.titel,
      datetime: datetime ?? this.datetime,
      rick: rick ?? this.rick,
      manage: manage ?? this.manage,
    );
  }
}

List<HomeDescription> defaltHomeDescription = [
  // HomeDescription(
  //   id: 1,
  //   titel: 'ชื่อรายการประเมิน',
  //   datetime: '15/12/2023',
  //   rick: '2 ความเสี่ยงสูง',
  //   manage: 'สถานะดำเนินการ : 25%'
  // ),
  // HomeDescription(
  //   id: 2,
  //   titel: 'ชื่อรายการประเมิน',
  //   datetime: '15/12/2023',
  //   rick: 'ไม่มีความเสี่ยง',
  //   manage: ''
  // ),
  // HomeDescription(
  //   id: 3,
  //   titel: 'ชื่อรายการประเมิน',
  //   datetime: '15/12/2023',
  //   rick: '2 ความเสี่ยงสูง',
  //   manage: 'สถานะดำเนินการ : 25%'
  // ),
];