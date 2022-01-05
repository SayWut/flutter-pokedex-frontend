import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex_frontend/core/error/failures.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon_evolutions.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/repositories/get_pokemon_repository.dart';

class GetPokemonEvolutions {
  final GetPokemonsRepository repository;

  GetPokemonEvolutions(this.repository);

  Future<Either<Failure, PokemonEvolutions>> call(int evolutionId) async {
    return repository.getPokemonEvolutions(evolutionId);
  }
}
