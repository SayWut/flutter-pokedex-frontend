import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int pokemonId;
  final String name;
  final String sprite;

  const Pokemon({
    required this.pokemonId,
    required this.name,
    required this.sprite,
  });

  @override
  List<Object?> get props => [pokemonId, name];
}
