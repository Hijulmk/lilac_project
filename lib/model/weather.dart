class Weather {
  // final String name;
  // final String region;
  final double temperatureC;
  final double temperatureF;
  final String condition;
  final String weatherIcon;
  // final double windD;
  // final double humidityR;

  Weather({
    // this.name = "Kozhikode",
    // this.region ="Kerala",
    this.temperatureC = 0,
    this.temperatureF = 0,
    this.condition = "Sunny",
    this.weatherIcon ="Error"
    // this.windD =0,
    // this.humidityR = 0,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      // name: json["location"]["name"]["text"],
      // region: json["location"]["region"]["text"],
      temperatureC: json["current"]["temp_c"],
      temperatureF: json["current"]["temp_f"],
      // windD: json["current"]["wind_kph"],
      // humidityR: json["current"]["humidity"],
      condition: json["current"]["condition"]["text"],
      weatherIcon: json["current"]["condition"]["icon"]
      
    );
  }
}
