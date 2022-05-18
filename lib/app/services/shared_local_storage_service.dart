import 'package:flutter_architecture_basics/app/interfaces/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLocalStorageService implements ILocalStorage {
  @override
  Future delete(String key) async {
    final shared = await SharedPreferences.getInstance();
    shared.remove(key);
  }

  @override
  Future get(String key) async {
    final shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  @override
  Future put(String key, value) async {
    final shared = await SharedPreferences.getInstance();
    if (value is bool) {
      shared.setBool(key, value);
    } else if (value is int) {
      shared.setInt(key, value);
    } else if (value is String) {
      shared.setString(key, value);
    } else if (value is double) {
      shared.setDouble(key, value);
    }
  }
}
