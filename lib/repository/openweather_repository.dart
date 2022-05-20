import 'package:flutter_architecture_basics/app/interfaces/client_http_interface.dart';
import 'package:flutter_architecture_basics/app/models/openweather_model.dart';
import 'package:flutter_architecture_basics/app/interfaces/openweather_repository_interface.dart';
import 'package:flutter_architecture_basics/utils/utils.dart';

class OpenWeatherRepository implements IOpenWeather {
  final IClientHttp client;

  OpenWeatherRepository({required this.client});

  @override
  Future<OpenWeatherModel> getWeather() async {
    var json = await client.get(openWheaterUrl);
    OpenWeatherModel model = OpenWeatherModel.fromJson(json);
    return model;
  }
}
