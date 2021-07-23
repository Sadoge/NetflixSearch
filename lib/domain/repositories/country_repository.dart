import 'package:dartz/dartz.dart';
import 'package:netflix_worldwide_search/data/models/country.dart';
import 'package:netflix_worldwide_search/domain/entities/app_error.dart';

abstract class CountryRepository {
  const CountryRepository();

  Future<Either<AppError, List<Country>>> get();
}
