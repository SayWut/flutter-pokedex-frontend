import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    required int pokemonId,
    required String name,
    required String sprite,
  }) : super(
          pokemonId: pokemonId,
          name: name,
          sprite: sprite,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      pokemonId: json["id"],
      name: json["name"],
      sprite: json["sprite"],
    );
  }
}
