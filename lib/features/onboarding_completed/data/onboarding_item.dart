import 'package:e_store/core/generated/app_assets.dart';

class OnboardingItem {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingItem({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

final onboardingItems = [
  OnboardingItem(
    image: AppAssets.webPOnBoarding1,
    title: 'Learn Anywhere',
    subtitle: 'Access your courses anytime and anywhere.',
  ),

  OnboardingItem(
    image: AppAssets.webPOnBoarding2,
    title: 'Track Progress',
    subtitle: 'Monitor your learning journey and achievements.',
  ),

  OnboardingItem(
    image: AppAssets.webPOnBoarding3,
    title: 'Join Community',
    subtitle: 'Connect with students and instructors.',
  ),
];
