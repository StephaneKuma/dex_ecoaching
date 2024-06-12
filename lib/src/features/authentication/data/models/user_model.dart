import 'package:e_coaching/src/core/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.pseudo,
    required super.dateofbirth,
    required super.phone,
    required super.email,
    required super.gender,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? pseudo,
    DateTime? dateofbirth,
    String? phone,
    String? email,
    String? gender,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      pseudo: pseudo ?? this.pseudo,
      dateofbirth: dateofbirth ?? this.dateofbirth,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      gender: gender ?? this.gender,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      pseudo: map['pseudo'] ?? '',
      dateofbirth: map['dateofbirth'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateofbirth'] as int)
          : DateTime.now(),
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      gender: map['gender'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'pseudo': pseudo,
      'dateofbirth': dateofbirth.millisecondsSinceEpoch,
      'phone': phone,
      'email': email,
      'gender': gender,
    };
  }
}
