import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:payung/feature/home/explore/home_explore.dart';

import '../../core/failure.dart';

abstract class HomeRepositoryProtocol {
  Future<Either<Failure, List<HomeExplore>>> getHomeExplore();
  Future<Either<Failure, Unit>> addHomeExplore(HomeExplore homeExplore);
  Future<Either<Failure, Unit>> clearHomeExplore();
}

class HomeRepository extends HomeRepositoryProtocol {
  final Box<HomeExplore> homeExploreBox;
  HomeRepository({
    required this.homeExploreBox,
  });

  @override
  Future<Either<Failure, List<HomeExplore>>> getHomeExplore() async {
    try {
      final List<HomeExplore> explores = homeExploreBox.values.toList();
      return Right(explores);
    } catch (e, stackTrace) {
      return Left(Failure(
        errorMessage: 'Failed To Load Home Explore',
        stackTrace: stackTrace,
      ));
    }
  }

  @override
  Future<Either<Failure, Unit>> addHomeExplore(HomeExplore homeExplore) async {
    try {
      homeExploreBox.add(homeExplore);
      return const Right(unit);
    } catch (e, stackTrace) {
      return Left(Failure(
        errorMessage: 'Failed To Add Home Explore',
        stackTrace: stackTrace,
      ));
    }
  }

  @override
  Future<Either<Failure, Unit>> clearHomeExplore() async {
    try {
      homeExploreBox.clear();
      return const Right(unit);
    } catch (e, stackTrace) {
      return Left(Failure(
        errorMessage: 'Failed To Clear Home Explore',
        stackTrace: stackTrace,
      ));
    }
  }
}
