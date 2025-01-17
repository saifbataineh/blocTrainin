part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}
final class WeatherSuccess extends WeatherState {
  final WeatherModels weatherModels;
  WeatherSuccess({required this.weatherModels});
}
final class WeatherFailure extends WeatherState {
  final String errorMsg;
  WeatherFailure( this.errorMsg);
}
final class WeatherLoading extends WeatherState {}
