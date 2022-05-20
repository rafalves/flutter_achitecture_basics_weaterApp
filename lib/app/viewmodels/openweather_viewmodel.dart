import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_basics/app/interfaces/openweather_repository_interface.dart';
import 'package:flutter_architecture_basics/app/models/openweather_model.dart';

class OpenWeatherViewModel {
  final IOpenWeather repository;

  final openWeatherModel = ValueNotifier<OpenWeatherModel?>(null);

  OpenWeatherViewModel({
    required this.repository,
  });

  Future fill() async {
    try {
      openWeatherModel.value = await repository.getWeather();
    } catch (e) {
      print(e);
    }
  }
}
