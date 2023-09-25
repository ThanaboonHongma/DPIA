// ignore_for_file: public_member_api_docs, sort_constructors_first
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
}
