import 'package:e_store/features/app/presentation/logic/cubit_localization/localization_cubit.dart';
import 'package:e_store/features/app/presentation/logic/cubit_theme/theme_cubit.dart';
import 'package:e_store/features/course/presentation/cubit/course_cubit.dart';
import 'package:e_store/features/details_course/presentation/cubit/course_details_cubit.dart';
import 'package:e_store/features/main_layout/presentation/cubit/cubit/bottom_nav_cubit.dart';
import 'package:e_store/features/onboarding_completed/presentation/cubit/onboarding_cubit.dart';
import 'package:e_store/features/otp/presentation/cubit/otp_cubit.dart';
import 'package:e_store/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  /// BLOCS
  _registerBlocs();

  /// SERVICES
  _registerServices();

  /// REPOSITORIES
  _registerRepositories();

  /// DATASOURCES
  _registerDataSources();
}

void _registerBlocs() {
  // App level
  getIt.registerLazySingleton(() => ThemeCubit());

  getIt.registerLazySingleton(() => LocalizationCubit());
  // Feature level
  getIt.registerFactory(() => BottomNavCubit());
  getIt.registerFactory(() => CourseDetailsCubit());
  getIt.registerFactory(() => CourseCubit());
  getIt.registerFactory(() => SplashCubit());
  getIt.registerFactory(() => OnboardingCubit());
  getIt.registerFactory(() => OtpCubit());
}

void _registerServices() {}

void _registerRepositories() {}

void _registerDataSources() {}
