// import 'package:client_pokemon/src/features/pokemon/data/remote/pokemon_service.dart';
// import 'package:client_pokemon/src/features/pokemon/domain/pokemon.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final testPokemons = [
//   Pokemon(
//     numero: 1,
//     name: "bulbasaur",
//     types: ["grass", "poison"],
//     abilities: ["overgrow", "chlorophyll"],
//     height: 7,
//     weight: 69,
//     stats: {
//       'hp': 45,
//       'attack': 49,
//       'defense': 49,
//       'specialAttack': 65,
//       'specialDefense': 65,
//       'speed': 45,
//     },
//     hierarchy: 0,
//     family: ["bulbasaur", "ivysaur", "venusaur"],
//     sprites: {
//       'home':
//           "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/132.png",
//       'shinyHome':
//           "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/132.png",
//       'gif':
//           "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/132.gif",
//       'shinyGif':
//           "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/shiny/132.gif",
//     },
//   ),
// ];

// final pokemonsListFutureProvider = FutureProvider<List<Pokemon>>((ref) {
//   final repository = ref.watch(pokemonsRepositoryProvider);
//   return repository.fetchPokemonsList();
// });
