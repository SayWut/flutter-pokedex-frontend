import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex_frontend/core/error/failures.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon_evolutions.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon_info.dart';

abstract class GetPokemonsRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemons(int offset, int limit);
  Future<Either<Failure, PokemonInfo>> getPokemonInfo(String pokemonName);
  Future<Either<Failure, PokemonEvolutions>> getPokemonEvolutions(
      int evolutionId);
  Future<Either<Failure, List<Pokemon>>> searchPokemons(String search);
}
