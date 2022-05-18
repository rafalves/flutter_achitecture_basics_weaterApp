import 'package:flutter_architecture_basics/app/models/openweather_model.dart';

abstract class IOpenWeather {
  Future<OpenWeatherModel> getWeather();
}
