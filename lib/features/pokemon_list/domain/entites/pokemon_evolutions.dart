import 'package:equatable/equatable.dart';

class PokemonEvolutions extends Equatable {
  final int evolutionId;
  final List<Evolution> evolutions;

  const PokemonEvolutions({
    required this.evolutionId,
    required this.evolutions,
  });

  @override
  List<Object?> get props => [evolutionId, evolutions];
}

class Evolution extends Equatable {
  final String pokemonName;
  final List<String> evolves;

  const Evolution({
    required this.pokemonName,
    required this.evolves,
  });

  @override
  List<Object?> get props => [pokemonName, evolves];
}
