import 'package:netflix_worldwide_search/domain/entities/media_entity.dart';

class MediaModel extends MediaEntity {
  final int id;
  final String title;
  final String img;
  final String vtype;
  final int? nfid;
  final String? synopsis;
  final int avgRating;
  final int year;
  final int runtime;
  final String? imdbid;
  final String poster;
  final double? imdbrating;
  final int? top250;
  final int? top250tv;
  final String clist;
  final String titleDate;

  MediaModel({
    required this.id,
    required this.title,
    required this.img,
    required this.vtype,
    required this.avgRating,
    required this.year,
    required this.runtime,
    required this.poster,
    required this.clist,
    required this.titleDate,
    this.nfid,
    this.synopsis,
    this.imdbid,
    this.imdbrating,
    this.top250,
    this.top250tv,
  }) : super(
          id: id,
          title: title,
          img: img,
          vtype: vtype,
          avgRating: avgRating,
          year: year,
          runtime: runtime,
          poster: poster,
          clist: clist,
          titleDate: titleDate,
        );

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      id: json['id'],
      title: json['title'],
      img: json['img'],
      vtype: json['vtype'],
      nfid: json['nfid'],
      synopsis: json['synopsis'],
      avgRating: json['avgrating'],
      year: json['year'],
      runtime: json['runtime'],
      imdbid: json['imdbid'],
      poster: json['poster'],
      imdbrating: json['imdbrating'],
      top250: json['top250'],
      top250tv: json['top250tv'],
      clist: json['clist'],
      titleDate: json['titledate'],
    );
  }
}
