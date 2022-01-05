import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/controllers/pokemons_controller.dart';
import 'package:get/get.dart';
import '../features/pokemon_list/presentation/controllers/pokemon_data_controller.dart';
import '../features/pokemon_list/presentation/screens/pokemon_data_screen.dart';
import '../features/pokemon_list/presentation/screens/pokemons_screen.dart';
import '../router_view.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: "/",
      page: () => const RootView(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          name: _Paths.POKEMONS,
          page: () => const PokemonScreen(),
          transition: Transition.noTransition,
          binding: BindingsBuilder(() {
            Get.lazyPut(() {
              String? pokemonName = Get.rootDelegate.arguments();
              return PokemonController(search: pokemonName);
            });
          }),
          children: [
            GetPage(
              name: _Paths.POKEMON_DETAILS,
              transition: Transition.noTransition,
              page: () => const PokemonDataScreen(),
              binding: BindingsBuilder(() {
                Get.create(() {
                  String? pokemonName = Get.parameters["name"];
                  return PokemonDataController(pokemonName);
                });
              }),
            ),
          ],
        ),
      ],
    ),
  ];
}
