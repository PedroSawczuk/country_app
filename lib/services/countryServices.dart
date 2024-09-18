import 'package:dio/dio.dart';
import 'package:paises_app/models/countryModel.dart';

class CountryServices {
  final Dio _dio = Dio();

  Future<List<CountryModel>> fetchCountryInfo() async {
    try {
      final response =
          await _dio.get('https://restcountries.com/v3.1/lang/portuguese');
      if (response.statusCode == 200) {
        List<dynamic> results = response.data;
        return results
            .map((country) => CountryModel.fromJson(country))
            .toList();
      } else {
        print('ERRO!!! ${response.statusCode}');
        throw Exception('ERRO! :( ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
