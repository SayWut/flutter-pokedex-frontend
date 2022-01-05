import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex_frontend/core/materials/max_width_padding.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/controllers/pokemons_controller.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/models/page_pokemon_model.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/widgets/pokemon_card.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PokemonScreen extends GetView<PokemonController> {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagedGridView<int, PagePokemonModel>(
        padding: MaxWidthPadding.responsive(context: context),
        pagingController: controller.pagingController,
        showNoMoreItemsIndicatorAsGridChild: false,
        gridDelegate: const ResponsiveGridDelegate(
          maxCrossAxisExtent: 300,
          minCrossAxisExtent: 150,
        ),
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (_, pokemonUi, index) {
            return PokemonCard(pokemonUi: pokemonUi);
          },
        ),
      ),
    );
  }
}
