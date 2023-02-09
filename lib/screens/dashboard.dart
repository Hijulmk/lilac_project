import 'package:flutter/material.dart';
import 'package:lilac_project/screens/list_screen.dart';
import 'package:lilac_project/services/weather.dart';

import '../model/weather.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Weather weather = Weather();
  DateTime date = DateTime.now();

  String currentWeather = "";

  String location = "location";

  String temp = "0";

  String humidity = "";

  String wind = "";

  String sealevel = "";

  @override
  void initState() {
    super.initState();
    WeatherData().fetch().then((value) async {
      await WeatherData().saveData(value);
      setState(() {
        currentWeather = value.main!.feelsLike!.toString();
        temp = value.main!.temp!.toString();
        wind = 'speed:${value.wind!.speed}';
        humidity = value.main!.humidity!.toString();
        sealevel = value.main!.seaLevel!.toString();
      });
    });
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
                child: TextField(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListScreen(),
                        ));
                  },
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 05, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                  ),
                ),
              ),
              const Divider(),
              Center(
                child: Text(
                  location,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              Center(
                child: Text(
                  "$temp Temp",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500),
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
                              image: AssetImage("asset/images/wind.png"),
                              fit: BoxFit.fill,
                            ))),
                        const Text(
                          "wind",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          wind,
                          style: const TextStyle(
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
                              image: AssetImage("asset/images/humidity.png"),
                              fit: BoxFit.fill,
                            ))),
                        const Text(
                          "Humidity",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          humidity,
                          style: const TextStyle(
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
                              image: AssetImage("asset/images/sealvl.png"),
                              fit: BoxFit.fill,
                            ))),
                        const Text(
                          "Sea Level ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          sealevel,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
