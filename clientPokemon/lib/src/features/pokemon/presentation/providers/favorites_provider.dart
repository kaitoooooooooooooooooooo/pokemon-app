import 'package:flutter_riverpod/legacy.dart';

class FavoritesNotifier extends StateNotifier<Set<int>> {
  FavoritesNotifier() : super({});

  void toggle(int pokemonId) {
    if (state.contains(pokemonId)) {
      state = {...state}..remove(pokemonId);
    } else {
      state = {...state, pokemonId};
    }
  }

  bool isFavorite(int pokemonId) => state.contains(pokemonId);
}

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, Set<int>>((
  ref,
) {
  return FavoritesNotifier();
});
