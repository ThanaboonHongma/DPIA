import 'package:dpia_project/models/descriptions/checkboxlist.dart';

class NecessityandProportionlity {
  final int id;
  final List<CheckBoxList> list;
  NecessityandProportionlity({
    required this.id,
    required this.list,
  });

  NecessityandProportionlity copyWith({
    int? id,
    List<CheckBoxList>? list,
  }) {
    return NecessityandProportionlity(
      id: id ?? this.id,
      list: list ?? this.list,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory NecessityandProportionlity.fromMap(Map<String, dynamic> map) {
    return NecessityandProportionlity(
      id: map['id'] as int,
      list: List<CheckBoxList>.from((map['list'] as List<dynamic>).map<CheckBoxList>((x) => CheckBoxList.fromMap(x as Map<String,dynamic>),),),
    );
  }

}
