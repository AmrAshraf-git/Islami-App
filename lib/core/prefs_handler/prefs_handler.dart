import 'package:islami_c13_offline/core/resources/app_constant.dart';
import 'package:islami_c13_offline/model/sura.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PrefsHandler {

  static late SharedPreferences _sharedPreferences;

  static init() async {
    _sharedPreferences=await SharedPreferences.getInstance();
  }

  static void addSuraIndex(int suraIndex) async {


    //SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();

    //init();
    List<String> mostRecentSurasIndex =
        _sharedPreferences.getStringList('most_recent_suras') ?? [];
    if (mostRecentSurasIndex.length >= 3) {
      bool isRemoved = mostRecentSurasIndex.remove(mostRecentSurasIndex.first);
      print(isRemoved);
    }
    if (mostRecentSurasIndex.contains('$suraIndex')) {
      mostRecentSurasIndex.remove('$suraIndex');
      mostRecentSurasIndex.add('$suraIndex');
    } else {
      mostRecentSurasIndex.add('$suraIndex');
    }

    _sharedPreferences.setStringList("most_recent_suras", mostRecentSurasIndex);
  }

  static Future<List<Sura>> getMostRecentSuras() async {
    //SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    //init();
    List<String> mostRecentSurasIndex =
        _sharedPreferences.getStringList("most_recent_suras") ?? [];
    List<Sura> mostRecentSuras = [];
// ["1", "4", "5"]
    for (int i = 0; i < mostRecentSurasIndex.length; i++) {
      int suraIndex = int.parse(mostRecentSurasIndex[i]); // 4
      mostRecentSuras.add(AppConstant.suras[suraIndex]);
    }
    return mostRecentSuras.reversed.toList();
  }


  static setString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }
  static setBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }
  static setInt(String key, int value) async {
    await _sharedPreferences.setInt(key, value);
  }

  static String? getString(String key) {
    return _sharedPreferences.getString(key);
  }
  static bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }
  static int? getInt(String key) {
    return _sharedPreferences.getInt(key);
  }


}
