import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex_frontend/core/error/failures.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/repositories/get_pokemon_repository.dart';

class GetPokemons {
  final GetPokemonsRepository repository;

  GetPokemons(this.repository);

  Future<Either<Failure, List<Pokemon>>> call(int offset, int limit) async {
    return await repository.getPokemons(offset, limit);
  }
}
