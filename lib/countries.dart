import 'package:dart_countries/dart_countries.dart';

List<Map<String, dynamic>> countryList = countries
    .map(
      (country) => {
        'name': country.name == 'United States'
            ? 'United States of America'
            : country.name,
        'code': country.isoCode,
      },
    )
    .toList();

Map<String, dynamic> selectedCountry =
    countryList.singleWhere((c) => c['name'] == 'United States of America');
