import 'package:client_pokemon/src/features/pokemon/data/remote/pokemon_service.dart';
import 'package:client_pokemon/src/features/pokemon/domain/pokemon.dart';
import 'package:client_pokemon/src/features/pokemon/presentation/pokemons_list/pokemon_card.dart';
import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonsResearchScreen extends ConsumerStatefulWidget {
  const PokemonsResearchScreen({super.key});

  @override
  ConsumerState<PokemonsResearchScreen> createState() =>
      _PokemonsResearchScreenState();
}

class _PokemonsResearchScreenState
    extends ConsumerState<PokemonsResearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Pokemon> _filterPokemons(List<Pokemon> pokemons) {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return pokemons;
    return pokemons.where((p) {
      return p.name.toLowerCase().contains(q) ||
          p.id.toString() == q ||
          p.types.any((t) => t.toLowerCase().contains(q));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonsListValue = ref.watch(pokemonsListFutureProvider);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(0.8, 1),
                colors: <Color>[Color(0xff363E51), Color(0xff191E26)],
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                    child: Text(
                      'Research',
                      style: TextStyle(
                        fontFamily: 'Pokemon',
                        decorationColor: const Color.fromARGB(0, 255, 0, 0),
                        letterSpacing: 2,
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A3244),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) => setState(() => _query = value),
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Name, number or type',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.white38,
                            fontSize: 15,
                          ),
                          prefixIcon: const Icon(
                            Icons.search_rounded,
                            color: Colors.blueAccent,
                          ),
                          suffixIcon: _query.isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    _searchController.clear();
                                    setState(() => _query = '');
                                  },
                                  child: const Icon(
                                    Icons.close_rounded,
                                    color: Colors.white38,
                                    size: 20,
                                  ),
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: pokemonsListValue.when(
                      data: (pokemons) {
                        final filtered = _filterPokemons(pokemons);
                        if (filtered.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.search_off_rounded,
                                  color: Colors.white24,
                                  size: 64,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'No Pokémon found',
                                  style: TextStyle(
                                    fontFamily: 'Pokemon',
                                    decorationColor: const Color.fromARGB(
                                      0,
                                      255,
                                      0,
                                      0,
                                    ),
                                    letterSpacing: 3,
                                    color: Colors.white38,
                                    fontSize: 26,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
                              child: Text(
                                '${filtered.length} result${filtered.length > 1 ? 's' : ''}',
                                style: GoogleFonts.poppins(
                                  color: Colors.white38,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GridView.builder(
                                padding: const EdgeInsets.fromLTRB(
                                  12,
                                  0,
                                  12,
                                  90,
                                ),
                                itemCount: filtered.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 0,
                                      crossAxisSpacing: 20,
                                      childAspectRatio: 0.7,
                                    ),
                                itemBuilder: (context, index) {
                                  return PokemonCard(
                                    pokemon: filtered[index],
                                    onTap: () {
                                      context.go(
                                        '/pokemon/${filtered[index].name}',
                                        extra: {
                                          'pokemons': filtered,
                                          'index': index,
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                      error: (error, _) => Center(
                        child: Text(
                          error.toString(),
                          style: const TextStyle(color: Colors.redAccent),
                        ),
                      ),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: DotCurvedBottomNav(
              backgroundColor: const Color(0xF9363E51),
              scrollController: _scrollController,
              hideOnScroll: true,
              indicatorColor: Colors.blueAccent,
              animationDuration: const Duration(milliseconds: 400),
              animationCurve: Curves.fastEaseInToSlowEaseOut,
              selectedIndex: _currentPage,
              indicatorSize: 5,
              borderRadius: 30,
              height: 70,
              onTap: (index) {
                setState(() => _currentPage = index);
              },
              items: [
                GestureDetector(
                  onTap: () => context.go('/'),
                  child: Icon(
                    Icons.home_rounded,
                    color: _currentPage == 0 ? Colors.blueAccent : Colors.white,
                  ),
                ),
                Icon(
                  Icons.search_rounded,
                  color: _currentPage == 1 ? Colors.blueAccent : Colors.white,
                ),
                GestureDetector(
                  onTap: () => context.go('/random'),
                  child: Icon(
                    Icons.question_mark_rounded,
                    color: _currentPage == 2 ? Colors.blueAccent : Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () => context.go('/pokedex'),
                  child: Icon(
                    Icons.catching_pokemon_rounded,
                    color: _currentPage == 3 ? Colors.blueAccent : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
