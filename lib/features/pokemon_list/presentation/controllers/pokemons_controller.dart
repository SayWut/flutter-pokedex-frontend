import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/usecases/get_pokemon.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/usecases/search_pokemon.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/models/page_pokemon_model.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PokemonController extends GetxController {
  final pagingController =
      PagingController<int, PagePokemonModel>(firstPageKey: 0);
  RxString textSearch = "".obs;

  PokemonController({String? search}) {
    textSearch.value = search ?? "";
  }

  @override
  void onInit() {
    super.onInit();

    pagingController.addPageRequestListener((pageKey) {
      if (textSearch.value.isNotEmpty) {
        searchPokemons(textSearch.value);
      } else {
        getPokemonsPage(pageKey, 30);
      }
    });

    textSearch.listen((text) => pagingController.itemList = null);
  }

  Future<void> getPokemonsPage(offset, limit) async {
    GetPokemons usecase = Get.find();
    final usecaseResult = await usecase(offset, limit);

    usecaseResult.fold(
      (failure) => pagingController.error = failure,
      (pokemons) {
        var pokemonsUiModelList = pokemons
            .map((pokemon) => PagePokemonModel.fromEntity(pokemon))
            .toList();

        if (pokemonsUiModelList.length >= limit) {
          pagingController.appendPage(
              pokemonsUiModelList, offset + pokemonsUiModelList.length);
        } else {
          pagingController.appendLastPage(pokemonsUiModelList);
        }
      },
    );
  }

  Future<void> searchPokemons(String pokemonName) async {
    SearchPokemons usecase = Get.find();
    final usecaseResult = await usecase(pokemonName);

    usecaseResult.fold(
      (failure) => pagingController.error = failure,
      (pokemons) {
        var pokemonsUiModelList = pokemons
            .map((pokemon) => PagePokemonModel.fromEntity(pokemon))
            .toList();
        pagingController.appendLastPage(pokemonsUiModelList);
      },
    );
  }
}
