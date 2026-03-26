import 'package:client_pokemon/src/features/pokemon/domain/evolution.dart';
import 'package:client_pokemon/src/features/pokemon/domain/metadata.dart';
import 'package:client_pokemon/src/features/pokemon/domain/sprite.dart';
import 'package:equatable/equatable.dart';
import 'package:client_pokemon/src/features/pokemon/domain/abilitie.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final List<String> types;
  final List<Abilitie> abilities;
  final int height;
  final int weight;
  final int baseExperience;
  final Map<String, int> stats;
  final Evolution evolution;
  final Sprites sprites;
  final Metadata metadata;

  const Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.abilities,
    required this.height,
    required this.weight,
    required this.baseExperience,
    required this.stats,
    required this.evolution,
    required this.sprites,
    required this.metadata,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      types: List<String>.from(json['types']),
      abilities: (json['abilities'] as List)
          .map((a) => Abilitie.fromJson(a))
          .toList(),
      height: json['height'] as int,
      weight: json['weight'] as int,
      baseExperience: json['baseExperience'] as int,
      stats: Map<String, int>.from(json['stats']),
      evolution: Evolution.fromJson(json['evolution']),
      sprites: Sprites.fromJson(json['sprites']),
      metadata: Metadata.fromJson(json['metadata']),
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    types,
    abilities,
    height,
    weight,
    baseExperience,
    stats,
    evolution,
    sprites,
    metadata,
  ];
}

extension PokemonX on Pokemon {
  List<String> get typeIconPaths {
    return types.map((t) => 'assets/icons/${t.toLowerCase()}.png').toList();
  }
}
