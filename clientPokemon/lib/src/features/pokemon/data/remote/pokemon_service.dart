import 'dart:convert';
import 'package:client_pokemon/src/features/pokemon/domain/pokemon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class PokemonService {
  static const url = 'http://127.0.0.1:3000';

  Future<List<Pokemon>> fetchPokemonsList() async {
    final pokemons = <Pokemon>[];
    try {
      final parsedUrl = Uri.parse('$url/pokemons');
      final response = await http.get(parsedUrl);
      final statusCode = response.statusCode;

      if (statusCode != 200) {
        final message = 'Erreur survenue';
        throw Exception(message);
      }

      final data = jsonDecode(response.body);

      data.forEach((pokemon) {
        pokemons.add(Pokemon.fromJson(pokemon));
      });

      return pokemons;
    } catch (e) {
      rethrow;
    }
  }
}

final pokemonsRepositoryProvider = Provider<PokemonService>((ref) {
  return PokemonService();
});

final pokemonsListFutureProvider = FutureProvider<List<Pokemon>>((ref) {
  final pokemonsRepository = ref.watch(pokemonsRepositoryProvider);
  return pokemonsRepository.fetchPokemonsList();
});
