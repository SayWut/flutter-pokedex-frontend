import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/data/datasources/pokemon_remote_data_source.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/data/repositories/get_pokemon_repository_impl.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/usecases/get_pokemon.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/usecases/get_pokemon_evolutions.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/usecases/get_pokemon_info.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/usecases/search_pokemon.dart';
import 'package:get/get.dart';

Future<void> initIngection() async {
  //datasources
  await Get.putAsync(() async => PokemonRemoteDataSourceImpl());

  //repositories
  await Get.putAsync(() async => GetPokemonsRepositoryImpl(
      remoteDataSource: Get.find<PokemonRemoteDataSourceImpl>()));

  //usecases
  await Get.putAsync(
      () async => GetPokemons(Get.find<GetPokemonsRepositoryImpl>()));
  await Get.putAsync(
      () async => GetPokemonsInfo(Get.find<GetPokemonsRepositoryImpl>()));
  await Get.putAsync(
      () async => GetPokemonEvolutions(Get.find<GetPokemonsRepositoryImpl>()));
  await Get.putAsync(
      () async => SearchPokemons(Get.find<GetPokemonsRepositoryImpl>()));

  //controllers
  await Get.putAsync(() async => TextEditingController(),
      tag: "appBarSearchController");
}
