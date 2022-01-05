import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex_frontend/core/error/failures.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon_info.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/repositories/get_pokemon_repository.dart';

class GetPokemonsInfo {
  final GetPokemonsRepository repository;

  GetPokemonsInfo(this.repository);

  Future<Either<Failure, PokemonInfo>> call(String pokemonName) async {
    return repository.getPokemonInfo(pokemonName);
  }
}
