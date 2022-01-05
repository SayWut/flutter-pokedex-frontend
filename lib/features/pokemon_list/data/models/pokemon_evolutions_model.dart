import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon_evolutions.dart';

class PokemonEvolutionsModel extends PokemonEvolutions {
  const PokemonEvolutionsModel({
    required int evolutionId,
    required List<EvolutionModel> evolutions,
  }) : super(
          evolutionId: evolutionId,
          evolutions: evolutions,
        );

  factory PokemonEvolutionsModel.fromJson(Map<String, dynamic> json) {
    return PokemonEvolutionsModel(
      evolutionId: json["evolutionId"],
      evolutions: List.from(json["evolutions"])
          .map((evolution) => EvolutionModel.fromJson(evolution))
          .toList(),
    );
  }
}

class EvolutionModel extends Evolution {
  const EvolutionModel({
    required String pokemonName,
    required List<String> evolves,
  }) : super(
          pokemonName: pokemonName,
          evolves: evolves,
        );

  factory EvolutionModel.fromJson(Map<String, dynamic> json) {
    return EvolutionModel(
      pokemonName: json["pokemonName"],
      evolves: List.from(json["evolves"]),
    );
  }
}
