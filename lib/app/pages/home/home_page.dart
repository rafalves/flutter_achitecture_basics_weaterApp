import 'package:flutter/material.dart';
import 'package:flutter_architecture_basics/app/pages/home/components/custom_switch_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: const Center(
        child: CustomSwitchWidget(),
      ),
    );
  }
}
