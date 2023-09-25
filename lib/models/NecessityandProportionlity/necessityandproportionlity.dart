// ignore_for_file: public_member_api_docs, sort_constructors_first
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
}
