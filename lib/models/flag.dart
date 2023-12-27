import 'package:countries_flag/countries_flag.dart';

getFlag(String countryName) {
  return CountriesFlag(
      'assets/flags/${countryName.toLowerCase().replaceAll(' ', '_')}.svg');
}
