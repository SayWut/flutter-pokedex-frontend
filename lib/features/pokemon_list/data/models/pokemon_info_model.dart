import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon_info.dart';

class PokemonInfoModel extends PokemonInfo {
  const PokemonInfoModel({
    required int pokemonId,
    required String name,
    required String sprite,
    required List<String> types,
    required int evolutionsId,
  }) : super(
          pokemonId: pokemonId,
          name: name,
          sprite: sprite,
          types: types,
          evolutionsId: evolutionsId,
        );

  factory PokemonInfoModel.fromJson(Map<String, dynamic> json) {
    return PokemonInfoModel(
      pokemonId: json["id"],
      name: json["name"],
      sprite: json["sprite"],
      types: List<String>.from(json["types"]),
      evolutionsId: json["evolutionsId"],
    );
  }
}
