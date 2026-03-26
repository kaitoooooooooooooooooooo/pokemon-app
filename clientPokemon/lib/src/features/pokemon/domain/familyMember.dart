import 'package:equatable/equatable.dart';

class FamilyMember extends Equatable {
  final int id;
  final String name;

  const FamilyMember({required this.id, required this.name});

  factory FamilyMember.fromJson(Map<String, dynamic> json) {
    return FamilyMember(id: json['id'] as int, name: json['name'] as String);
  }

  @override
  List<Object?> get props => [id, name];
}