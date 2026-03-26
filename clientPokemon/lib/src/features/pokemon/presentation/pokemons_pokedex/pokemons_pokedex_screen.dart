import 'package:client_pokemon/src/constants/app_sizes.dart';
import 'package:client_pokemon/src/features/pokemon/data/remote/pokemon_service.dart';
import 'package:client_pokemon/src/features/pokemon/presentation/pokemons_pokedex/pokemons_pokedex_card.dart';
import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PokemonsPokedexScreen extends StatefulWidget {
  const PokemonsPokedexScreen({super.key});

  @override
  State<PokemonsPokedexScreen> createState() => _PokemonsPokedexScreenState();
}

class _PokemonsPokedexScreenState extends State<PokemonsPokedexScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 2;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Pokedex',
          style: TextStyle(
            fontFamily: 'Pokemon',
            decorationColor: Color.fromARGB(0, 255, 0, 0),
            letterSpacing: 2,
            color: Colors.white,
            fontSize: 36,
          ),
        ),
        backgroundColor: const Color(0xFF363E51),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.8, 1),
            colors: <Color>[Color(0xff363E51), Color(0xff191E26)],
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(Sizes.p12),
              child: Column(
                children: [
                  Expanded(
                    child: Consumer(
                      builder: (context, ref, child) {
                        final pokemonsListValue = ref.watch(
                          pokemonsListFutureProvider,
                        );
                        return pokemonsListValue.when(
                          data: (pokemons) => GridView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.only(bottom: 10),
                            itemCount: pokemons.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: 3,
                                ),
                            itemBuilder: (context, index) {
                              return PokemonsPokedexCard(
                                pokemon: pokemons[index],
                                onTap: () {
                                  context.go(
                                    '/pokemon/${pokemons[index].name}',
                                    extra: {
                                      'pokemons': pokemons,
                                      'index': index,
                                    },
                                  );
                                },
                              );
                            },
                          ),
                          error: (error, _) =>
                              Center(child: Text(error.toString())),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                        );
                      },
                    ),
                  ),
                ],
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
                      color: _currentPage == 0
                          ? Colors.blueAccent
                          : Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.go('/search'),
                    child: Icon(
                      Icons.search_rounded,
                      color: _currentPage == 1
                          ? Colors.blueAccent
                          : Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.go('/random'),
                    child: Icon(
                      Icons.question_mark_rounded,
                      color: _currentPage == 2
                          ? Colors.blueAccent
                          : Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.catching_pokemon_rounded,
                    color: _currentPage == 3 ? Colors.blueAccent : Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
