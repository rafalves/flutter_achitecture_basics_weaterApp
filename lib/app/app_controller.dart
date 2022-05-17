import 'package:flutter/foundation.dart';
import 'package:flutter_architecture_basics/app/interfaces/local_storage_interface.dart';
import 'package:flutter_architecture_basics/app/models/appconfig_model.dart';
import 'package:flutter_architecture_basics/app/services/shared_local_storage_service.dart';

class AppController {
  static final AppController instance = AppController._();
  AppController._() {
    storage.get('isDark').then((value) {
      if (value != null) {
        config.themeSwitch.value = value;
      }
    });
  }

  final ILocalStorage storage = SharedLocalStorageService();
  final AppConfigModel config = AppConfigModel();

  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  changeTheme(bool value) {
    config.themeSwitch.value = value;
    storage.put('isDark', value);
  }
}
