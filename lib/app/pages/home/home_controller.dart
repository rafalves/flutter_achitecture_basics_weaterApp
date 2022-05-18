import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_basics/app/models/openweather_model.dart';
import 'package:flutter_architecture_basics/app/viewmodels/openweather_viewmodel.dart';

class HomeController {
  final OpenWeatherViewModel viewModel;

  HomeController({
    required this.viewModel,
  });

  ValueNotifier<OpenWeatherModel?> get weather => viewModel.openWeatherModel;

  getWeather() {
    viewModel.fill();
  }
}
