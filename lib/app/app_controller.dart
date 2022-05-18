import 'package:flutter/foundation.dart';
import 'package:flutter_architecture_basics/app/services/shared_local_storage_service.dart';
import 'package:flutter_architecture_basics/app/viewmodels/change_theme_viewmodel.dart';

class AppController {
  static final AppController instance = AppController._();
  AppController._() {
    changeThemeViewModel.init();
  }

  final ChangeThemeViewModel changeThemeViewModel =
      ChangeThemeViewModel(storage: SharedLocalStorageService());

  bool get isDark => changeThemeViewModel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewModel.config.themeSwitch;
}
