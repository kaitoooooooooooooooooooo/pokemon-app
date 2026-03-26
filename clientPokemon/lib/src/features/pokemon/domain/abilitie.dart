import 'package:equatable/equatable.dart';

class Abilitie extends Equatable {
  final String name;
  final bool hidden;

  const Abilitie({required this.name, required this.hidden});

  factory Abilitie.fromJson(Map<String, dynamic> json) {
    return Abilitie(
      name: json['name'] as String,
      hidden: json['hidden'] as bool,
    );
  }

  @override
  List<Object?> get props => [name, hidden];

  @override
  bool? get stringify => true;
}
