

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/models/weather_models.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
  on<WeatherFetched>(_getCurrentWeather);
  }
  void _getCurrentWeather(WeatherFetched event,Emitter<WeatherState> emit)async{
    try {
      emit(WeatherLoading());
      
    final weather =await weatherRepository.getCurrentWeather();
    emit(WeatherSuccess(weatherModels: weather));

    } catch (e) {
     emit(WeatherFailure(e.toString()));
    }

  }
}
