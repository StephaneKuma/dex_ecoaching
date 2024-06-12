// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String pseudo;
  final DateTime dateofbirth;
  final String phone;
  final String email;
  final String gender;

  const User({
    required this.id,
    required this.name,
    required this.pseudo,
    required this.dateofbirth,
    required this.phone,
    required this.email,
    required this.gender,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      pseudo,
      dateofbirth,
      phone,
      email,
      gender,
    ];
  }
}
