import 'package:shared_preferences/shared_preferences.dart';
import 'package:uca_walkmate/infrastructure/shared/services/key_value_storage.dart';

class KeyValueStorafeImpl implements KeyValueStorage {

  Future<SharedPreferences> getSharedPrefs() => SharedPreferences.getInstance();

  @override
  Future<T?> getValue<T>(String key) async {
    final prefs = await getSharedPrefs();

    switch (T) {
      case int:
        return prefs.getInt(key) as T?;
        
      case double:
        return prefs.getDouble(key) as T?;
        
      case String:
        return prefs.getString(key) as T?;
        
      case bool:
        return prefs.getBool(key) as T?;
        
      default:
        throw Exception('Type not supported: ${T.runtimeType}');
    }
  }

  @override
  Future<bool> removeKey(String key) async {
    final prefs = await getSharedPrefs();
    return await prefs.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final prefs = await getSharedPrefs();

    switch (T) {
      case int:
        prefs.setInt(key, value as int);
        break;

      case double:
        prefs.setDouble(key, value as double);
        break;

      case String:
        prefs.setString(key, value as String);
        break;

      case bool:
        prefs.setBool(key, value as bool);
        break;
        
      default:
        throw Exception('Type not supported: ${T.runtimeType}');
    }
  }

}