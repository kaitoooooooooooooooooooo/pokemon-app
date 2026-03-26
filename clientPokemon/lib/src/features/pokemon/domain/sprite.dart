import 'package:equatable/equatable.dart';

class Sprites extends Equatable {
  final String official;
  final String officialShiny;
  final String home;
  final String homeShiny;
  final String gif;
  final String gifShiny;

  const Sprites({
    required this.official,
    required this.officialShiny,
    required this.home,
    required this.homeShiny,
    required this.gif,
    required this.gifShiny,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      official: json['official'] ?? '',
      officialShiny: json['official_shiny'] ?? '',
      home: json['home'] ?? '',
      homeShiny: json['home_shiny'] ?? '',
      gif: json['gif'] ?? '',
      gifShiny: json['gif_shiny'] ?? '',
    );
  }

  @override
  List<Object?> get props => [official, officialShiny, home, homeShiny, gif, gifShiny];
}