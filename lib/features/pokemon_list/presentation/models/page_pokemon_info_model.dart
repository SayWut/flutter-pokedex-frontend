import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon_info.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/widgets/pokemon_type.dart';

class PagePokemonInfoModel extends PokemonInfo {
  const PagePokemonInfoModel({
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

  factory PagePokemonInfoModel.fromEntity(PokemonInfo entity) =>
      PagePokemonInfoModel(
        pokemonId: entity.pokemonId,
        name: entity.name,
        sprite: entity.sprite,
        types: entity.types,
        evolutionsId: entity.evolutionsId,
      );

  String title() => "#$pokemonId\n$name";

  List<PokemonType> get typesWidget =>
      types.map((type) => PokemonType.fromString(type)).toList();

  Image getSpriteImage(int width, int height) => Image.network(
        sprite,
        height: height.toDouble(),
        width: width.toDouble(),
        cacheHeight: height,
        cacheWidth: width,
        fit: BoxFit.cover,
      );
}
