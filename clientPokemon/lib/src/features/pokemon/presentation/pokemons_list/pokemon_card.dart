import 'package:client_pokemon/src/constants/app_sizes.dart';
import 'package:client_pokemon/src/features/pokemon/domain/pokemon.dart';
import 'package:client_pokemon/src/features/pokemon/presentation/providers/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonCard extends ConsumerWidget {
  const PokemonCard({super.key, required this.pokemon, required this.onTap});

  final Pokemon pokemon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(
      favoritesProvider.select((favs) => favs.contains(pokemon.id)),
    );
    final List<Color> gradientColors = [
      const Color(0xFF34CAE8),
      const Color(0xFF4E49F2),
    ];

    return Card(
      color: const Color.fromARGB(0, 189, 176, 131),
      child: GestureDetector(
        onTap: onTap,
        
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            image: DecorationImage(
              image: AssetImage('./imgRectangle166.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.network(pokemon.sprites.home),
                    ),
                    Positioned(
                      right: -4,
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) => LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: gradientColors,
                        ).createShader(bounds),
                        child: IconButton(
                          onPressed: () {
                            ref
                                .read(favoritesProvider.notifier)
                                .toggle(pokemon.id);
                          },
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite
                                ? Colors.blueAccent
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                gapH4,
                const Divider(),
                gapH4,
                Text(
                  '#${pokemon.id}',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(140, 255, 255, 255),
                      fontSize: 13,
                      letterSpacing: -0.3,
                    ),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                gapH4,
                Text(
                  pokemon.name.toUpperCase(),
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 15,
                      fontWeight: FontWeight(700),
                      letterSpacing: -0.3,
                    ),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                gapH4,
                pokemon.types.length > 1
                    ? Text(
                        pokemon.types.join(' / '),
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(140, 255, 255, 255),
                            fontSize: 13,
                            letterSpacing: -0.3,
                          ),
                        ),
                      )
                    : Text(
                        pokemon.types[0],
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(140, 255, 255, 255),
                            fontSize: 13,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ),
                gapH4,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
