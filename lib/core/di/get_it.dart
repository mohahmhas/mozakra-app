import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:e_store/core/network/api_client.dart';
import 'package:e_store/core/network/interceptors/auth_interceptor.dart';
import 'package:e_store/core/network/interceptors/logging_interceptor.dart';
import 'package:e_store/core/storage/secure_storage_service.dart';
import 'package:e_store/features/app/presentation/logic/cubit_localization/localization_cubit.dart';
import 'package:e_store/features/app/presentation/logic/cubit_theme/theme_cubit.dart';
import 'package:e_store/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:e_store/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:e_store/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:e_store/features/auth/domain/repositories/auth_repository.dart';
import 'package:e_store/features/course/presentation/cubit/course_cubit.dart';
import 'package:e_store/features/details_course/presentation/cubit/course_details_cubit.dart';
import 'package:e_store/features/main_layout/presentation/cubit/cubit/bottom_nav_cubit.dart';
import 'package:e_store/features/onboarding_completed/presentation/cubit/onboarding_cubit.dart';
import 'package:e_store/features/otp/presentation/cubit/otp_cubit.dart';
import 'package:e_store/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

const String apiBaseUrl = 'http://localhost:3000/api/v1';

Future<void> setupGetIt() async {
  /// CORE
  _registerNetwork();

  /// SERVICES
  _registerServices();

  /// DATASOURCES
  _registerDataSources();

  /// REPOSITORIES
  _registerRepositories();

  /// BLOCS
  _registerBlocs();
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

void _registerRepositories() {
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: getIt<AuthRemoteDataSource>(),secureStorage: getIt<SecureStorageService>()),
  );
}

void _registerDataSources() {
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiClient: getIt<ApiClient>()),
  );
}

void _registerNetwork() {
  // Secure Storage
  getIt.registerLazySingleton<SecureStorageService>(SecureStorageService.new);
  getIt.registerLazySingleton<PersistCookieJar>(() => PersistCookieJar());
  // Dio
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: apiBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        responseType: ResponseType.json,
      ),
    );
    dio.interceptors.add(CookieManager(getIt<PersistCookieJar>()));
    dio.interceptors.add(
      AuthInterceptor(dio: dio, secureStorage: getIt<SecureStorageService>()),
    );
    // Logging
    assert(() {
      dio.interceptors.add(LoggingInterceptor(enabled: true));
      return true;
    }());
    return dio;
  });

  // API Client
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(dio: getIt<Dio>()));

  /// Registers all BLoCs and Cubits. void _registerBlocs() {
  // ------------------------------------------------------------ // App-level Cubits // ------------------------------------------------------------
  //getIt.registerLazySingleton<ThemeCubit>( ThemeCubit.new, );
  // getIt.registerLazySingleton<LocalizationCubit>( LocalizationCubit.new, );
  //// ------------------------------------ // Feature-level Cubits // ----------------------
  /// getIt.registerFactory<BottomNavCubit>( BottomNavCubit.new, );
  /// getIt.registerFactory<CourseDetailsCubit>( CourseDetailsCubit.new, );
  /// getIt.registerFactory<CourseCubit>( CourseCubit.new, );
  /// getIt.registerFactory<SplashCubit>( SplashCubit.new, );
  /// getIt.registerFactory<OnboardingCubit>( OnboardingCubit.new, );
  /// getIt.registerFactory<OtpCubit>( OtpCubit.new, );
}
