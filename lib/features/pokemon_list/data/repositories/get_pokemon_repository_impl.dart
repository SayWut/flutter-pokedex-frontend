import 'package:flutter_pokedex_frontend/core/error/exceptions.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/data/datasources/pokemon_remote_data_source.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon.dart';
import 'package:flutter_pokedex_frontend/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon_evolutions.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/entites/pokemon_info.dart';
import 'package:flutter_pokedex_frontend/features/pokemon_list/domain/repositories/get_pokemon_repository.dart';

class GetPokemonsRepositoryImpl extends GetPokemonsRepository {
  final PokemonRemoteDataSource remoteDataSource;

  GetPokemonsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemons(
      int offset, int limit) async {
    try {
      final pokemonList = await remoteDataSource.getPokemons(offset, limit);
      return Right(pokemonList);
    } on ServerException {
      return const Left(ServerFailure("Couldn't get pokemons list"));
    }
  }

  @override
  Future<Either<Failure, PokemonInfo>> getPokemonInfo(
      String pokemonName) async {
    try {
      final pokemonInfo = await remoteDataSource.getPokemonInfo(pokemonName);
      return Right(pokemonInfo);
    } on ServerException {
      return const Left(ServerFailure("Couldn't get pokemon info"));
    }
  }

  @override
  Future<Either<Failure, PokemonEvolutions>> getPokemonEvolutions(
      int evolutionId) async {
    try {
      final pokemonEvolution =
          await remoteDataSource.getPokemonEvolutions(evolutionId);
      return Right(pokemonEvolution);
    } on ServerException {
      return const Left(ServerFailure("Couldn't get pokemon info"));
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> searchPokemons(String search) async {
    try {
      final pokemonList = await remoteDataSource.searchPokemons(search);

      return Right(pokemonList);
    } on ServerException {
      return const Left(ServerFailure("Couldn't get pokemons list"));
    }
  }
}
