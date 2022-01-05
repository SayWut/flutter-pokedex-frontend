import 'dart:convert';

import 'package:flutter_pokedex_frontend/core/error/exceptions.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/data/models/pokemon_evolutions_model.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/data/models/pokemon_info_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pokedex_frontend/features/pokemon_list/data/models/pokemon_model.dart';
import 'package:flutter_pokedex_frontend/core/config/environment.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemons(int offset, int limit);
  Future<PokemonInfoModel> getPokemonInfo(String pokemonName);
  Future<PokemonEvolutionsModel> getPokemonEvolutions(int evolutionId);
  Future<List<PokemonModel>> searchPokemons(String search);
}

class PokemonRemoteDataSourceImpl extends PokemonRemoteDataSource {
  @override
  Future<List<PokemonModel>> getPokemons(int offset, int limit) async {
    final listPokemonUrl =
        '${Environment.apiUrl}/pokemons?offset=$offset&limit=$limit';
    final data = await _requestData(listPokemonUrl);

    List<dynamic> pokemonsListJson = data;
    List<PokemonModel> pokemonList = pokemonsListJson.map((pokemonJson) {
      return PokemonModel.fromJson(pokemonJson);
    }).toList();

    return Future.value(pokemonList);
  }

  @override
  Future<PokemonInfoModel> getPokemonInfo(String pokemonName) async {
    final pokemonEvolutionsUrl = '${Environment.apiUrl}/pokemons/$pokemonName';
    final data = await _requestData(pokemonEvolutionsUrl);

    PokemonInfoModel pokemonInfo = PokemonInfoModel.fromJson(data);

    return Future.value(pokemonInfo);
  }

  @override
  Future<PokemonEvolutionsModel> getPokemonEvolutions(int evolutionId) async {
    final pokemonEvolutionsUrl =
        '${Environment.apiUrl}/evolutions/$evolutionId';
    final data = await _requestData(pokemonEvolutionsUrl);

    PokemonEvolutionsModel pokemonEvolutions =
        PokemonEvolutionsModel.fromJson(data);

    return Future.value(pokemonEvolutions);
  }

  @override
  Future<List<PokemonModel>> searchPokemons(String search) async {
    final listPokemonUrl = '${Environment.apiUrl}/pokemons?search=$search';
    final data = await _requestData(listPokemonUrl);

    List<dynamic> pokemonsListJson = data;
    List<PokemonModel> pokemonList = pokemonsListJson.map((pokemonJson) {
      return PokemonModel.fromJson(pokemonJson);
    }).toList();

    return Future.value(pokemonList);
  }

  Future<dynamic> _requestData(String apiUrl) async {
    final apiUri = Uri.parse(apiUrl);

    try {
      final response = await http.get(
        apiUri,
        headers: {
          "Content-Type": "application/json",
          'Access-Control-Allow-Methods': 'POST, GET, PUT, DELETE',
        },
      );

      if (response.statusCode == 200) {
        final resBody = response.body;
        final resJson = jsonDecode(resBody);

        final resData = resJson["data"];
        return Future.value(resData);
      }
    } catch (e) {}

    throw ServerException();
  }
}
