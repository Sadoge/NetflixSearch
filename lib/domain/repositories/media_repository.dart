import 'package:dartz/dartz.dart';
import 'package:netflix_worldwide_search/domain/entities/app_error.dart';
import 'package:netflix_worldwide_search/domain/entities/media_entity.dart';

abstract class MediaRepository {
  const MediaRepository();

  Future<Either<AppError, List<MediaEntity>>> searchMedia(String query);
}
