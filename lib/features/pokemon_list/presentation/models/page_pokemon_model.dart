import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon.dart';
import 'package:dartx/dartx.dart';

class PagePokemonModel extends Pokemon {
  const PagePokemonModel({
    required pokemonId,
    required name,
    required sprite,
  }) : super(pokemonId: pokemonId, name: name, sprite: sprite);

  factory PagePokemonModel.fromEntity(pokemonEntity) => PagePokemonModel(
        pokemonId: pokemonEntity.pokemonId,
        name: pokemonEntity.name,
        sprite: pokemonEntity.sprite,
      );

  String get title => '#$pokemonId\n${name.capitalize()}';

  Widget getSpriteNetwork() => Image.network(
        sprite,
        height: 300,
        width: 300,
        cacheHeight: 300,
        cacheWidth: 300,
      );
}
