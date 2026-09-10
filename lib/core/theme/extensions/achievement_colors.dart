import 'package:flutter/material.dart';

@immutable
class AchievementColors extends ThemeExtension<AchievementColors> {

  final Color gold;

  final Color silver;

  final Color bronze;

  final Color background;

  final Color border;

  const AchievementColors({

    required this.gold,

    required this.silver,

    required this.bronze,

    required this.background,

    required this.border,

  });

  @override
  AchievementColors copyWith({

    Color? gold,

    Color? silver,

    Color? bronze,

    Color? background,

    Color? border,

  }) {
    return AchievementColors(

      gold: gold ?? this.gold,

      silver: silver ?? this.silver,

      bronze: bronze ?? this.bronze,

      background: background ?? this.background,

      border: border ?? this.border,

    );
  }

  @override
  AchievementColors lerp(
      ThemeExtension<AchievementColors>? other,
      double t,
  ) {

    if(other is! AchievementColors){
      return this;
    }

    return AchievementColors(

      gold: Color.lerp(gold, other.gold, t)!,

      silver: Color.lerp(silver, other.silver, t)!,

      bronze: Color.lerp(bronze, other.bronze, t)!,

      background: Color.lerp(background, other.background, t)!,

      border: Color.lerp(border, other.border, t)!,

    );

  }

}

const lightAchievementColors = AchievementColors(

  gold: Color(0xffFBBF24),

  silver: Color(0xff94A3B8),

  bronze: Color(0xffB45309),

  background: Colors.white,

  border: Color(0xffE2E8F0),

);

const darkAchievementColors = AchievementColors(

  gold: Color(0xffFBBF24),

  silver: Color(0xffCBD5E1),

  bronze: Color(0xffB45309),

  background: Color(0xff1E293B),

  border: Color(0xff334155),

);