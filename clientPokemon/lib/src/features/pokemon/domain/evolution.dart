import 'package:client_pokemon/src/features/pokemon/domain/familyMember.dart';
import 'package:equatable/equatable.dart';

class Evolution extends Equatable {
  final List<FamilyMember> family;
  final int stage;
  final bool isFinal;

  const Evolution({required this.family, required this.stage, required this.isFinal});

  factory Evolution.fromJson(Map<String, dynamic> json) {
    return Evolution(
      family: (json['family'] as List).map((f) => FamilyMember.fromJson(f)).toList(),
      stage: json['stage'] as int,
      isFinal: json['isFinal'] as bool,
    );
  }

  @override
  List<Object?> get props => [family, stage, isFinal];
}