import 'package:client_pokemon/src/features/pokemon/domain/abilitie.dart';
import 'package:client_pokemon/src/features/pokemon/domain/evolution.dart';
import 'package:client_pokemon/src/features/pokemon/domain/familyMember.dart';
import 'package:client_pokemon/src/features/pokemon/domain/metadata.dart';
import 'package:client_pokemon/src/features/pokemon/domain/pokemon.dart';
import 'package:client_pokemon/src/features/pokemon/domain/sprite.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pokemon', () {
    late Pokemon bulbasaur;

    setUp(() {
      bulbasaur = Pokemon(
        id: 1,
        name: 'bulbasaur',
        types: ['grass', 'poison'],
        abilities: [
          const Abilitie(name: 'overgrow', hidden: false),
          const Abilitie(name: 'chlorophyll', hidden: true),
        ],
        height: 7,
        weight: 69,
        baseExperience: 64,
        stats: {
          'hp': 45,
          'attack': 49,
          'defense': 49,
          'specialAttack': 65,
          'specialDefense': 65,
          'speed': 45,
        },
        evolution: Evolution(
          family: [
            const FamilyMember(id: 1, name: 'bulbasaur'),
            const FamilyMember(id: 2, name: 'ivysaur'),
            const FamilyMember(id: 3, name: 'venusaur'),
          ],
          stage: 0,
          isFinal: false,
        ),
        sprites: const Sprites(
          official:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
          officialShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/1.png',
          home:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png',
          homeShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/1.png',
          gif:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/1.gif',
          gifShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/shiny/1.gif',
        ),
        metadata: const Metadata(generation: 'generation-i'),
      );
    });

    test('is correctly created', () {
      expect(bulbasaur.id, 1);
      expect(bulbasaur.name, 'bulbasaur');
      expect(bulbasaur.types.length, 2);
      expect(bulbasaur.abilities.length, 2);
    });

    test('has correct stats', () {
      final stats = {
        'hp': 45,
        'attack': 49,
        'defense': 49,
        'specialAttack': 65,
        'specialDefense': 65,
        'speed': 45,
      };
      expect(bulbasaur.stats, stats);
    });

    test('typeIconPaths returns correct asset paths', () {
      expect(bulbasaur.typeIconPaths, [
        'assets/icons/grass.png',
        'assets/icons/poison.png',
      ]);
    });

    test('evolution family is not final and has 3 members', () {
      expect(bulbasaur.evolution.isFinal, false);
      expect(bulbasaur.evolution.family.length, 3);
      expect(bulbasaur.evolution.family.first.name, 'bulbasaur');
    });
  });

  group('Abilitie', () {
    late Abilitie overgrow;
    late Abilitie chlorophyll;

    setUp(() {
      overgrow = const Abilitie(name: 'overgrow', hidden: false);
      chlorophyll = const Abilitie(name: 'chlorophyll', hidden: true);
    });

    test('is correctly created', () {
      expect(overgrow.name, 'overgrow');
      expect(overgrow.hidden, false);
    });

    test('hidden ability is correctly flagged', () {
      expect(chlorophyll.hidden, true);
    });

    test('two identical abilities are equal', () {
      const other = Abilitie(name: 'overgrow', hidden: false);
      expect(overgrow, other);
    });
  });

  group('Evolution', () {
    late Evolution evo;

    setUp(() {
      evo = Evolution(
        family: [
          const FamilyMember(id: 1, name: 'bulbasaur'),
          const FamilyMember(id: 2, name: 'ivysaur'),
          const FamilyMember(id: 3, name: 'venusaur'),
        ],
        stage: 0,
        isFinal: false,
      );
    });

    test('is correctly created', () {
      expect(evo.stage, 0);
      expect(evo.isFinal, false);
      expect(evo.family.length, 3);
    });

    test('family members are in correct order', () {
      expect(evo.family.first.name, 'bulbasaur');
      expect(evo.family.last.name, 'venusaur');
    });
  });
}
