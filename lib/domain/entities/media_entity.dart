import 'package:equatable/equatable.dart';
import 'package:netflix_worldwide_search/data/models/country.dart';

class MediaEntity extends Equatable {
  final int id;
  final String title;
  final String img;
  final String vtype;
  final double avgRating;
  final int year;
  final int runtime;
  final List<Country> availableCountries;
  final String titleDate;

  const MediaEntity({
    required this.id,
    required this.title,
    required this.img,
    required this.vtype,
    required this.avgRating,
    required this.year,
    required this.runtime,
    required this.availableCountries,
    required this.titleDate,
  });

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
