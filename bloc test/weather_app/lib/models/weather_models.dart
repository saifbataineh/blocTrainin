
import 'dart:convert';
import 'dart:developer';

class WeatherModels {
  final num currentTemp;
  final String currentSky;
  final num currentPressure;
  final num currentWindSpeed;
  final num currentHumidity;
  WeatherModels({
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
  });
  


  WeatherModels copyWith({
    num? currentTemp,
    String? currentSky,
    num? currentPressure,
    num? currentWindSpeed,
    num? currentHumidity,
  }) {
    return WeatherModels(
      currentTemp: currentTemp ?? this.currentTemp,
      currentSky: currentSky ?? this.currentSky,
      currentPressure: currentPressure ?? this.currentPressure,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentTemp': currentTemp,
      'currentSky': currentSky,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
    };
  }

  factory WeatherModels.fromMap(Map<String, dynamic> map) {
      
           /*  final data = snapshot.data!; */

          final currentWeatherData = map['list'][0];
log("line $currentWeatherData");
 
    return WeatherModels(
      currentTemp: currentWeatherData['main']['temp'] ,
      currentSky: currentWeatherData['weather'][0]['main'],
      currentPressure: currentWeatherData['main']['pressure'],
      currentWindSpeed: currentWeatherData['wind']['speed'],
      currentHumidity:currentWeatherData['main']['humidity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModels.fromJson(String source) => WeatherModels.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModels(currentTemp: $currentTemp, currentSky: $currentSky, currentPressure: $currentPressure, currentWindSpeed: $currentWindSpeed, currentHumidity: $currentHumidity)';
  }

  @override
  bool operator ==(covariant WeatherModels other) {
    if (identical(this, other)) return true;
  
    return 
      other.currentTemp == currentTemp &&
      other.currentSky == currentSky &&
      other.currentPressure == currentPressure &&
      other.currentWindSpeed == currentWindSpeed &&
      other.currentHumidity == currentHumidity;
  }

  @override
  int get hashCode {
    return currentTemp.hashCode ^
      currentSky.hashCode ^
      currentPressure.hashCode ^
      currentWindSpeed.hashCode ^
      currentHumidity.hashCode;
  }
}
