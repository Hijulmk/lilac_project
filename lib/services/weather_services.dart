import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lilac_project/model/weather.dart';

class WeatherService {
  Future<Weather> getWeatherData(String place) async {
    try {
      final queryParameters = {
        "key": "c0dbb6f1794640eeabf103014222805",
        "q": place,
      };
      final uri =
          Uri.http("api.weatherapi.com", "/v1/current.json", queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Couldn't Load Weather");
      }
    } catch (e) {
      rethrow;
    }
  }
}
