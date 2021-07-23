import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:netflix_worldwide_search/data/core/api_client.dart';
import 'package:netflix_worldwide_search/data/data_souces/media_remote_data_source.dart';
import 'package:netflix_worldwide_search/data/repositories/media_repository.dart';
import 'package:netflix_worldwide_search/domain/repositories/media_repository.dart';

//? GENERAL
final _apiClientProvider = Provider<ApiClient>((ref) => ApiClient(Client()));

//? MEDIA
final _mediaRemoteDataSourceProvider = Provider<MediaRemoteDataSource>(
  (ref) {
    final client = ref.read(_apiClientProvider);
    return MediaRemoteDataSourceImpl(client);
  },
);

final mediaRepositoryProvider = Provider<MediaRepository>(
  (ref) {
    final remoteDataSource = ref.read(_mediaRemoteDataSourceProvider);
    return MediaRepositoryImpl(remoteDataSource);
  },
);
