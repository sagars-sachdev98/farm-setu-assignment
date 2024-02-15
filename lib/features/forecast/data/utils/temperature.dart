class Temperature {
  Temperature.celsius(this.celsius);
  factory Temperature.farhenheit(double farhenheit) =>
      Temperature.celsius((farhenheit - 32) / 1.8);
  factory Temperature.kelvin(double kelvin) =>
      Temperature.celsius(kelvin - absoluteZero);

  static double absoluteZero = 273.15;

  final double celsius;
  double get farhenheit => celsius * 1.8 + 32;
}

extension DoubleTemperatureConversion on double {
  Temperature get asCelsius => Temperature.celsius(this);

  Temperature asFahrenheit() => Temperature.farhenheit(this);

  Temperature asKelvin() => Temperature.kelvin(this);

  String temperatureToCelsius() {
    final celsiusTemp = Temperature.celsius(this);

    return '${celsiusTemp.celsius.toInt().toString()}°';
  }
}

extension WeatherIconUrlExtension on String {
  String get iconUrl2x => "https://openweathermap.org/img/wn/$this@2x.png";
  String get iconUrl4x => "https://openweathermap.org/img/wn/$this@4x.png";
}
