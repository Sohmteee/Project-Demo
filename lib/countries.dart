import 'package:dart_countries/dart_countries.dart';

List<Map<String, dynamic>> countryList = countries
    .map(
      (country) => {
        'name': country.name,
        'code': country.isoCode,
      },
    )
    .toList();
