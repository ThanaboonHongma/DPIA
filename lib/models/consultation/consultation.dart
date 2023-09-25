// ignore_for_file: public_member_api_docs, sort_constructors_first
//create Consultation model class with the following properties (id,title, subtitle, description, isChecked) and constructor, copyWith.
class Consultation {
  final int id;
  final String title;
  final String subtitle;
  final String description;
  final bool isChecked;

  const Consultation({
    required this.id,
    required this.title,
    required this.subtitle,
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
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  String toString() {
    return 'Consultation(id: $id, title: $title, subtitle: $subtitle, description: $description, isChecked: $isChecked)';
  }
}


