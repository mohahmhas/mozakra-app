import 'package:e_store/core/di/get_it.dart';
import 'package:e_store/core/router/router.dart';
import 'package:e_store/core/theme/app_theme.dart';
import 'package:e_store/features/app/presentation/logic/cubit_localization/localization_cubit.dart';
import 'package:e_store/features/app/presentation/logic/cubit_theme/theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppMozakra extends StatelessWidget {
  const AppMozakra({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ThemeCubit>()..getTheme()),

        BlocProvider(
          create: (_) => getIt<LocalizationCubit>()..loadLanguage(context),
        ),
      ],

      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select(
      (ThemeCubit cubit) => cubit.state.themeMode,
    );
  
    return ScreenUtilInit(
      designSize: const Size(399, 844),

      minTextAdapt: true,
      splitScreenMode: true,
      enableScaleText: () => true,
      enableScaleWH: () => true,
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          themeAnimationCurve: Curves.easeIn,
          themeAnimationDuration: const Duration(milliseconds: 300),
          debugShowCheckedModeBanner: false,

          theme: AppTheme.lightTheme,

          darkTheme: AppTheme.darkTheme,

          themeMode: themeMode,

          locale: context.locale,

          supportedLocales: context.supportedLocales,

          localizationsDelegates: context.localizationDelegates,
        );
      },
    );
  }
}
