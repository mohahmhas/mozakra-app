import 'package:flutter/material.dart';

class AchievementEntity {
  final String id;
  final String name;
  final String image;
  final String achievement;
  final Color colorIcon;
  final Color colorBg;
  AchievementEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.achievement,
    required this.colorIcon,
    required this.colorBg,
  });
}
