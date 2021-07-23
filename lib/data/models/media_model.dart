import 'package:netflix_worldwide_search/data/models/country.dart';
import 'package:netflix_worldwide_search/domain/entities/media_entity.dart';

class MediaModel extends MediaEntity {
  final int? nfid;
  final String? synopsis;
  final String? imdbid;
  final double? imdbrating;
  final int? top250;
  final int? top250tv;
  final String? poster;

  MediaModel({
    required int id,
    required String title,
    required String img,
    required String vtype,
    required double avgRating,
    required int year,
    required int runtime,
    required List<Country> availableCountries,
    required String titleDate,
    this.poster,
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
          availableCountries: availableCountries,
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
      availableCountries: _convertToList(json['clist']),
      titleDate: json['titledate'],
    );
  }
}

List<Country> _convertToList(String? clist) {
  if ((clist?.isEmpty ?? true)) {
    return [];
  }

  final countryStringList = clist!.split(',');

  final countries = <Country>[];

  for (var countryStr in countryStringList) {
    final countryParts = countryStr.split(':');
    countries.add(
      Country(
        countryCode: countryParts.first.replaceAll('"', ''),
        name: countryParts.last.replaceAll('"', ''),
      ),
    );
  }

  return countries;
}
