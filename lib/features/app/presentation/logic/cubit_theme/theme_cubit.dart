import 'package:e_store/core/constants/cache_keys.dart';
import 'package:e_store/core/shared/helpers/cach.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.system));

  Future<void> toggleTheme(ThemeMode? theme) async {
    if (theme != null) {
      emit(state.copyWith(themeMode: theme));
      await CacheHelper.saveData(key: CacheKeys.theme, value: theme.name);
      return;
    }
  }

  Future<void> getTheme() async {
    final theme = await CacheHelper.getData(key: CacheKeys.theme);

    switch (theme) {
      case 'light':
        emit(state.copyWith(themeMode: ThemeMode.light));
        break;

      case 'dark':
        emit(state.copyWith(themeMode: ThemeMode.dark));
        break;

      default:
        emit(state.copyWith(themeMode: ThemeMode.system));
    }
  }
}
