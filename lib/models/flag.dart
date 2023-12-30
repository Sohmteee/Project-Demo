String getFlagPath(String countryName) =>
    'assets/flags/${countryName.toLowerCase().replaceAll(' ', '_')}.svg';
