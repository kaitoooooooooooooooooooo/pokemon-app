import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:client_pokemon/src/features/pokemon/domain/pokemon.dart';

class DraggableSheet extends StatefulWidget {
  final Pokemon pokemon;
  final int currentPage;
  const DraggableSheet({
    super.key,
    required this.pokemon,
    required this.currentPage,
  });

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
  int _selectedIndex = 0;

  Widget _buildTabButton(String title, int index) {
    bool isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedIndex = index),
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF323B4F)
                : const Color(0xFF28303F),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? Colors.grey.withValues(alpha: 0.2)
                    : const Color.fromARGB(0, 255, 255, 255),
                spreadRadius: 5,
                blurRadius: 7,
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                color: isSelected ? Colors.blue : Colors.white,
                fontSize: 15,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, int value) {
    final double percent = (value / 255).clamp(0.0, 1.0);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: GoogleFonts.poppins(color: Colors.white60, fontSize: 13),
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              value.toString(),
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: percent,
                minHeight: 8,
                backgroundColor: Colors.white12,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsTab() {
    final stats = widget.pokemon.stats;
    final statLabels = {
      'hp': 'HP',
      'attack': 'Attack',
      'defense': 'Defense',
      'specialAttack': 'Sp. Attack',
      'specialDefense': 'Sp. Defense',
      'speed': 'Speed',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: statLabels.entries.map((entry) {
        final value = stats[entry.key] ?? 0;
        return _buildStatRow(entry.value, value);
      }).toList(),
    );
  }

  Widget _buildInfoTab() {
    return Column(
      children: [
        widget.currentPage == 0
            ? Image.network(widget.pokemon.sprites.gif)
            : Image.network(widget.pokemon.sprites.gifShiny),
        _buildInfoRow("ID", "#${widget.pokemon.id}"),
        _buildInfoRow("Type", widget.pokemon.types.join(" / ")),
        _buildInfoRow("Height", "${widget.pokemon.height / 10} m"),
        _buildInfoRow("Weight", "${widget.pokemon.weight / 10} kg"),
        _buildInfoRow("Ability", widget.pokemon.abilities.first.name),
      ],
    );
  }

  Widget _buildEvoTab() {
    final family = widget.pokemon.evolution.family;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: family.map((member) {
        final isCurrent = member.id == widget.pokemon.id;
        final spriteUrl =
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${member.id}.png';
        final spriteUrl2 =
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/${member.id}.png';

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              widget.currentPage == 0 ? spriteUrl : spriteUrl2,
              width: 70,
              height: 70,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 6),
            Text(
              member.name[0].toUpperCase() + member.name.substring(1),
              style: GoogleFonts.poppins(
                color: isCurrent ? Colors.blue : Colors.white,
                fontSize: 13,
                fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
            Text(
              '#${member.id}',
              style: GoogleFonts.poppins(
                color: isCurrent ? Colors.blue : Colors.white38,
                fontSize: 11,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(color: Colors.white60, fontSize: 14),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      minChildSize: 0.35,
      maxChildSize: 1.0,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.06, -0.02),
              end: Alignment(0.51, 0.61),
              colors: [Color(0xFF353F53), Color(0xFF212734)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 50),
                  _buildTabButton("Info", 0),
                  const SizedBox(width: 40),
                  _buildTabButton("Stats", 1),
                  const SizedBox(width: 40),
                  _buildTabButton("Evo", 2),
                  const SizedBox(width: 50),
                ],
              ),
              const SizedBox(height: 40),
              IndexedStack(
                index: _selectedIndex,
                children: [_buildInfoTab(), _buildStatsTab(), _buildEvoTab()],
              ),
            ],
          ),
        );
      },
    );
  }
}
