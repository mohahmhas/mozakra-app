import 'package:e_store/core/constants/cache_keys.dart';
import 'package:e_store/core/shared/helpers/cach.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationState(locale: Locale('en')));

  Future<void> loadLanguage(BuildContext context) async {
    final savedLanguage = await CacheHelper.getData(key: CacheKeys.language);

    if (savedLanguage == null) {
      final systemLanguage =
          WidgetsBinding.instance.platformDispatcher.locale.languageCode;

      // await context.setLocale(Locale(systemLanguage));

      await CacheHelper.saveData(key: CacheKeys.language, value: systemLanguage);

      emit(state.copyWith(locale: Locale(systemLanguage)));

      return;
    }

    final locale = Locale(savedLanguage);

    // await context.setLocale(locale);

    await CacheHelper.saveData(key: CacheKeys.language, value: savedLanguage);

    emit(state.copyWith(locale: locale));
  }

  Future<void> changeLanguage(BuildContext context, String languageCode) async {
    final locale = Locale(languageCode);

    await context.setLocale(locale);

    await CacheHelper.saveData(key: CacheKeys.language, value: languageCode);

    emit(state.copyWith(locale: locale));
  }
}
