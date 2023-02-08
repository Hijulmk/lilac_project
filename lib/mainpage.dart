import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lilac_project/services/weather_services.dart';

import 'model/weather.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}
// late final TextEditingController controller;

class _MainPageState extends State<MainPage> {
  WeatherService weatherService = WeatherService();
  Weather weather = Weather();
  DateTime date = DateTime.now();

  String currentWeather = "";
  String weatherIcons = "";
  double tempC = 0;
  double tempF = 0;
  // double humidityR = 0;

  late String dayName;
  late String dateTdy;

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
      weatherIcons = weather.weatherIcon;
      tempF = weather.temperatureF;
      tempC = weather.temperatureC;
      // humidityR = weather.humidityR;
      dayName = DateFormat('EEEE').format(date);
      dateTdy = DateFormat('yMd').format(date);
    });
    print(weather.temperatureC);
    print(weather.temperatureF);
    // print(weather.humidityR);
    print(weather.condition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Lilac Flutter Assignment",
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: Colors.grey.shade300,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: const TextField(
                  // controller: controller,
                  // onChanged: widget.onTextChanged ?? (text) {},
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 05, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Karachi",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        dayName,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          height: 120.0,
                          width: 120.0,
                          decoration:  BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                                weatherIcons),
                            fit: BoxFit.fill,
                          ))),
                      Text(
                        currentWeather,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      )
                    ],
                  )
                ],
              ),

              // const Divider(),
              // const SizedBox(
              //   height: 50,
              // ),

              const Divider(),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "$tempC °C",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              Center(
                child: Text(
                  dateTdy,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                  "asset/images/wind.png"),
                              fit: BoxFit.fill,
                            ))),
                        const Text(
                          "wind",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        const Text(
                          // humidityR.toString(),
                          "reading",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const VerticalDivider(),
                    Column(
                      children: [
                        Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                  "asset/images/humidity.png"),
                              fit: BoxFit.fill,
                            ))),
                        const Text(
                          "Humidity",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        const Text(
                          // humidityR.toString(),
                          "reading",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const VerticalDivider(),
                    Column(
                      children: [
                        Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                  "asset/images/fahrenheit.png"),
                              fit: BoxFit.fill,
                            ))),
                        const Text(
                          "Fahrenheit ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          tempF.toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
