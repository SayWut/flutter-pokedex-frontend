// ignore_for_file: constant_identifier_names
// ignore_for_file: non_constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  static const POKEMONS = _Paths.POKEMONS;

  static String POKEMON_DETAILS(String pokemonName) => '$POKEMONS/$pokemonName';
}

abstract class _Paths {
  static const POKEMONS = '/pokemons';
  static const POKEMON_DETAILS = '/:name';
}
