import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex_frontend/routes/app_pages.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/models/page_pokemon_model.dart';
import 'package:get/get.dart';

class PokemonCard extends StatelessWidget {
  final PagePokemonModel pokemonUi;

  const PokemonCard({Key? key, required this.pokemonUi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: InkWell(
        onTap: () =>
            Get.rootDelegate.toNamed(Routes.POKEMON_DETAILS(pokemonUi.name)),
        child: IgnorePointer(
          child: Column(
            children: [
              Expanded(child: pokemonUi.getSpriteNetwork()),
              SelectableText(
                pokemonUi.title,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
