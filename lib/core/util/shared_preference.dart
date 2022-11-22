import 'package:file_manager/core/util/theme_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // Singleton
  static final SharedPreferenceHelper shared =
      SharedPreferenceHelper._privateConstructor();

  SharedPreferenceHelper._privateConstructor();

  final String _appTheme = "appTheme";

  Future<AppThemeKey> getAppTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return AppThemeKey.values.byName(prefs.getString(_appTheme)??AppThemeKey.light.name);
  }

  Future<bool> setAppTheme(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_appTheme, value);
  }
}
