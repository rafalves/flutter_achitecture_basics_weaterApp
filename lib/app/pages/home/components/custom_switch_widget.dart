import 'package:flutter/material.dart';
import 'package:flutter_architecture_basics/app/app_controller.dart';

class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppController.instance.themeSwitch,
      builder: (context, value, _) {
        return Switch(
          value: AppController.instance.isDark,
          onChanged: (value) {
            AppController.instance.changeThemeViewModel.changeTheme(value);
          },
        );
      },
    );
  }
}
