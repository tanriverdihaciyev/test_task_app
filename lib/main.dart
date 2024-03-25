import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:test_task_app/core/app.dart';
import 'package:test_task_app/core/resources/language_manager.dart';
import 'package:test_task_app/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initializeDependencies();
  runApp(EasyLocalization(
      supportedLocales: const [AZERBAIJAN_LOCAL, TURKISH_LOCAL, ENGLISH_LOCAL],
      path: ASSETS_PATH_LOCALISATIONS,
      child: Phoenix(child: const MyApp())));
}
