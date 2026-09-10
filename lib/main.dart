import 'package:e_store/core/di/get_it.dart';
import 'package:e_store/core/shared/helpers/cach.dart';
import 'package:e_store/features/app/presentation/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timeago/timeago.dart' as timeago_ar;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  timeago.setLocaleMessages('ar', timeago_ar.ArMessages());

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await EasyLocalization.ensureInitialized();

  await initializeServices();
  await setupGetIt();

  FlutterNativeSplash.remove();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const AppMozakra(),
    ),
  );
}

Future<void> initializeServices() async {
  await CacheHelper.init();
  await Future.delayed(const Duration(milliseconds: 500));
}
