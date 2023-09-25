
// ignore_for_file: public_member_api_docs, sort_constructors_first
//create Consultation model class with the following properties (id,title, subtitle, description, isChecked) and constructor, copyWith.
class Consultation {
  final int id;
  final String title;
  final String description;
  final bool isChecked;

  const Consultation({
    required this.id,
    required this.title,
    required this.description,
    this.isChecked = false,
  });

  Consultation copyWith({
    int? id,
    String? title,
    String? subtitle,
    String? description,
    bool? isChecked,
  }) {
    return Consultation(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  String toString() {
    return 'Consultation(id: $id, title: $title, description: $description, isChecked: $isChecked)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'isChecked': isChecked,
    };
  }

  factory Consultation.fromMap(Map<String, dynamic> map) {
    return Consultation(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      isChecked: map['isChecked'] as bool,
    );
  }

}


