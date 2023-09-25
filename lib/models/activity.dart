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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'isChecked': isChecked,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'] as int,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      description: map['description'] as String,
      isChecked: map['isChecked'] as bool,
    );
  }
}

//create List of Activity with the following data (id,title, subtitle, description, isChecked)

