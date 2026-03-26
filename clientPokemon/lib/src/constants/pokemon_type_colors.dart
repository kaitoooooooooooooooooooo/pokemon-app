import 'package:flutter/material.dart';

class PokemonTypeColors {
  PokemonTypeColors._();

  static const Map<String, Color> colors = {
    'normal': Color(0xFF9099A1),
    'fire': Color(0xFFFF9C54),
    'water': Color(0xFF4D90D5),
    'grass': Color(0xFF63BB5B),
    'electric': Color(0xFFF3D23B),
    'ice': Color(0xFF74CEC0),
    'fighting': Color(0xFFCE4069),
    'poison': Color(0xFFAB6AC8),
    'ground': Color(0xFFD97746),
    'flying': Color(0xFF89AAE3),
    'psychic': Color(0xFFFA7179),
    'bug': Color(0xFF91C12F),
    'rock': Color(0xFFC7B78B),
    'ghost': Color(0xFF5269AC),
    'dragon': Color(0xFF0A6DC4),
    'dark': Color(0xFF5A5366),
    'steel': Color(0xFF5A8EA2),
    'fairy': Color(0xFFEC8FE6),
  };

  static const Color fallback = Color(0xFF9099A1);

  static Color fromType(String type) => colors[type.toLowerCase()] ?? fallback;
}
