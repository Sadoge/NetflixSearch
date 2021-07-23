import 'package:equatable/equatable.dart';

class MediaEntity extends Equatable {
  final int id;
  final String title;
  final String img;
  final String vtype;
  final int avgRating;
  final int year;
  final int runtime;
  final String poster;
  final String clist;
  final String titleDate;

  const MediaEntity({
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
  });

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
