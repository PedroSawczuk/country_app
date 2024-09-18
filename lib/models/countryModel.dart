class CountryModel {
  final String name;
  final String flag;
  final String region;
  final String googleMaps;
  final int population;

  CountryModel({
    required this.name,
    required this.flag,
    required this.region,
    required this.googleMaps,
    required this.population,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name']['common'],
      flag: json['flags']['png'],
      region: json['region'],
      googleMaps: json['maps']['googleMaps'],
      population: json['population'],
    );
  }
}
