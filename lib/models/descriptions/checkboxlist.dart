

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

  @override
  String toString() => 'CheckBoxList(id: $id, name: $name, isChecked: $isChecked)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'isChecked': isChecked,
    };
  }

  factory CheckBoxList.fromMap(Map<String, dynamic> map) {
    return CheckBoxList(
      id: map['id'] as int,
      name: map['name'] as String,
      isChecked: map['isChecked'] as bool,
    );
  }
}
