import 'dart:async';

import 'package:client_pokemon/src/constants/app_sizes.dart';
import 'package:client_pokemon/src/features/pokemon/data/remote/pokemon_service.dart';
import 'package:client_pokemon/src/features/pokemon/presentation/pokemons_list/pokemon_card.dart';
import 'package:client_pokemon/src/features/pokemon/presentation/pokemons_list/pokemon_card_one.dart';
import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 1500), () {
      if (mounted) context.go('/');
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0.8, 1),
          colors: <Color>[Color(0xff363E51), Color(0xff191E26)],
        ),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 300),
              Text(
                'NeoDex',
                style: TextStyle(
                  fontFamily: 'Pokemon',
                  decorationColor: const Color.fromARGB(0, 255, 0, 0),
                  letterSpacing: 2,
                  color: Colors.white,
                  fontSize: 100,
                ),
              ),
            ],
          ),
          Center(child: Lottie.asset('./lottie/001Bulbasaur.json')),
          // Center(child: Lottie.asset('./lottie/Pikachu.json')),
        ],
      ),
    );
  }
}

class PokemonsListScreen extends StatefulWidget {
  const PokemonsListScreen({super.key});

  @override
  State<PokemonsListScreen> createState() => _PokemonsListScreenState();
}

class _PokemonsListScreenState extends State<PokemonsListScreen> {
  final CarouselController _carouselController = CarouselController();
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;

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
          'NeoDex',
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
                  SizedBox(
                    height: 200,
                    child: CarouselExample(controller: _carouselController),
                  ),
                  const SizedBox(height: Sizes.p16),
                  Expanded(
                    child: Consumer(
                      builder: (context, ref, child) {
                        final pokemonsListValue = ref.watch(
                          pokemonsListFutureProvider,
                        );
                        return pokemonsListValue.when(
                          data: (pokemons) => GridView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.only(bottom: 90),
                            itemCount: pokemons.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: 0.7,
                                ),
                            itemBuilder: (context, index) {
                              return PokemonCard(
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
                  Icon(
                    Icons.home_rounded,
                    color: _currentPage == 0 ? Colors.blueAccent : Colors.white,
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
                  GestureDetector(
                    onTap: () => context.go('/pokedex'),
                    child: Icon(
                      Icons.catching_pokemon_rounded,
                      color: _currentPage == 3
                          ? Colors.blueAccent
                          : Colors.white,
                    ),
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
