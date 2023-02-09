import 'package:flutter/material.dart';
import 'package:lilac_project/services/weather.dart';

import '../model/weather_data.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: WeatherData().getData(),
        builder: (context, AsyncSnapshot<List<WeatherDataModel>> snapshot) {
          if (snapshot.hasData) {
            final list = snapshot.data;
            return 
            ListView.builder(
              itemCount: list!.length,
              itemBuilder: (context, index) => 
              
              Card(child: ListTile(title:const Text("Other Details") ,
              subtitle: Column(children: [
                Text("Clouds Condition: ${list[index].weather!.first.description!}"),
                Text("pressure : ${list[index].main!.pressure!}"),
                Text("Feels Like : ${list[index].main!.feelsLike!}")
              ]),)),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
