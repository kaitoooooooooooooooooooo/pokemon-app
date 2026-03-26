// import 'package:client_pokemon/src/constants/test_pokemons.dart';
// import 'package:client_pokemon/src/features/pokemon/domain/pokemon.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class FakePokemonsRepository {
//   final List<Pokemon> _pokemons = testPokemons;

//   List<Pokemon> getPokemonsList() {
//     return _pokemons;
//   }

//   Future<List<Pokemon>> fetchPokemonsList() async {
//     await Future.delayed(const Duration(seconds: 2));
//     return Future.value(_pokemons);
//   }
// }

// final pokemonsRepositoryProvider = Provider<FakePokemonsRepository>((ref) {
//   return FakePokemonsRepository();
// });

// final pokemonsListFutureProvider = FutureProvider<List<Pokemon>>((ref) {
//   final pokemonsRepository = ref.watch(pokemonsRepositoryProvider);
//   return pokemonsRepository.fetchPokemonsList();
// });
