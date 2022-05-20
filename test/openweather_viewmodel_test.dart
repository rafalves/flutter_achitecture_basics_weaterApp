import 'package:flutter_architecture_basics/app/interfaces/client_http_interface.dart';
import 'package:flutter_architecture_basics/app/models/openweather_model.dart';

import 'package:flutter_architecture_basics/app/viewmodels/openweather_viewmodel.dart';
import 'package:flutter_architecture_basics/repository/openweather_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class ClientHttpErrorMock implements IClientHttp {
  @override
  void add(String token) {}

  @override
  Future<Map<String, dynamic>> get(String url) async {
    return <String, dynamic>{};
  }
}

class ClientHttpMock implements IClientHttp {
  @override
  void add(String token) {}

  @override
  Future<Map<String, dynamic>> get(String url) async {
    return OpenWeatherModel(
            coord: Coord(lat: -46.6361, lon: -23.5475),
            weather: [
              Weather(
                  id: 803,
                  main: 'Clouds',
                  description: 'Broken clouds',
                  icon: '04d')
            ],
            base: 'stations',
            main: Main(
                temp: 15.31,
                feelsLike: 14.75,
                tempMin: 15.2,
                tempMax: 16.94,
                pressure: 1024,
                humidity: 71),
            visibility: 10000,
            wind: Wind(speed: 3.13, deg: 65, gust: 3.58),
            clouds: Clouds(all: 75),
            dt: 1653059204,
            sys: Sys(
                type: 2,
                id: 2033898,
                country: 'BR',
                sunrise: 1653039349,
                sunset: 1653078637),
            timezone: -10800,
            id: 3448439,
            name: 'São Paulo',
            cod: 200)
        .toJson();
  }
}

main() {
  group('OpenWeatherViewModel', () {
    test('OpenWeatherViewModel null values if error in ClientHttp', () async {
      final viewModel = OpenWeatherViewModel(
        repository: OpenWeatherRepository(
          client: ClientHttpErrorMock(),
        ),
      );
      await viewModel.fill();
      expect(viewModel.openWeatherModel.value?.main, null);
    });

    test('OpenWeatherViewModel sucess', () async {
      final viewModel = OpenWeatherViewModel(
        repository: OpenWeatherRepository(
          client: ClientHttpMock(),
        ),
      );
      await viewModel.fill();
      expect(viewModel.openWeatherModel.value, isA<OpenWeatherModel>());
    });
  });
}
