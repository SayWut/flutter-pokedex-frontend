import 'package:flutter/material.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/controllers/pokemons_controller.dart';
import 'package:flutter_pokedex_frontend/routes/app_pages.dart';
import 'package:get/get.dart' as getx;
import 'package:responsive_framework/responsive_framework.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController textFieldController =
        getx.Get.find(tag: "appBarSearchController");

    return AppBar(
      leading: ResponsiveVisibility(
        hiddenWhen: const [Condition.largerThan(name: TABLET)],
        child: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      actions: [
        ResponsiveVisibility(
          hiddenWhen: const [Condition.smallerThan(name: DESKTOP)],
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            child: const Text("List"),
            onPressed: () => searchPokemon(""),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => searchPokemon(textFieldController.text),
        ),
        Center(
          child: SizedBox(
            width: ResponsiveValue(
              context,
              defaultValue: 300.0,
              valueWhen: const [Condition.equals(name: MOBILE, value: 200.0)],
            ).value!,
            child: TextField(
              controller: textFieldController,
              onSubmitted: searchPokemon,
              maxLength: 30,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                counterText: "",
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                border: OutlineInputBorder(),
                hintText: 'Search',
              ),
            ),
          ),
        ),
      ],
    );
  }

  void searchPokemon(String searchText) {
    var currentRoot = getx.Get.rootDelegate.currentConfiguration;
    if (currentRoot!.currentPage!.name == Routes.POKEMONS) {
      PokemonController pokemonController = getx.Get.find();
      pokemonController.textSearch.value = searchText;
    } else {
      getx.Get.rootDelegate.toNamed(Routes.POKEMONS, arguments: searchText);
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
