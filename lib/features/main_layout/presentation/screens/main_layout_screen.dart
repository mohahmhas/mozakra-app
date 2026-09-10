import 'package:e_store/features/achievements/presentation/screens/achievement_screen.dart';
import 'package:e_store/features/community/presentation/screens/community_screen.dart';
import 'package:e_store/features/course/presentation/screens/course_screen..dart';
import 'package:e_store/features/home/presentation/screens/home_screen.dart';
import 'package:e_store/features/main_layout/presentation/cubit/cubit/bottom_nav_cubit.dart';
import 'package:e_store/features/main_layout/widgets/custom_bottom_nav_bar.dart';
import 'package:e_store/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: state.currentIndex,
              children: const [
                HomeScreen(),
                CourseScreen(),
                AchievementScreen(),
                CommunityScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: const CustomBottomNavBar(),
          );
        },
      ),
    );
  }
}
