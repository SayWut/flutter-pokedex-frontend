import 'package:flutter/material.dart';
import 'package:flutter_pokedex_frontend/core/widgets/custom_image.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/models/page_pokemon_info_model.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/widgets/pokemon_type.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({
    Key? key,
    required this.pokemonInfo,
  }) : super(key: key);

  final PagePokemonInfoModel? pokemonInfo;

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      rowPadding: const EdgeInsets.symmetric(vertical: 20),
      columnPadding: const EdgeInsets.symmetric(vertical: 20),
      rowMainAxisAlignment: MainAxisAlignment.center,
      layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          child: CustomImage.network(
            url: pokemonInfo!.sprite,
            height: 430,
            width: 460,
            padding: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                ? const EdgeInsets.only(bottom: 20)
                : const EdgeInsets.only(right: 20),
          ),
        ),
        ResponsiveRowColumnItem(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 14),
                child: SelectableText(
                  "Types",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                width: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: pokemonInfo!.types.length,
                  itemBuilder: (_, index) {
                    final typeName = pokemonInfo!.types[index].toLowerCase();
                    return PokemonType.fromString(typeName);
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 5),
                ),
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: _buildTypes(),
              // ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildTypes() =>
      pokemonInfo!.types.map((type) => PokemonType.fromString(type)).toList();
}
