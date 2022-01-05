import 'package:flutter/material.dart';
import 'package:flutter_pokedex_frontend/core/materials/max_width_padding.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/controllers/pokemon_data_controller.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/models/page_pokemon_data_model.dart';
import 'package:flutter_pokedex_frontend/core/widgets/bordered_text.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/widgets/pokemon_details.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/widgets/pokemon_evolutions.dart';
import 'package:get/get.dart';

class PokemonDataScreen extends GetView<PokemonDataController> {
  const PokemonDataScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (data) {
          PagePokemonDataModel pokemonData = data;

          return ListView(
            padding: MaxWidthPadding.responsive(
              context: context,
              top: 20,
              bottom: 20,
            ),
            children: [
              BorderedText(
                pokemonData.pokemonInfo.name.capitalize!,
                fontSize: 20,
                borderColor: Colors.blue,
                borderRadius: BorderRadius.circular(2),
                alignment: MainAxisAlignment.center,
              ),
              PokemonDetails(pokemonInfo: pokemonData.pokemonInfo),
              PokemonEvolutionsWidget(
                evolutionsInfo: pokemonData.evolutionsInfo,
                pokemonEvolutions: pokemonData.pokemonEvolutions,
              ),
            ],
          );
        },
      ),
    );
  }
}
