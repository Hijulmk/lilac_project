class Weather {
  final String name;
  final String region;
  final double temperatureC;
  final double temperatureF;
  final String condition;
  final String weatherIcon;
  final double windD;
  // final int humidityR;

  Weather({
    this.name = "",
    this.region ="",
    this.temperatureC = 0,
    this.temperatureF = 0,
    this.condition = "Sunny",
    this.weatherIcon ="Error",
    this.windD =0,
    // this.humidityR = 0,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json["location"]["name"],
      region: json["location"]["region"],
      temperatureC: json["current"]["temp_c"],
      temperatureF: json["current"]["temp_f"],
      windD: json["current"]["wind_kph"],
      // humidityR: json["location"]["name"],
      condition: json["current"]["condition"]["text"],
      weatherIcon: json["current"]["condition"]["icon"]
      
    );
  }
}
