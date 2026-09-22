import 'package:e_store/core/di/get_it.dart';
import 'package:e_store/core/router/routes.dart';
import 'package:e_store/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:e_store/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:e_store/features/auth/presentation/screens/login_screen.dart';
import 'package:e_store/features/course/presentation/cubit/course_cubit.dart';
import 'package:e_store/features/course/presentation/screens/course_screen..dart';
import 'package:e_store/features/details_course/presentation/cubit/course_details_cubit.dart';
import 'package:e_store/features/details_course/presentation/screens/course_details_screen.dart';
import 'package:e_store/features/course/domain/entities/course_entity.dart';
import 'package:e_store/features/main_layout/presentation/cubit/cubit/bottom_nav_cubit.dart';
import 'package:e_store/features/main_layout/presentation/screens/main_layout_screen.dart';
import 'package:e_store/features/onboarding_completed/presentation/cubit/onboarding_cubit.dart';
import 'package:e_store/features/onboarding_completed/presentation/screens/onboarding_screen.dart';
import 'package:e_store/features/otp/presentation/cubit/otp_cubit.dart';
import 'package:e_store/features/otp/presentation/screens/otp_screen.dart';
import 'package:e_store/features/profile/presentation/screens/profile_screen.dart';
import 'package:e_store/features/settings/presentation/screens/settings_screen.dart';
import 'package:e_store/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:e_store/features/splash/presentation/views/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<SplashCubit>()..checkAuthentication(),
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => getIt<OnboardingCubit>(),
            child: const OnboardingScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          );
        },
      ),

      GoRoute(
        path: Routes.otp,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => getIt<OtpCubit>()..startTimer(),
            child: const OtpScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: Routes.mainLayout,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<BottomNavCubit>()),

              // BlocProvider(
              //   create: (_) => getIt<HomeCubit>(),
              // ),
              // BlocProvider(
              //   create: (_) => getIt<ProfileCubit>(),
              // ),
              BlocProvider(create: (_) => getIt<CourseCubit>()),
            ],
            child: const MainLayoutScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.courseDetails,
        builder: (context, state) {
          final course = state.extra as CourseEntity;
          return BlocProvider(
            create: (context) => getIt<CourseDetailsCubit>(),
            child: CourseDetailsScreen(course: course),
          );
        },
      ),
      GoRoute(
        path: Routes.course,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<CourseCubit>(),
            child: CourseScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.settings,
        builder: (context, state) {
          return SettingsScreen();
        },
      ),
      GoRoute(
        path: Routes.forgotPassword,
        builder: (context, state) {
          return ForgotPasswordScreen();
        },
      ),
    ],
  );
}
