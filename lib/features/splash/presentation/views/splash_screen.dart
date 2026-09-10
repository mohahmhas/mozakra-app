import 'package:e_store/core/enums/startup_status_enums.dart';
import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/router/routes.dart';
import 'package:e_store/core/shared/widgets/title_app.dart';
import 'package:e_store/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.92,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();

    initializeApp();
  }

  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 2));

    /// navigate
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        
    
        debugPrint('state.status ${state.status}');
        if (state.status == SplashStatusEnums.login) {
          GoRouter.of(context).pushReplacement(Routes.login);
        } else if (state.status == SplashStatusEnums.onboarding) {
         GoRouter.of(context).pushReplacement(Routes.onboarding);
 
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,

                child: ScaleTransition(
                  scale: _scaleAnimation,

                  child: Container(
                    height: 224.h,
                    width: 224.w,

                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Image.asset(
                      AppAssets.webPMuzakaraLogo,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              TitleApp(),
            ],
          ),
        ),
      ),
    );
  }
}
