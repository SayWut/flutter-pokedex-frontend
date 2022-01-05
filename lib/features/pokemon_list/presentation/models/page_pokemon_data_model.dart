import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon_evolutions.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon_info.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/models/page_pokemon_info_model.dart';

class PagePokemonDataModel {
  final PagePokemonInfoModel pokemonInfo;
  final PokemonEvolutions pokemonEvolutions;
  final Map<String, PagePokemonInfoModel> evolutionsInfo;

  const PagePokemonDataModel({
    required this.pokemonInfo,
    required this.pokemonEvolutions,
    required this.evolutionsInfo,
  });

  factory PagePokemonDataModel.fromEntities(
    PokemonInfo pokemonInfo,
    PokemonEvolutions pokemonEvolutions,
    Map<String, PagePokemonInfoModel> pokemonEvolutionsInfo,
  ) =>
      PagePokemonDataModel(
        pokemonInfo: PagePokemonInfoModel.fromEntity(pokemonInfo),
        pokemonEvolutions: PokemonEvolutions(
          evolutionId: pokemonEvolutions.evolutionId,
          evolutions: pokemonEvolutions.evolutions,
        ),
        evolutionsInfo: pokemonEvolutionsInfo,
      );
}
