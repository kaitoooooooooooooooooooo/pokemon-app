# client_pokemon

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

```
client_pokemon
├─ .metadata
├─ analysis_options.yaml
├─ android
│  ├─ app
│  │  ├─ build.gradle.kts
│  │  └─ src
│  │     ├─ debug
│  │     │  └─ AndroidManifest.xml
│  │     ├─ main
│  │     │  ├─ AndroidManifest.xml
│  │     │  ├─ java
│  │     │  │  └─ io
│  │     │  │     └─ flutter
│  │     │  │        └─ plugins
│  │     │  │           └─ GeneratedPluginRegistrant.java
│  │     │  ├─ kotlin
│  │     │  │  └─ ch
│  │     │  │     └─ ceff
│  │     │  │        └─ client_pokemon
│  │     │  │           └─ MainActivity.kt
│  │     │  └─ res
│  │     │     ├─ drawable
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ drawable-v21
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ mipmap-hdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-mdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xxhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xxxhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ values
│  │     │     │  └─ styles.xml
│  │     │     └─ values-night
│  │     │        └─ styles.xml
│  │     └─ profile
│  │        └─ AndroidManifest.xml
│  ├─ build.gradle.kts
│  ├─ gradle
│  │  └─ wrapper
│  │     ├─ gradle-wrapper.jar
│  │     └─ gradle-wrapper.properties
│  ├─ gradle.properties
│  ├─ gradlew
│  ├─ gradlew.bat
│  ├─ local.properties
│  └─ settings.gradle.kts
├─ assets
│  ├─ 6.png
│  ├─ fonts
│  │  ├─ Pokemon Hollow.ttf
│  │  └─ Pokemon Solid.ttf
│  ├─ icons
│  │  ├─ bug.png
│  │  ├─ dark.png
│  │  ├─ dragon.png
│  │  ├─ electric.png
│  │  ├─ fairy.png
│  │  ├─ fighting.png
│  │  ├─ fire.png
│  │  ├─ flying.png
│  │  ├─ ghost.png
│  │  ├─ grass.png
│  │  ├─ ground.png
│  │  ├─ ice.png
│  │  ├─ normal.png
│  │  ├─ poison.png
│  │  ├─ psychic.png
│  │  ├─ rock.png
│  │  ├─ steel.png
│  │  └─ water.png
│  ├─ imgRectangle166.png
│  ├─ imgRectangle167.png
│  ├─ lottie
│  │  ├─ 001Bulbasaur.json
│  │  ├─ BasicLoadingProgressBar.json
│  │  ├─ Pikachu.json
│  │  └─ PokeballLoading.json
│  └─ Rectangle 1.png
├─ common_widget
│  └─ styled_text.dart
├─ flutter_native_splash.yaml
├─ lib
│  ├─ main.dart
│  └─ src
│     ├─ app.dart
│     ├─ constants
│     │  ├─ app_sizes.dart
│     │  ├─ pokemon_type_colors.dart
│     │  └─ test_pokemons.dart
│     ├─ features
│     │  └─ pokemon
│     │     ├─ data
│     │     │  ├─ local
│     │     │  │  └─ fake_pokemons_repository.dart
│     │     │  └─ remote
│     │     │     └─ pokemon_service.dart
│     │     ├─ domain
│     │     │  ├─ abilitie.dart
│     │     │  ├─ evolution.dart
│     │     │  ├─ familyMember.dart
│     │     │  ├─ metadata.dart
│     │     │  ├─ pokemon.dart
│     │     │  └─ sprite.dart
│     │     └─ presentation
│     │        ├─ pokemons_details
│     │        │  ├─ draggableSheet.dart
│     │        │  └─ pokemon_detail_screen.dart
│     │        ├─ pokemons_list
│     │        │  ├─ pokemons_list_screen.dart
│     │        │  ├─ pokemon_card.dart
│     │        │  └─ pokemon_card_one.dart
│     │        ├─ pokemons_pokedex
│     │        │  ├─ pokemons_pokedex_card.dart
│     │        │  └─ pokemons_pokedex_screen.dart
│     │        ├─ pokemons_research
│     │        │  └─ pokemons_research_screen.dart
│     │        └─ providers
│     │           └─ favorites_provider.dart
│     ├─ routes
│     │  └─ app.router.dart
│     └─ theme
│        └─ theme.dart
├─ pubspec.lock
├─ pubspec.yaml
├─ README.md
├─ test
└─ web
   ├─ favicon.png
   ├─ icons
   │  ├─ Icon-192.png
   │  ├─ Icon-512.png
   │  ├─ Icon-maskable-192.png
   │  └─ Icon-maskable-512.png
   ├─ index.html
   └─ manifest.json

```
```
client_pokemon
├─ .metadata
├─ analysis_options.yaml
├─ android
│  ├─ app
│  │  ├─ build.gradle.kts
│  │  └─ src
│  │     ├─ debug
│  │     │  └─ AndroidManifest.xml
│  │     ├─ main
│  │     │  ├─ AndroidManifest.xml
│  │     │  ├─ java
│  │     │  │  └─ io
│  │     │  │     └─ flutter
│  │     │  │        └─ plugins
│  │     │  │           └─ GeneratedPluginRegistrant.java
│  │     │  ├─ kotlin
│  │     │  │  └─ ch
│  │     │  │     └─ ceff
│  │     │  │        └─ client_pokemon
│  │     │  │           └─ MainActivity.kt
│  │     │  └─ res
│  │     │     ├─ drawable
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ drawable-v21
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ mipmap-hdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-mdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xxhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xxxhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ values
│  │     │     │  └─ styles.xml
│  │     │     └─ values-night
│  │     │        └─ styles.xml
│  │     └─ profile
│  │        └─ AndroidManifest.xml
│  ├─ build.gradle.kts
│  ├─ gradle
│  │  └─ wrapper
│  │     ├─ gradle-wrapper.jar
│  │     └─ gradle-wrapper.properties
│  ├─ gradle.properties
│  ├─ gradlew
│  ├─ gradlew.bat
│  ├─ local.properties
│  └─ settings.gradle.kts
├─ assets
│  ├─ 6.png
│  ├─ fonts
│  │  ├─ Pokemon Hollow.ttf
│  │  └─ Pokemon Solid.ttf
│  ├─ icons
│  │  ├─ bug.png
│  │  ├─ dark.png
│  │  ├─ dragon.png
│  │  ├─ electric.png
│  │  ├─ fairy.png
│  │  ├─ fighting.png
│  │  ├─ fire.png
│  │  ├─ flying.png
│  │  ├─ ghost.png
│  │  ├─ grass.png
│  │  ├─ ground.png
│  │  ├─ ice.png
│  │  ├─ normal.png
│  │  ├─ poison.png
│  │  ├─ psychic.png
│  │  ├─ rock.png
│  │  ├─ steel.png
│  │  └─ water.png
│  ├─ imgRectangle166.png
│  ├─ imgRectangle167.png
│  ├─ lottie
│  │  ├─ 001Bulbasaur.json
│  │  ├─ BasicLoadingProgressBar.json
│  │  ├─ BoxOpen.json
│  │  ├─ Pikachu.json
│  │  └─ PokeballLoading.json
│  └─ Rectangle 1.png
├─ common_widget
│  └─ styled_text.dart
├─ flutter_native_splash.yaml
├─ lib
│  ├─ main.dart
│  └─ src
│     ├─ app.dart
│     ├─ constants
│     │  ├─ app_sizes.dart
│     │  ├─ pokemon_type_colors.dart
│     │  └─ test_pokemons.dart
│     ├─ features
│     │  └─ pokemon
│     │     ├─ data
│     │     │  ├─ local
│     │     │  │  └─ fake_pokemons_repository.dart
│     │     │  └─ remote
│     │     │     └─ pokemon_service.dart
│     │     ├─ domain
│     │     │  ├─ abilitie.dart
│     │     │  ├─ evolution.dart
│     │     │  ├─ familyMember.dart
│     │     │  ├─ metadata.dart
│     │     │  ├─ pokemon.dart
│     │     │  └─ sprite.dart
│     │     └─ presentation
│     │        ├─ pokemons_details
│     │        │  ├─ draggableSheet.dart
│     │        │  └─ pokemon_detail_screen.dart
│     │        ├─ pokemons_list
│     │        │  ├─ pokemons_list_screen.dart
│     │        │  ├─ pokemon_card.dart
│     │        │  └─ pokemon_card_one.dart
│     │        ├─ pokemons_pokedex
│     │        │  ├─ pokemons_pokedex_card.dart
│     │        │  └─ pokemons_pokedex_screen.dart
│     │        ├─ pokemons_random
│     │        │  └─ pokemons_random_screen.dart
│     │        ├─ pokemons_research
│     │        │  └─ pokemons_research_screen.dart
│     │        └─ providers
│     │           └─ favorites_provider.dart
│     ├─ routes
│     │  └─ app.router.dart
│     └─ theme
│        └─ theme.dart
├─ pubspec.lock
├─ pubspec.yaml
├─ README.md
├─ test
│  └─ src
│     └─ features
│        └─ pokemon
│           └─ domain
│              └─ pokemon_test.dart
└─ web
   ├─ favicon.png
   ├─ icons
   │  ├─ Icon-192.png
   │  ├─ Icon-512.png
   │  ├─ Icon-maskable-192.png
   │  └─ Icon-maskable-512.png
   ├─ index.html
   └─ manifest.json

```