class Country {
  final int? id;
  final String name;
  final String countryCode;

  const Country({
    this.id,
    required this.name,
    required this.countryCode,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['country'],
      countryCode: json['countrycode'],
    );
  }
}
