import 'package:flutter/material.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon_evolutions.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/models/page_pokemon_info_model.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/widgets/pokemon_evolution.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PokemonEvolutionsWidget extends StatelessWidget {
  final PokemonEvolutions pokemonEvolutions;
  final Map<String, PagePokemonInfoModel> evolutionsInfo;

  const PokemonEvolutionsWidget({
    Key? key,
    required this.pokemonEvolutions,
    required this.evolutionsInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(2),
        ),
        child: buildEvolutionsTree(context),
      ),
    );
  }

  Widget buildEvolutionsTree(BuildContext context) => buildEvolutionsTreeWrap(
      context, pokemonEvolutions.evolutions[0].pokemonName);

  Widget buildEvolutionsTreeWrap(BuildContext context, String pokemonName) {
    final nextEvolution = pokemonEvolutions.evolutions
        .firstWhere((element) => element.pokemonName == pokemonName);
    final evolutionTreeWidget = <ResponsiveRowColumnItem>[];

    final pokemonEvolutionName = nextEvolution.pokemonName;
    final evolutionInfo = evolutionsInfo[pokemonEvolutionName]!;

    for (var i = 0; i < nextEvolution.evolves.length; i++) {
      final nextEvolutionName = nextEvolution.evolves[i];

      evolutionTreeWidget.add(
        ResponsiveRowColumnItem(
            child: buildEvolutionsTreeWrap(context, nextEvolutionName)),
      );
    }

    return ResponsiveRowColumn(
      rowMainAxisAlignment: MainAxisAlignment.center,
      rowMainAxisSize: MainAxisSize.min,
      columnMainAxisSize: MainAxisSize.min,
      layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
            child: PokemonEvolutionWidget(
          evolutionInfo: evolutionInfo,
          drawArrow: !_isBasePokemon(pokemonName),
        )),
        ResponsiveRowColumnItem(
          child: ResponsiveRowColumn(
            rowMainAxisSize: MainAxisSize.min,
            columnMainAxisSize: MainAxisSize.min,
            layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                ? ResponsiveRowColumnType.ROW
                : ResponsiveRowColumnType.COLUMN,
            children: evolutionTreeWidget,
          ),
        ),
      ],
    );
  }

  bool _isBasePokemon(String pokemonName) =>
      pokemonEvolutions.evolutions[0].pokemonName == pokemonName;
}
