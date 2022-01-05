import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex_frontend/core/error/failures.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/repositories/get_pokemon_repository.dart';

class SearchPokemons {
  final GetPokemonsRepository repository;

  SearchPokemons(this.repository);

  Future<Either<Failure, List<Pokemon>>> call(String search) async {
    return await repository.searchPokemons(search);
  }
}
