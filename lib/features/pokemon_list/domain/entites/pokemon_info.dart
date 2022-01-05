import 'package:equatable/equatable.dart';

class PokemonInfo extends Equatable {
  final int pokemonId;
  final String name;
  final String sprite;
  final List<String> types;
  final int evolutionsId;

  const PokemonInfo({
    required this.pokemonId,
    required this.name,
    required this.sprite,
    required this.types,
    required this.evolutionsId,
  });

  @override
  List<Object?> get props => [pokemonId, name, sprite, types, evolutionsId];
}
