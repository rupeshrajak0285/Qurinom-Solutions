



import '../../common_libraries.dart';

/// Singleton class for accessing shared prefs.
/// It contains all the key-value fields to be saved in the app.
class Prefs {
  Prefs._();

  static late SharedPreferences prefs;

  /// Must be called before any prefs operations
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  /// Define all your keys with appropriate types
  static final accessToken = SharedPrefValue<String>(PrefKeys.accessToken, prefs);
  static final userId = SharedPrefValue<String>(PrefKeys.userId, prefs);
  static final givenName = SharedPrefValue<String>(PrefKeys.givenName, prefs);


  /// Clears all shared preference data
  static void clear() {
    prefs.clear();
  }
}

class SharedPrefValue<T> {
  final String key;
  final SharedPreferences prefs;

  SharedPrefValue(this.key, this.prefs);

  void set(T value) {
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is List<String>) {
      prefs.setStringList(key, value);
    } else {
      throw Exception('Unsupported SharedPreferences type: ${value.runtimeType}');
    }
  }

  T? getSafe() {
    final value = prefs.get(key);
    if (value is T) return value;
    return null;
  }

  T getOrDefault(T def) {
    return getSafe() ?? def;
  }

  T get() {
    return getSafe() ?? _getDefaultValues();
  }

  void clear() {
    prefs.remove(key);
  }

  T _getDefaultValues() {
    if (T == int) {
      return -1 as T;
    } else if (T == String) {
      return "" as T;
    } else if (T == bool) {
      return false as T;
    } else if (T == double) {
      return 0.0 as T;
    } else if (T == List<String>) {
      return <String>[] as T;
    } else {
      throw Exception('Unsupported SharedPreferences default for type $T');
    }
  }
}
