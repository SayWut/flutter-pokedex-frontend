import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/controllers/pokemons_controller.dart';
import 'package:flutter_pokedex_frontend/routes/app_pages.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: const Text("List"),
            onTap: () {
              TextEditingController textFieldController =
                  Get.find(tag: "appBarSearchController");
              textFieldController.text = "";
              var currentRoot = Get.rootDelegate.currentConfiguration;
              if (currentRoot!.currentPage!.name == Routes.POKEMONS) {
                PokemonController pokemonController = Get.find();
                pokemonController.textSearch.value = "";
              } else {
                Get.rootDelegate.toNamed(Routes.POKEMONS);
              }

              // closes drawer
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
