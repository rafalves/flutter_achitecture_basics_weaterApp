import 'package:flutter/material.dart';
import 'package:flutter_architecture_basics/app/models/openweather_model.dart';
import 'package:flutter_architecture_basics/app/pages/home/components/custom_switch_widget.dart';
import 'package:flutter_architecture_basics/app/pages/home/home_controller.dart';
import 'package:flutter_architecture_basics/app/services/client_http_services.dart';
import 'package:flutter_architecture_basics/app/viewmodels/openweather_viewmodel.dart';
import 'package:flutter_architecture_basics/repository/openweather_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(
    viewModel: OpenWeatherViewModel(
      repository: OpenWeatherRepository(
        client: ClientHttp(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        actions: const [
          Icon(Icons.lightbulb),
          CustomSwitchWidget(),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ValueListenableBuilder<OpenWeatherModel?>(
              valueListenable: controller.weather,
              builder: (context, value, child) {
                if (value == null) {
                  return const Text('Clique em carregar Clima');
                } else {
                  return Text(value.main!.temp.toString());
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getWeather();
        },
        child: const Icon(Icons.sunny_snowing),
      ),
    );
  }
}
