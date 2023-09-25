// ignore_for_file: public_member_api_docs, sort_constructors_first
//create Activity model class with the following properties (id,title, subtitle, description, isChecked) and constructor, copyWith.
class Activity {
  final int id;
  final String title;
  final String subtitle;
  final String description;
  final bool isChecked;

  const Activity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    this.isChecked = false,
  });

  Activity copyWith({
    int? id,
    String? title,
    String? subtitle,
    String? description,
    bool? isChecked,
  }) {
    return Activity(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  String toString() {
    return 'Activity(id: $id, title: $title, subtitle: $subtitle, description: $description, isChecked: $isChecked)';
  }
}

//create List of Activity with the following data (id,title, subtitle, description, isChecked)

