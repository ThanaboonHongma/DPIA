

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Monitoring {
  final String id;
  final String agency;
  final String responsible;
  final String publish;
  final String closedata;
  Monitoring({
    required this.id,
    required this.agency,
    required this.responsible,
    required this.publish,
    required this.closedata,
  });
  

  Monitoring copyWith({
    String? id,
    String? agency,
    String? responsible,
    String? publish,
    String? closedata,
  }) {
    return Monitoring(
      id: id ?? this.id,
      agency: agency ?? this.agency,
      responsible: responsible ?? this.responsible,
      publish: publish ?? this.publish,
      closedata: closedata ?? this.closedata,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'agency': agency,
      'responsible': responsible,
      'publish': publish,
      'closedata': closedata,
    };
  }

  factory Monitoring.fromMap(Map<String, dynamic> map) {
    return Monitoring(
      id: map['id'] as String,
      agency: map['agency'] as String,
      responsible: map['responsible'] as String,
      publish: map['publish'] as String,
      closedata: map['closedata'] as String,
    );
  }


  @override
  String toString() {
    return 'Monitoring(id: $id, agency: $agency, responsible: $responsible, publish: $publish, closedata: $closedata)';
  }
}
