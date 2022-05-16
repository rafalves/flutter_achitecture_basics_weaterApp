import 'package:flutter/material.dart';
import 'package:flutter_architecture_basics/app/app_controller.dart';

class CustomSwitchWidget extends StatefulWidget {
  const CustomSwitchWidget({Key? key}) : super(key: key);

  @override
  State<CustomSwitchWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  bool status = AppController.instance.isDark;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: status,
      onChanged: (value) {
        AppController.instance.changeTheme(value);
        setState(() {
          status = value;
        });
      },
    );
  }
}
