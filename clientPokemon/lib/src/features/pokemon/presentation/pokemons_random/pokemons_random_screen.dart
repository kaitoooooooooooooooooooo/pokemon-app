import 'dart:math';

import 'package:client_pokemon/src/features/pokemon/data/remote/pokemon_service.dart';
import 'package:client_pokemon/src/features/pokemon/domain/pokemon.dart';
import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PokemonsRandomScreen extends ConsumerStatefulWidget {
  const PokemonsRandomScreen({super.key});

  @override
  ConsumerState<PokemonsRandomScreen> createState() =>
      _PokemonsRandomScreenState();
}

class _PokemonsRandomScreenState extends ConsumerState<PokemonsRandomScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _boxOpen = false;
  Pokemon? _revealedPokemon;
  bool _pokemonVisible = false;
  int _currentPage = 2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && _boxOpen) {
        setState(() => _pokemonVisible = true);
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _pokemonVisible = false;
          _revealedPokemon = null;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onBoxTap(List<Pokemon> pokemons) {
    if (!_boxOpen) {
      final random = Random();
      setState(() {
        _revealedPokemon = pokemons[random.nextInt(pokemons.length)];
        _boxOpen = true;
        _pokemonVisible = false;
      });
      _controller.forward();
    } else {
      setState(() {
        _boxOpen = false;
        _pokemonVisible = false;
      });
      _controller.reverse();
    }
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
              child: pokemonsListValue.when(
                data: (pokemons) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Text(
                        'Random',
                        style: TextStyle(
                          fontFamily: 'Pokemon',
                          letterSpacing: 2,
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            opacity: _pokemonVisible ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 500),
                            child: _revealedPokemon != null
                                ? _buildPokemonCard(_revealedPokemon!, pokemons)
                                : const SizedBox(height: 160),
                          ),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () => _onBoxTap(pokemons),
                            child: Lottie.asset(
                              './lottie/BoxOpen.json',
                              controller: _controller,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _boxOpen
                                ? 'Tap to close'
                                : 'Tap the box to reveal a Pokémon!',
                            style: GoogleFonts.poppins(
                              color: Colors.white54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                error: (e, _) => Center(
                  child: Text(
                    e.toString(),
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: DotCurvedBottomNav(
              backgroundColor: const Color(0xF9363E51),
              scrollController: ScrollController(),
              hideOnScroll: false,
              indicatorColor: Colors.blueAccent,
              animationDuration: const Duration(milliseconds: 400),
              animationCurve: Curves.fastEaseInToSlowEaseOut,
              selectedIndex: _currentPage,
              indicatorSize: 5,
              borderRadius: 30,
              height: 70,
              onTap: (index) => setState(() => _currentPage = index),
              items: [
                GestureDetector(
                  onTap: () => context.go('/'),
                  child: Icon(
                    Icons.home_rounded,
                    color: _currentPage == 0 ? Colors.blueAccent : Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () => context.go('/search'),
                  child: Icon(
                    Icons.search_rounded,
                    color: _currentPage == 1 ? Colors.blueAccent : Colors.white,
                  ),
                ),
                Icon(
                  Icons.question_mark_rounded,
                  color: _currentPage == 2 ? Colors.blueAccent : Colors.white,
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

  Widget _buildPokemonCard(Pokemon pokemon, List<Pokemon> allPokemons) {
    return GestureDetector(
      onTap: () => context.go(
        '/pokemon/${pokemon.name}',
        extra: {'pokemons': allPokemons, 'index': allPokemons.indexOf(pokemon)},
      ),
      child: Container(
        width: 220,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF2A3142),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blueAccent.withOpacity(0.4)),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.15),
              blurRadius: 20,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.network(
              pokemon.sprites.home,
              height: 110,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              pokemon.name.toUpperCase(),
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '#${pokemon.id.toString().padLeft(3, '0')}  •  ${pokemon.types.join(' / ')}',
              style: GoogleFonts.poppins(color: Colors.white54, fontSize: 12),
            ),
            const SizedBox(height: 6),
            Text(
              'Tap to see details →',
              style: GoogleFonts.poppins(
                color: Colors.blueAccent,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
