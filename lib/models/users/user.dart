

class Profile {
  final int id;
  final String username;
  final String companyname;
  final int phonenumber;
  final String email;
  Profile({
    required this.id,
    required this.username,
    required this.companyname,
    required this.phonenumber,
    required this.email,
  });

  Profile copyWith({
    int? id,
    String? username,
    String? companyname,
    int? phonenumber,
    String? email,
  }) {
    return Profile(
      id: id ?? this.id,
      username: username ?? this.username,
      companyname: companyname ?? this.companyname,
      phonenumber: phonenumber ?? this.phonenumber,
      email: email ?? this.email,
    );
  }
}