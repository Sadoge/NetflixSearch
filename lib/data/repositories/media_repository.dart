import 'dart:io';

import 'package:netflix_worldwide_search/data/data_souces/media_remote_data_source.dart';
import 'package:netflix_worldwide_search/data/models/media_model.dart';
import 'package:netflix_worldwide_search/domain/entities/app_error.dart';
import 'package:netflix_worldwide_search/domain/repositories/media_repository.dart';

import 'package:dartz/dartz.dart';

class MediaRepositoryImpl extends MediaRepository {
  final MediaRemoteDataSource remoteDataSource;

  const MediaRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MediaModel>>> searchMedia(String query) async {
    try {
      final mediaList = await remoteDataSource.searchMedia(query);
      return Right(mediaList);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
