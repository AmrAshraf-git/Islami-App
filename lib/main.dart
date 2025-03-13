import 'package:flutter/material.dart';
import 'package:islami_c13_offline/my_app.dart';

import 'core/prefs_handler/local_storage_key.dart';
import 'core/prefs_handler/prefs_handler.dart';
import 'core/routes_manager/routes_manager.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await PrefsHandler.init();
  bool isFirstRun=PrefsHandler.getBool(LocalStorageKeys.isFirstTimeRun)??true;
  String initialRoute=isFirstRun? RoutesManager.onboarding: RoutesManager.home;

  runApp(IslamiApp(initialRoute: initialRoute));
}
