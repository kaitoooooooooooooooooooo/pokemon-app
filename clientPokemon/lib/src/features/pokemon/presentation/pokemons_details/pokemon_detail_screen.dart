import 'package:client_pokemon/src/constants/pokemon_type_colors.dart';
import 'package:client_pokemon/src/features/pokemon/domain/pokemon.dart';
import 'package:client_pokemon/src/features/pokemon/presentation/pokemons_details/draggableSheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonDetailScreen extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen({super.key, required this.pokemon});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  int currentPage = 0;

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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        isDismissible: false,
        enableDrag: true,
        builder: (context) =>
            DraggableSheet(pokemon: widget.pokemon, currentPage: currentPage),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -20,
            bottom: -110,
            left: 510,
            right: -500,
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
              transform: Matrix4.rotationZ(0.45),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 6),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        widget.pokemon.name.toUpperCase(),
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                        ),
                      ),
                      currentPage == 0
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.stars,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                    ],
                  ),
                  Row(
                    children: widget.pokemon.types.map((type) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: SizedBox(
                          width: 48,
                          height: 48,
                          child: Image.asset(
                            'icons/${type.toLowerCase()}.png',
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.help_outline,
                                  color: Colors.white,
                                  size: 54,
                                ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  currentPage == 0 ? const SizedBox(width: 30) : SizedBox(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Center(
              child: SizedBox(
                width: 500,
                height: 500,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                            // print(currentPage);
                          });
                        },
                        children: [
                          Image.network(
                            widget.pokemon.sprites.home,
                            fit: BoxFit.contain,
                          ),
                          Image.network(
                            widget.pokemon.sprites.homeShiny,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        2,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: const EdgeInsets.only(right: 5),
                          height: 6,
                          width: currentPage == index ? 20 : 6,
                          decoration: BoxDecoration(
                            color: currentPage == index
                                ? Colors.white
                                : Colors.white30,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      currentPage == 0 ? "Normal" : "Shiny",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF34C8E8), const Color(0xFF4E4AF2)],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      isDismissible: false,
                      enableDrag: true,
                      builder: (context) => DraggableSheet(
                        pokemon: widget.pokemon,
                        currentPage: currentPage,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Text(
                    'Show details',
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
