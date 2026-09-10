import 'package:flutter/material.dart';

@immutable
class StatisticsColors extends ThemeExtension<StatisticsColors> {
  final Color income;
  final Color expense;
  final Color students;
  final Color courses;
  final Color background;

  const StatisticsColors({
    required this.income,
    required this.expense,
    required this.students,
    required this.courses,
    required this.background,
  });

  @override
  StatisticsColors copyWith({
    Color? income,
    Color? expense,
    Color? students,
    Color? courses,
    Color? background,
  }) {
    return StatisticsColors(
      income: income ?? this.income,
      expense: expense ?? this.expense,
      students: students ?? this.students,
      courses: courses ?? this.courses,
      background: background ?? this.background,
    );
  }

  @override
  StatisticsColors lerp(
    covariant ThemeExtension<StatisticsColors>? other,
    double t,
  ) {
    if (other is! StatisticsColors) return this;

    return StatisticsColors(
      income: Color.lerp(income, other.income, t)!,
      expense: Color.lerp(expense, other.expense, t)!,
      students: Color.lerp(students, other.students, t)!,
      courses: Color.lerp(courses, other.courses, t)!,
      background: Color.lerp(background, other.background, t)!,
    );
  }
}
