import 'package:client_pokemon/src/features/pokemon/domain/pokemon.dart';
import 'package:client_pokemon/src/features/pokemon/presentation/pokemons_details/pokemon_detail_screen.dart';
import 'package:client_pokemon/src/features/pokemon/presentation/pokemons_list/pokemons_list_screen.dart';
import 'package:client_pokemon/src/features/pokemon/presentation/pokemons_pokedex/pokemons_pokedex_screen.dart';
import 'package:client_pokemon/src/features/pokemon/presentation/pokemons_random/pokemons_random_screen.dart';
import 'package:client_pokemon/src/features/pokemon/presentation/pokemons_research/pokemons_research_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => MyHomePage()),
      GoRoute(
        path: '/',
        builder: (context, state) => const PokemonsListScreen(),
        routes: [
          GoRoute(
            path: 'pokemon/:name',
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>;
              final pokemons = extra['pokemons'] as List<Pokemon>;
              final index = extra['index'] as int;
              return PokemonDetailScreen(pokemon: pokemons[index]);
            },
          ),
          GoRoute(
            path: 'search',
            builder: (context, state) => const PokemonsResearchScreen(),
          ),
          GoRoute(
            path: 'pokedex',
            builder: (context, state) => const PokemonsPokedexScreen(),
          ),
          GoRoute(
            path: 'random',
            builder: (context, state) => const PokemonsRandomScreen(),
          ),
        ],
      ),
    ],
  );
});
