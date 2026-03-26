import 'package:equatable/equatable.dart';

class Metadata extends Equatable {
  final String generation;

  const Metadata({required this.generation});

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(generation: json['generation'] as String);
  }

  @override
  List<Object?> get props => [generation];
}
