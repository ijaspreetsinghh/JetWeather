import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

final String appId = 'b7d9097b677652a90a88c416828de4c5';

class Data extends ChangeNotifier {
  double lat = 0.000;
  double lon = 0.000;
  Position position;
  Map weatherData;
  var sunrise;
  var sunset;
  var temp;
  var feelsLike;
  var pressure;
  var humidity;
  var dewPoint;
  var uvi;
  var clouds;
  var visibility;
  var windSpeed;
  var windDeg;
  var weatherId;
  var weatherMain;
  var weatherDesc;
  var weatherIcon;
  final String appId = 'b7d9097b677652a90a88c416828de4c5';
  final String endpoint = "api.openweathermap.org";
  final String api = "data/2.5/onecall";

  Future getData() async {
    http.Response response = await http.get(Uri.https(endpoint, api, {
      "lat": "$lat",
      "lon": "$lon",
      "exclude": "minutely",
      "units": "metric",
      "appid": "$appId"
    }));
    if (response.statusCode == 200) {
      weatherData = jsonDecode(response.body);

      sunrise = weatherData['current']['sunrise'];
      weatherMain = weatherData['current']['weather'][0]['main'];
      temp = weatherData['current']['temp'];
      temp = temp.round();
      feelsLike = weatherData['current']['feels_like'];
      pressure = weatherData['current']['pressure'];
      humidity = weatherData['current']['humidity'];
      dewPoint = weatherData['current']['dew_point'];
      uvi = weatherData['current']['uvi'];
      clouds = weatherData['current']['clouds'];
      visibility = weatherData['current']['visibility'];
      visibility = (visibility / 1000).toInt();

      windSpeed = weatherData['current']['wind_speed'];
      windSpeed = (windSpeed * 3.6).toInt();
      windDeg = weatherData['current']['wind_deg'];
      weatherId = weatherData['current']['weather'][0]['id'];

      weatherDesc = weatherData['current']['weather'][0]['description'];
      weatherIcon = weatherData['current']['weather'][0]['icon'];
      notifyListeners();
    }
  }

  void getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    lon = position.longitude;
    notifyListeners();
    getData();
  }
}
