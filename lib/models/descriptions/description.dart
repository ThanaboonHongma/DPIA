import 'package:dpia_project/models/descriptions/checkboxlist.dart';

class Description {
  final int id;
  final String title;
  final List<CheckBoxList> list;
  Description({
    required this.id,
    required this.title,
    required this.list,
  });

  Description copyWith({
    int? id,
    String? title,
    List<CheckBoxList>? list,
  }) {
    return Description(
      id: id ?? this.id,
      title: title ?? this.title,
      list: list ?? this.list,
    );
  }

  @override
  String toString() => 'Description(id: $id, title: $title, list: $list)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory Description.fromMap(Map<String, dynamic> map) {
    return Description(
      id: map['id'] as int,
      title: map['title'] as String,
      list: List<CheckBoxList>.from((map['list'] as List<dynamic>).map<CheckBoxList>((x) => CheckBoxList.fromMap(x as Map<String,dynamic>),),),
    );
  }

}
