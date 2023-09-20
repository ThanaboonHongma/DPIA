// ignore_for_file: public_member_api_docs, sort_constructors_first
class CheckBoxList {
  final int id;
  final String name;
  final bool isChecked;
  CheckBoxList({
    required this.id,
    required this.name,
    required this.isChecked,
  });

  CheckBoxList copyWith({
    int? id,
    String? name,
    bool? isChecked,
  }) {
    return CheckBoxList(
      id: id ?? this.id,
      name: name ?? this.name,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
