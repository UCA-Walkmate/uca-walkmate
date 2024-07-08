// Copyright 2024 UCA Walkmate
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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