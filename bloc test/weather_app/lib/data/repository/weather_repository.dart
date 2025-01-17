import 'dart:convert';

import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/models/weather_models.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository( this.weatherDataProvider);
  Future<WeatherModels> getCurrentWeather() async {

    try {
      String cityName = 'London';
final weatherData=await weatherDataProvider.getCurrentWeather(cityName);
print("line 15");
      final data = jsonDecode(weatherData);
print('line 17');
      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModels.fromMap(data);
    } catch (e) {
      print("hello");
      throw e.toString();
    }
  }
}