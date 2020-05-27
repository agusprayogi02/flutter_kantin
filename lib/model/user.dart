import 'dart:convert';

class User {
  static const genders = ['pria', 'wanita'];
  static const jenjangs = ['TK', 'SD', 'SMP', 'SMK'];

  int id;
  String fullname;
  String gender;
  String jenjang;
  String phone;

  User({this.id, this.fullname, this.gender, this.jenjang, this.phone});

  factory User.fromJSON(Map<String, dynamic> map) {
    return User(
        id: map['id'],
        fullname: map['fullname'],
        gender: map['gender'],
        jenjang: map['jenjang'],
        phone: map['phone']);
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'fullname': fullname,
      'gender': gender,
      'jenjang': jenjang,
      'phone': phone
    };
  }

  @override
  String toString() {
    return 'User{id: $id, fullname: $fullname, gender: $gender, jenjang: $jenjang, phone: $phone}';
  }
}

List<User> userFormJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<User>.from(data.map((item) => User.fromJSON(item)));
}

String userToJson(User data) {
  final jsonData = data.toJSON();
  return json.encode(jsonData);
}
