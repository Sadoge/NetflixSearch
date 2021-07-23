import 'package:netflix_worldwide_search/data/core/api_client.dart';
import 'package:netflix_worldwide_search/data/models/media_model.dart';
import 'package:netflix_worldwide_search/data/models/media_result_model.dart';

abstract class MediaRemoteDataSource {
  const MediaRemoteDataSource();

  Future<List<MediaModel>> searchMedia(String query);
}

class MediaRemoteDataSourceImpl extends MediaRemoteDataSource {
  final ApiClient _client;

  const MediaRemoteDataSourceImpl(this._client);

  @override
  Future<List<MediaModel>> searchMedia(String query) async {
    final params = {
      'query': query,
      'start_year': 1900,
      'orderby': 'rating',
      'audiosubtitle_andor': 'and',
      'limit': 100,
      'subtitle': 'english',
      'end_year': DateTime.now().year,
    };

    final reponse = await _client.get('/search', parameters: params);
    final mediaList = MediaResultModel.fromJson(reponse).mediaList;

    return mediaList;
  }
}
