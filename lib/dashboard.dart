import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lilac_project/model/weather.dart';
import 'package:lilac_project/services/weather_services.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  WeatherService weatherService = WeatherService();
  Weather weather = Weather();
  // DateTime date = DateTime.now();

  String currentWeather = "";
  double tempC = 0;
  double tempF = 0;
  double windD = 0;
  double HumidyT = 0;
  // late String dayName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeather();
  }

  void getWeather() async {
    weather = await weatherService.getWeatherData("chennai");
    setState(() {
      currentWeather = weather.condition;
      tempF = weather.temperatureF;
      tempC = weather.temperatureC;
      // windD = weather.windD;
      // HumidyT = weather.humidityR;
      // dayName = DateFormat('EEEE').format(date);
    });
    print(weather.temperatureC);
    print(weather.temperatureF);
    print(weather.condition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentWeather),
            Text(tempC.toString()),
            Text(tempF.toString()),
            // Text(dayName),
            Text(windD.toString())
          ],
        ),
      ),
    );
  }
}
