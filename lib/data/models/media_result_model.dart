import 'media_model.dart';

class MediaResultModel {
  final int total;
  final List<MediaModel> mediaList;

  MediaResultModel({
    required this.total,
    required this.mediaList,
  });

  factory MediaResultModel.fromJson(Map<String, dynamic> json) {
    final total = json['total'];
    final medias = <MediaModel>[];

    if (json['results'] != null) {
      json['results'].forEach((v) {
        medias.add(MediaModel.fromJson(v));
      });
    }

    return MediaResultModel(total: total, mediaList: medias);
  }
}
