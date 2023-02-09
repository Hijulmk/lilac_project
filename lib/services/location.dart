import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lilac_project/model/location_model.dart';

class LocationService {
  Future<String> getIp() async {
    final result =
        await http.get(Uri.parse('https://api.ipify.org/?format=json'));
    print(result.body);
    return jsonDecode(result.body)['ip'].toString();
  }

  Future<LocationData> getLocation() async {
    String ip = await getIp();
    print(ip);
    final result = await http.get(Uri.parse('https://ipinfo.io/$ip/geo'));
    final json = jsonDecode(result.body);
    return LocationData.fromJson(json);
  }
}
