import 'package:client_pokemon/src/constants/pokemon_type_colors.dart';
import 'package:client_pokemon/src/features/pokemon/domain/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonsPokedexCard extends StatefulWidget {
  const PokemonsPokedexCard({
    super.key,
    required this.pokemon,
    required this.onTap,
  });

  final Pokemon pokemon;
  final VoidCallback onTap;

  @override
  State<PokemonsPokedexCard> createState() => _PokemonsPokedexCardState();
}

class _PokemonsPokedexCardState extends State<PokemonsPokedexCard> {
  int _count = 1;
  List<Color> _getGradientColors() {
    final types = widget.pokemon.types;
    if (types.isEmpty) {
      return [
        Colors.white,
        PokemonTypeColors.fallback,
        PokemonTypeColors.fallback,
      ];
    }
    final color1 = PokemonTypeColors.fromType(types[0]);
    if (types.length == 1) {
      return [Color.lerp(color1, Colors.white, 0.7)!, color1, color1];
    }
    final color2 = PokemonTypeColors.fromType(types[1]);
    return [Color.lerp(color1, Colors.white, 0.4)!, color1, color2];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 88,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF2A3142),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned(
              top: 150,
              bottom: -150,
              left: 0,
              right: -20,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: _getGradientColors(),
                  ),
                ),
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(-0.3),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 110,
                    height: 110,
                    child: Image.network(
                      widget.pokemon.sprites.home,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Text(
                            widget.pokemon.name.toUpperCase(),
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.only(top: 10),
                          child: Text(
                            '# ${widget.pokemon.id.toString().padLeft(4, '0')}',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsGeometry.only(top: 60),
                    child: _CounterWidget(
                      count: _count,
                      onIncrement: () => setState(() => _count++),
                      onDecrement: () {
                        if (_count > 1) setState(() => _count--);
                      },
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

class _CounterWidget extends StatelessWidget {
  const _CounterWidget({
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: const Color(0xFF1E2533),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onIncrement,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: const Color(0xFF3D7AE8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 18),
            ),
          ),
          SizedBox(
            width: 28,
            child: Center(
              child: Text(
                '$count',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onDecrement,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: const Color(0xFF3A4258),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.remove, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
