import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lilac_project/model/weather_data.dart';
import 'package:lilac_project/services/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherData {
  Future<WeatherDataModel> fetch() async {
    final loc = await LocationService().getLocation();

    final result = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${loc.loc!.split(',').first}&lon=${loc.loc!.split(',').last}&appid=3916c535d795292aea3907369747064a'));
    final json = jsonDecode(result.body);
    return WeatherDataModel.fromJson(json);
  }

  saveData(WeatherDataModel newItem) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    final List<String> items = prefs.getStringList('items') ?? [];
    await prefs.setStringList('items', <String>[jsonEncode(newItem.toJson()), ...items]);
  }

 Future<List<WeatherDataModel>> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> items = prefs.getStringList('items') ?? [];
    return items.map((e) => WeatherDataModel.fromJson(jsonDecode(e))).toList();
  }
}
