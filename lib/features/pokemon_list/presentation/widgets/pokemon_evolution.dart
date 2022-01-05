import 'package:flutter/material.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/models/page_pokemon_info_model.dart';
import 'package:get/get.dart' as getx;
import 'package:responsive_framework/responsive_framework.dart';

class PokemonEvolutionWidget extends StatelessWidget {
  final PagePokemonInfoModel evolutionInfo;
  final bool drawArrow;

  const PokemonEvolutionWidget({
    Key? key,
    required this.evolutionInfo,
    this.drawArrow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      rowMainAxisSize: MainAxisSize.min,
      columnMainAxisSize: MainAxisSize.min,
      layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          child: _drawArrow(context),
        ),
        ResponsiveRowColumnItem(
          child: InkWell(
            onTap: () => getx.Get.rootDelegate
                .toNamed("/pokemons/${evolutionInfo.name}"),
            child: IgnorePointer(
              child: Column(
                children: [
                  Card(
                    shape: const CircleBorder(),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.grey,
                        child: evolutionInfo.getSpriteImage(120, 120),
                      ),
                    ),
                  ),
                  SelectableText(
                    evolutionInfo.title(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _drawArrow(BuildContext context) {
    if (drawArrow) {
      return ResponsiveValue(
        context,
        defaultValue: const Icon(Icons.keyboard_arrow_right, size: 50),
        valueWhen: [
          const Condition.smallerThan(
            name: TABLET,
            value: Icon(Icons.keyboard_arrow_down, size: 50),
          ),
        ],
      ).value!;
    }

    return const SizedBox();
  }
}
