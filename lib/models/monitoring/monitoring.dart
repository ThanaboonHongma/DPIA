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
}
