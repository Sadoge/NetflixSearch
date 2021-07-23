import 'package:dartz/dartz.dart';
import 'package:netflix_worldwide_search/data/models/media_model.dart';
import 'package:netflix_worldwide_search/domain/entities/app_error.dart';

abstract class MediaRepository {
  const MediaRepository();

  Future<Either<AppError, List<MediaModel>>> searchMedia(String query);
}
