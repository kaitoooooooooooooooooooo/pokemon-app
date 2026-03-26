import 'package:client_pokemon/src/features/pokemon/data/remote/pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CarouselExample extends ConsumerWidget {
  final CarouselController controller;
  const CarouselExample({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonsValue = ref.watch(pokemonsListFutureProvider);

    return pokemonsValue.maybeWhen(
      data: (pokemons) => CarouselView(
        backgroundColor: const Color.fromARGB(134, 52, 202, 232),
        controller: controller,
        itemExtent: 350,
        shrinkExtent: 300,
        children: ImageInfo.values.map((info) {
          final pokemon = pokemons.firstWhere(
            (p) => p.name.toLowerCase() == info.pokemonName.toLowerCase(),
          );
          return GestureDetector(
            onTap: () => context.go(
              '/pokemon/${pokemon.name}',
              extra: {'pokemons': pokemons, 'index': pokemons.indexOf(pokemon)},
            ),
            child: Center(
              child: Container(
                width: 350,
                height: 240,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('./imgRectangle167.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: 20,
                      bottom: 60,
                      child: Image.network(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${info.url}',
                        height: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            info.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            info.subtitle,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
      orElse: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class HeroLayoutCard extends StatelessWidget {
  const HeroLayoutCard({super.key, required this.imageInfo});

  final ImageInfo imageInfo;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {
        context.go(
          '/pokemon/${imageInfo.pokemonName}',
          extra: imageInfo.pokemonName,
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: <Widget>[
          ClipRect(
            child: OverflowBox(
              maxWidth: width * 7 / 8,
              minWidth: width * 7 / 8,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${imageInfo.url}',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  imageInfo.title,
                  overflow: TextOverflow.clip,
                  softWrap: false,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  imageInfo.subtitle,
                  overflow: TextOverflow.clip,
                  softWrap: false,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum ImageInfo {
  image1('Charizard Shiny', 'Rare Shiny Form', 'shiny/6.png', 'charizard'),
  image2('Kyogre Shiny', 'Rare Shiny Form', 'shiny/382.png', 'kyogre'),
  image3('Groudon Shiny', 'Rare Shiny Form', 'shiny/383.png', 'groudon'),
  image4('Necrozma Shiny', 'Rare Shiny Form', 'shiny/800.png', 'necrozma'),
  image5('Mewtwo Shiny', 'Rare Shiny Form', 'shiny/150.png', 'mewtwo');

  const ImageInfo(this.title, this.subtitle, this.url, this.pokemonName);
  final String title;
  final String subtitle;
  final String url;
  final String pokemonName;
}
