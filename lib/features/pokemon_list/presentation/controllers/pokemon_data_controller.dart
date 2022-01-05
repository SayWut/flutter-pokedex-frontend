import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex_frontend/core/error/failures.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon_evolutions.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon_info.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/usecases/get_pokemon_evolutions.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/usecases/get_pokemon_info.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/models/page_pokemon_data_model.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/presentation/models/page_pokemon_info_model.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class PokemonDataController extends GetxController with StateMixin {
  final String? pokemonName;

  PokemonDataController(this.pokemonName);

  @override
  void onInit() {
    super.onInit();

    print(pokemonName);

    if (pokemonName != null) {
      getPokemonData(pokemonName!);
    } else {
      change(null, status: RxStatus.error());
    }
  }

  Future<void> getPokemonData(String pokemonName) async {
    final pokemonInfoRes = await getPokemonInfo(pokemonName);
    PokemonInfo? pokemonInfo;
    PokemonEvolutions? pokemonEvolutions;
    Map<String, PagePokemonInfoModel> evolutoinsInfo = {};

    pokemonInfoRes.fold(
      (failure) => change(null, status: RxStatus.error()),
      (info) => pokemonInfo = info,
    );

    if (pokemonInfo != null) {
      final evolutionId = pokemonInfo!.evolutionsId;
      final pokemonEvolutionsRes = await getPokemonEvolutions(evolutionId);

      pokemonEvolutionsRes.fold(
        (failure) => change(null, status: RxStatus.error()),
        (evolutions) => pokemonEvolutions = evolutions,
      );

      final evolutions = pokemonEvolutions!.evolutions;

      for (var i = 0; i < evolutions.length; i++) {
        final pokemonName = evolutions[i].pokemonName;
        final pokemonEvolutionInfo = await getPokemonInfo(pokemonName);

        pokemonEvolutionInfo.fold(
            (failure) => change(null, status: RxStatus.error()),
            (info) => evolutoinsInfo[pokemonName] =
                PagePokemonInfoModel.fromEntity(info));
      }

      PagePokemonDataModel pokemonData = PagePokemonDataModel.fromEntities(
        pokemonInfo!,
        pokemonEvolutions!,
        evolutoinsInfo,
      );

      change(pokemonData, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error());
    }
  }

  Future<Either<Failure, PokemonInfo>> getPokemonInfo(
      String pokemonName) async {
    GetPokemonsInfo usecase = Get.find();

    final result = await usecase(pokemonName);

    return result;
  }

  Future<Either<Failure, PokemonEvolutions>> getPokemonEvolutions(
      int evolutionId) async {
    GetPokemonEvolutions usecase = Get.find();

    final result = await usecase(evolutionId);

    return result;
  }
}
